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

    foreach ($SkillDir in (Get-ChildItem -Path $ProductDir -Directory)) {
        Copy-Item -Recurse -Force -LiteralPath $SkillDir.FullName -Destination (Join-Path $Merged $SkillDir.Name)
        $ProductCount++
    }

    if (Test-Path $UserDir -PathType Container) {
        foreach ($SkillDir in (Get-ChildItem -Path $UserDir -Directory)) {
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

    function Get-TreeManifest([string]$Root) {
        if (-not (Test-Path $Root -PathType Container)) { return @() }
        $Full = (Resolve-Path -LiteralPath $Root).Path
        return @(Get-ChildItem -Path $Full -File -Recurse | ForEach-Object {
            $Relative = $_.FullName.Substring($Full.Length).TrimStart([char[]]@('\', '/'))
            "$Relative|$((Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName).Hash)"
        } | Sort-Object)
    }

    $MergedManifest = Get-TreeManifest $Merged

    foreach ($TargetRoot in @((Join-Path $OsRoot ".agents\skills"), (Join-Path $OsRoot ".claude\skills"))) {
        $TargetManifest = Get-TreeManifest $TargetRoot
        if ((Test-Path $TargetRoot) -and ((@($MergedManifest) -join "`n") -eq (@($TargetManifest) -join "`n"))) {
            continue
        }
        if (Test-Path $TargetRoot) {
            Remove-Item -Recurse -Force -LiteralPath $TargetRoot
        }
        New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
        foreach ($Item in (Get-ChildItem -Path $Merged -Directory)) {
            Copy-Item -Recurse -Force -LiteralPath $Item.FullName -Destination (Join-Path $TargetRoot $Item.Name)
        }
    }

    Write-Host "OK: $ProductCount skills do produto e $UserCount suas sincronizadas para Codex e Claude Code."
}
finally {
    Remove-Item -Recurse -Force -LiteralPath $Merged -ErrorAction SilentlyContinue
}
