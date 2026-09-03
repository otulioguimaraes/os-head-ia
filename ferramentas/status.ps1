$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OsRoot = Split-Path -Parent $ScriptDir

Write-Host "OS Head de IA - status"
Write-Host ""
Get-Content (Join-Path $OsRoot "memoria.md") | Select-String -Pattern "^- (onboarding|atualizado em|foco atual):"

$Projects = (Get-ChildItem (Join-Path $OsRoot "projetos") -Filter "*.md" -File | Where-Object { $_.Name -ne "README.md" }).Count
$RawSources = (Get-ChildItem (Join-Path $OsRoot "conhecimento\raw") -Directory -ErrorAction SilentlyContinue).Count
$Pages = (Get-ChildItem (Join-Path $OsRoot "conhecimento\paginas") -Filter "*.md" -File -Recurse -ErrorAction SilentlyContinue).Count
$Briefings = (Get-ChildItem (Join-Path $OsRoot "saidas\diario") -Filter "*-briefing.md" -File -ErrorAction SilentlyContinue).Count
$Routines = (Get-ChildItem (Join-Path $OsRoot "rotinas") -Filter "*.md" -File | Where-Object { $_.Name -ne "README.md" }).Count

Write-Host ""
Write-Host "Projetos: $Projects"
Write-Host "Fontes brutas: $RawSources"
Write-Host "Paginas de conhecimento: $Pages"
Write-Host "Briefings: $Briefings"
Write-Host "Rotinas: $Routines"
Write-Host ""
Write-Host "Consulte saidas\RETOMAR.md para o proximo passo."

