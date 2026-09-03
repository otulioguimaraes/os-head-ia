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

$SkillCount = (Get-ChildItem -Path (Join-Path $OsRoot "skills\os") -Filter "SKILL.md" -File -Recurse -ErrorAction SilentlyContinue).Count
if ($SkillCount -eq 13) { Write-Ok "13 skills canonicas encontradas" }
else { Write-Failure "esperava 13 skills; encontrei $SkillCount" }

function Get-SkillManifest($Root) {
    if (-not (Test-Path $Root -PathType Container)) { return @() }
    return @(Get-ChildItem -Path $Root -File -Recurse | ForEach-Object {
        $Relative = $_.FullName.Substring($Root.Length).TrimStart([char[]]@('\', '/'))
        "$Relative|$((Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName).Hash)"
    } | Sort-Object)
}

function Test-InstalledSkills($Label, $TargetRoot) {
    $Count = (Get-ChildItem -Path $TargetRoot -Filter "SKILL.md" -File -Recurse -ErrorAction SilentlyContinue).Count
    if ($Count -ne 13) {
        Write-Failure "$Label`: esperava 13 skills instaladas; encontrei $Count. Rode skills\sync-skills.ps1"
        return
    }
    $Canonical = Get-SkillManifest (Join-Path $OsRoot "skills\os")
    $Installed = Get-SkillManifest $TargetRoot
    if ((Compare-Object -ReferenceObject $Canonical -DifferenceObject $Installed).Count -eq 0) {
        Write-Ok "$Label`: 13 skills instaladas e sincronizadas"
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
    Remove-Item -LiteralPath $Probe
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
