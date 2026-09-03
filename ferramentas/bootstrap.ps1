$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OsRoot = Split-Path -Parent $ScriptDir

Write-Host "OS Head de IA - preparacao do primeiro acesso"
Write-Host ""
& (Join-Path $OsRoot "skills\sync-skills.ps1")
& (Join-Path $OsRoot "ferramentas\doctor.ps1")

Write-Host ""
Write-Host "OK: ambiente local preparado."
Write-Host "Proximo passo: leia skills\os\iniciar\SKILL.md e inicie o onboarding."
