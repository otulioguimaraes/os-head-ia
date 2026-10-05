$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OsRoot = Split-Path -Parent $ScriptDir
$ErrorsFound = 0
$WarningsFound = 0

function Write-Ok($Message) { Write-Host "OK    $Message" }
function Write-WarningResult($Message) { $script:WarningsFound++; Write-Host "AVISO $Message" }
function Write-Failure($Message) { $script:ErrorsFound++; Write-Host "ERRO  $Message" }

Write-Host "OS Head de IA - diagnostico"
Write-Host "Pasta: $OsRoot"
Write-Host ""

$RequiredFiles = @("README.md", "COMECE-AQUI.md", "AGENTS.md", "CLAUDE.md", "COMANDOS.md", "memoria.md", "saidas\RETOMAR.md")
foreach ($File in $RequiredFiles) {
    if (Test-Path (Join-Path $OsRoot $File) -PathType Leaf) { Write-Ok "$File encontrado" }
    else { Write-Failure "$File ausente" }
}

$ProductExpected = 15
$SkillCount = @(Get-ChildItem -Path (Join-Path $OsRoot "skills\os") -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") -PathType Leaf }).Count
if ($SkillCount -eq $ProductExpected) { Write-Ok "$ProductExpected skills do produto encontradas" }
else { Write-Failure "esperava $ProductExpected skills do produto; encontrei $SkillCount" }

$UserSkillDirs = @(Get-ChildItem -Path (Join-Path $OsRoot "skills\minhas") -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") -PathType Leaf })
Write-Ok "$($UserSkillDirs.Count) skill(s) suas em skills\minhas\"

function Get-SkillManifestFromDirs($Dirs) {
    return @($Dirs | ForEach-Object {
        $Dir = $_
        Get-ChildItem -Path $Dir.FullName -File -Recurse | ForEach-Object {
            $Relative = $Dir.Name + "/" + $_.FullName.Substring($Dir.FullName.Length).TrimStart([char[]]@('\', '/')).Replace('\', '/')
            "$Relative|$((Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName).Hash)"
        }
    } | Sort-Object)
}

$ProductSkillDirs = @(Get-ChildItem -Path (Join-Path $OsRoot "skills\os") -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") -PathType Leaf })
$ExpectedDirs = @($ProductSkillDirs + $UserSkillDirs)
$TotalExpected = $ExpectedDirs.Count
$ExpectedManifest = Get-SkillManifestFromDirs $ExpectedDirs

function Test-InstalledSkills($Label, $TargetRoot) {
    $InstalledDirs = @(Get-ChildItem -Path $TargetRoot -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") -PathType Leaf })
    if ($InstalledDirs.Count -ne $TotalExpected) {
        Write-Failure "$Label`: esperava $TotalExpected skills instaladas; encontrei $($InstalledDirs.Count). Rode skills\sync-skills.ps1"
        return
    }
    $Installed = Get-SkillManifestFromDirs $InstalledDirs
    if ((@($ExpectedManifest) -join "`n") -eq (@($Installed) -join "`n")) {
        Write-Ok "$Label`: $TotalExpected skills instaladas e sincronizadas"
    } else {
        Write-Failure "$Label`: skills instaladas estao desatualizadas. Rode skills\sync-skills.ps1"
    }
}

Test-InstalledSkills "Codex" (Join-Path $OsRoot ".agents\skills")
Test-InstalledSkills "Claude Code" (Join-Path $OsRoot ".claude\skills")

$BrandSystemWorkflow = Join-Path $OsRoot "squads\brand-system-builder\workflows\brand-system-pipeline.yaml"
if (Test-Path $BrandSystemWorkflow -PathType Leaf) { Write-Ok "squad Brand System Builder disponivel" }
else { Write-Failure "squad Brand System Builder ausente" }

if (Get-Command git -ErrorAction SilentlyContinue) { Write-Ok "Git disponivel" }
else { Write-WarningResult "Git nao encontrado; git clone nao estara disponivel" }

if (Get-Command codex -ErrorAction SilentlyContinue) { Write-Ok "Codex CLI disponivel" }
else { Write-WarningResult "Codex CLI nao encontrado; o Codex Desktop pode continuar funcionando" }

if (Get-Command claude -ErrorAction SilentlyContinue) { Write-Ok "Claude Code disponivel" }
else { Write-WarningResult "Claude Code nao encontrado; use o Codex ou instale depois" }

try {
    $Probe = Join-Path $OsRoot ".os-head-ia-write-test"
    Set-Content -Path $Probe -Value "ok" -NoNewline
    Remove-Item -Force -LiteralPath $Probe
    Write-Ok "pasta gravavel"
} catch {
    Write-Failure "pasta sem permissao de escrita"
}

$Sensitive = Get-ChildItem -Path $OsRoot -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq ".env" -or $_.Extension -in @(".pem", ".key") }
if ($Sensitive.Count -gt 0) { Write-WarningResult "ha arquivo potencialmente sensivel; confirme que esta ignorado pelo Git" }
else { Write-Ok "nenhum arquivo sensivel comum detectado" }

Write-Host ""
Write-Host "Resultado: $ErrorsFound erro(s), $WarningsFound aviso(s)."
if ($ErrorsFound -gt 0) { exit 1 }
