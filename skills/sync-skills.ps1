$ErrorActionPreference = "Stop"

# Sincroniza as skills para as pastas que o Codex (.agents\skills) e o
# Claude Code (.claude\skills) descobrem sozinhos.
#
# Duas fontes:
#   skills\os\      skills do produto (atualizadas por /atualizar-os)
#   skills\minhas\  skills criadas pelo usuario (nunca tocadas pela atualizacao)
#
# As pastas de destino sao geradas: qualquer coisa criada direto nelas some na
# proxima sincronizacao. Skill nova do usuario nasce em skills\minhas\<nome>\.

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OsRoot = Split-Path -Parent $ScriptDir
$ProductDir = Join-Path $ScriptDir "os"
$UserDir = Join-Path $ScriptDir "minhas"

if (-not (Test-Path $ProductDir -PathType Container)) {
    throw "Skills do produto nao encontradas em $ProductDir"
}

$Merged = Join-Path ([System.IO.Path]::GetTempPath()) ("os-head-ia-skills-" + [System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Force -Path $Merged | Out-Null

try {
    $ProductCount = 0
    $UserCount = 0

    foreach ($SkillDir in (Get-ChildItem -Force -Path $ProductDir -Directory)) {
        Copy-Item -Recurse -Force -LiteralPath $SkillDir.FullName -Destination (Join-Path $Merged $SkillDir.Name)
        $ProductCount++
    }

    if (Test-Path $UserDir -PathType Container) {
        foreach ($SkillDir in (Get-ChildItem -Force -Path $UserDir -Directory)) {
            if (-not (Test-Path (Join-Path $SkillDir.FullName "SKILL.md") -PathType Leaf)) {
                Write-Warning "skills\minhas\$($SkillDir.Name) nao tem SKILL.md; ignorada."
                continue
            }
            $Destination = Join-Path $Merged $SkillDir.Name
            if (Test-Path $Destination) {
                throw "skills\minhas\$($SkillDir.Name) tem o mesmo nome de uma skill do produto. Renomeie a sua."
            }
            Copy-Item -Recurse -Force -LiteralPath $SkillDir.FullName -Destination $Destination
            $UserCount++
        }
    }


    # Sincroniza NO LUGAR, sem apagar e recriar a pasta inteira. Apagar e recriar numa
    # pasta sincronizada (OneDrive, iCloud, Dropbox) gera copias de conflito como "sessao 2".
    foreach ($TargetRoot in @((Join-Path $OsRoot ".agents\skills"), (Join-Path $OsRoot ".claude\skills"))) {
        New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
        foreach ($Entry in @(Get-ChildItem -LiteralPath $TargetRoot -Force)) {
            if (-not (Test-Path (Join-Path $Merged $Entry.Name) -PathType Container)) {
                Remove-Item -Recurse -Force -LiteralPath $Entry.FullName
            }
        }
        foreach ($Item in (Get-ChildItem -Force -Path $Merged -Directory)) {
            $Dest = Join-Path $TargetRoot $Item.Name
            New-Item -ItemType Directory -Force -Path $Dest | Out-Null
            $SrcFull = (Resolve-Path -LiteralPath $Item.FullName).Path
            foreach ($F in @(Get-ChildItem -LiteralPath $SrcFull -Recurse -Force)) {
                $Rel = $F.FullName.Substring($SrcFull.Length).TrimStart([char[]]@('\', '/'))
                $To = Join-Path $Dest $Rel
                if ($F.PSIsContainer) { New-Item -ItemType Directory -Force -Path $To | Out-Null }
                else {
                    $Same = (Test-Path -LiteralPath $To -PathType Leaf) -and ((Get-FileHash -LiteralPath $F.FullName).Hash -eq (Get-FileHash -LiteralPath $To).Hash)
                    if (-not $Same) { Copy-Item -Force -LiteralPath $F.FullName -Destination $To }
                }
            }
            $DestFull = (Resolve-Path -LiteralPath $Dest).Path
            foreach ($G in @(Get-ChildItem -LiteralPath $DestFull -Recurse -Force | Sort-Object { $_.FullName.Length } -Descending)) {
                $Rel = $G.FullName.Substring($DestFull.Length).TrimStart([char[]]@('\', '/'))
                if (-not (Test-Path -LiteralPath (Join-Path $SrcFull $Rel))) { Remove-Item -Recurse -Force -LiteralPath $G.FullName }
            }
        }
    }

    Write-Host "OK: $ProductCount skills do produto e $UserCount suas sincronizadas para Codex e Claude Code."
}
finally {
    Remove-Item -Recurse -Force -LiteralPath $Merged -ErrorAction SilentlyContinue
}
