param(
    [Parameter(Mandatory = $true, Position = 0)][string]$PastaDoSeuOs,
    [switch]$Aplicar
)
$ErrorActionPreference = "Stop"

# Atualiza um OS Head de IA ja em uso a partir DESTA pasta (a versao nova).
#
# Uso (rodar de dentro da pasta da versao nova):
#   powershell -ExecutionPolicy Bypass -File "ferramentas\atualizar-os.ps1" "<pasta-do-seu-os>"            # so mostra o plano
#   powershell -ExecutionPolicy Bypass -File "ferramentas\atualizar-os.ps1" "<pasta-do-seu-os>" -Aplicar   # aplica
#
# Troca so arquivos do PRODUTO, um a um. Nunca toca nos seus dados. Skills que VOCE criou
# (em skills\os\, .claude\skills\ ou .agents\skills\) sao resgatadas para skills\minhas\.
# Arquivos extras seus dentro de pastas do produto ficam onde estao.
# Todo arquivo do produto trocado e MOVIDO antes para _arquivo\atualizacao-<data>\.

$NewRoot = (Resolve-Path (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "..")).Path
if (-not (Test-Path -LiteralPath $PastaDoSeuOs -PathType Container)) { throw "Pasta nao encontrada: $PastaDoSeuOs" }
$Target = (Resolve-Path -LiteralPath $PastaDoSeuOs).Path

if ($Target -eq $NewRoot) { throw "A pasta do seu OS e a mesma da versao nova. Descompacte a versao nova em outro lugar." }
if (-not ((Test-Path (Join-Path $Target "memoria.md")) -and (Test-Path (Join-Path $Target "AGENTS.md")))) {
    throw "$Target nao parece um OS Head de IA (faltam memoria.md/AGENTS.md)."
}
if (-not ((Test-Path (Join-Path $NewRoot "VERSAO.md")) -and (Test-Path (Join-Path $NewRoot "skills\os")))) {
    throw "Esta pasta nao e um pacote do OS Head de IA."
}

function Get-Version($Root) {
    $Line = Get-Content -Encoding UTF8 -LiteralPath (Join-Path $Root "VERSAO.md") -ErrorAction SilentlyContinue | Where-Object { $_ -match '^- vers' } | Select-Object -First 1
    if ($Line -match '`([^`]+)`') { return $Matches[1] } else { return "desconhecida" }
}
$OldV = Get-Version $Target
$NewV = Get-Version $NewRoot
Write-Host "OS Head de IA - atualizacao"
Write-Host "Seu OS:      $Target (versao $OldV)"
Write-Host "Versao nova: $NewRoot (versao $NewV)"
Write-Host ""

$KnownProductSkills = @("iniciar", "registrar-projeto", "ingerir", "consultar", "sessao", "conectar", "mapear-fontes", "search-connectors",
    "briefing-manha", "criar-rotina", "fechar-semana", "montar-semana", "design-system", "atualizar-os", "conectar-treg", "modo-publico")
function Test-ProductSkill([string]$Name) {
    return (($KnownProductSkills -contains $Name) -or (Test-Path (Join-Path $NewRoot "skills\os\$Name") -PathType Container))
}

$ProductDirs = @("skills\os", "ferramentas", "guias", "squads", "dados-demo", "exercicios", "rotinas\modelos")
$ProductFiles = @(
    "AGENTS.md", "CLAUDE.md", "README.md", "VERSAO.md", "COMANDOS.md", "COMECE-AQUI.md", "CHECKLIST-ACEITE.md",
    "GUIA-COMPLETO-DO-OS.md", "GUIA-COMPLETO-DO-OS.pdf", "GUIA-DO-ALUNO.md", "GUIA-INSTALACAO.md", "GUIA-MONITORIA.md",
    ".gitignore", ".env.example",
    "skills\README.md", "skills\sync-skills.sh", "skills\sync-skills.ps1", "skills\minhas\README.md",
    "rotinas\README.md", "projetos\README.md", "_inbox\README.md", "conexoes\MODELO.md"
)
$UserPaths = @("0-eu", "empresa", "conhecimento", "decisoes", "saidas", "projetos", "_inbox", "rotinas", "conexoes", "dados", "entrada", "memoria.md", "conexoes.md")
$ProductOwnedInsideUser = @("projetos\README.md", "_inbox\README.md", "rotinas\README.md", "conexoes\MODELO.md")

function Get-RelativeFiles([string]$Root, [string]$Sub) {
    $Dir = Join-Path $Root $Sub
    if (-not (Test-Path -LiteralPath $Dir -PathType Container)) { return ,@() }
    $Full = (Resolve-Path -LiteralPath $Root).Path
    $Items = @(Get-ChildItem -LiteralPath $Dir -File -Recurse -Force | Where-Object { $_.Name -ne ".DS_Store" } | ForEach-Object {
        $_.FullName.Substring($Full.Length).TrimStart([char[]]@('\', '/')).Replace('/', '\')
    } | Sort-Object)
    return ,$Items
}

function Test-SameFile([string]$A, [string]$B) {
    if (-not (Test-Path -LiteralPath $B -PathType Leaf)) { return $false }
    return ((Get-FileHash -LiteralPath $A).Hash -eq (Get-FileHash -LiteralPath $B).Hash)
}

function Get-Fingerprint {
    $Lines = foreach ($P in $UserPaths) {
        $Full = Join-Path $Target $P
        if (-not (Test-Path -LiteralPath $Full)) { continue }
        $Files = if (Test-Path -LiteralPath $Full -PathType Leaf) { @(Get-Item -LiteralPath $Full) } else { @(Get-ChildItem -LiteralPath $Full -File -Recurse -Force) }
        foreach ($F in $Files) {
            if ($F.Name -eq ".DS_Store") { continue }
            $RelWin = $F.FullName.Substring($Target.Length).TrimStart([char[]]@('\', '/')).Replace('/', '\')
            if ($ProductOwnedInsideUser -contains $RelWin) { continue }
            if ($RelWin -like "rotinas\modelos\*") { continue }
            "$($RelWin.Replace('\', '/'))|$((Get-FileHash -Algorithm SHA256 -LiteralPath $F.FullName).Hash)"
        }
    }
    $Joined = (@($Lines) | Sort-Object) -join "`n"
    $Bytes = [System.Text.Encoding]::UTF8.GetBytes($Joined)
    $Sha = [System.Security.Cryptography.SHA256]::Create()
    return ([System.BitConverter]::ToString($Sha.ComputeHash($Bytes))).Replace("-", "").ToLower()
}

# 1) Skills do usuario a resgatar.
$Rescue = [ordered]@{}
$OsSkills = Join-Path $Target "skills\os"
if (Test-Path -LiteralPath $OsSkills -PathType Container) {
    foreach ($Sd in (Get-ChildItem -LiteralPath $OsSkills -Directory)) {
        if (-not (Test-ProductSkill $Sd.Name) -and -not (Test-Path (Join-Path $Target "skills\minhas\$($Sd.Name)")) -and -not $Rescue.Contains($Sd.Name)) { $Rescue[$Sd.Name] = $Sd.FullName }
    }
}
foreach ($Gen in @(".claude\skills", ".agents\skills")) {
    $GenDir = Join-Path $Target $Gen
    if (-not (Test-Path -LiteralPath $GenDir -PathType Container)) { continue }
    foreach ($Sd in (Get-ChildItem -LiteralPath $GenDir -Directory)) {
        if (-not (Test-Path (Join-Path $Sd.FullName "SKILL.md") -PathType Leaf)) { continue }
        if (-not (Test-ProductSkill $Sd.Name) -and -not (Test-Path (Join-Path $Target "skills\minhas\$($Sd.Name)")) -and -not $Rescue.Contains($Sd.Name)) { $Rescue[$Sd.Name] = $Sd.FullName }
    }
}

# 2) Arquivos do produto que mudam (arquivo a arquivo).
$Changed = New-Object System.Collections.Generic.List[string]
$Extras = New-Object System.Collections.Generic.List[string]
foreach ($D in $ProductDirs) {
    foreach ($Rel in (Get-RelativeFiles $NewRoot $D)) {
        if (-not (Test-SameFile (Join-Path $NewRoot $Rel) (Join-Path $Target $Rel))) { $Changed.Add($Rel) }
    }
    foreach ($Rel in (Get-RelativeFiles $Target $D)) {
        if (Test-Path -LiteralPath (Join-Path $NewRoot $Rel) -PathType Leaf) { continue }
        if ($D -eq "skills\os") {
            $Name = $Rel.Split('\')[2]
            if (-not (Test-ProductSkill $Name)) { continue }
        }
        $Extras.Add($Rel)
    }
}
foreach ($F in $ProductFiles) {
    $Src = Join-Path $NewRoot $F
    if (-not (Test-Path -LiteralPath $Src -PathType Leaf)) { continue }
    if (-not (Test-SameFile $Src (Join-Path $Target $F))) { $Changed.Add($F) }
}

if (($Changed.Count -eq 0) -and ($Rescue.Count -eq 0)) {
    Write-Host "Nada a atualizar: seu OS ja esta igual a versao nova."
    exit 0
}

Write-Host "Plano:"
Write-Host "  Arquivos do produto novos ou atualizados: $($Changed.Count)"
$Changed | ForEach-Object { $Parts = $_.Split('\'); if ($Parts.Count -le 2) { $Parts[0] } else { "$($Parts[0])\$($Parts[1])" } } | Sort-Object -Unique | ForEach-Object { Write-Host "    - $_" }
if ($Rescue.Count -gt 0) { Write-Host "  Skills SUAS que serao guardadas em skills\minhas\: $(@($Rescue.Keys) -join ', ')" }
if ($Extras.Count -gt 0) {
    Write-Host "  Arquivos que nao existem na versao nova e ficam onde estao (nao sao apagados):"
    $Extras | ForEach-Object { Write-Host "    - $_" }
}
Write-Host ""
Write-Host "  Nao serao tocados: $($UserPaths -join ' ') skills\minhas"
foreach ($F in @("AGENTS.md", "CLAUDE.md")) {
    $Old = Join-Path $Target $F
    $New = Join-Path $NewRoot $F
    if ((Test-Path -LiteralPath $Old) -and -not (Test-SameFile $New $Old)) {
        Write-Host ""
        Write-Host "- $F vai mudar. A versao atual fica guardada em _arquivo\. Linhas que so existem no seu:"
        $NewLines = @(Get-Content -Encoding UTF8 -LiteralPath $New)
        Get-Content -Encoding UTF8 -LiteralPath $Old | Where-Object { $NewLines -notcontains $_ -and $_.Trim() -ne "" } | ForEach-Object { Write-Host "    $_" }
    }
}

if (-not $Aplicar) {
    Write-Host ""
    Write-Host "Nada foi alterado. Para aplicar, rode de novo com -Aplicar."
    exit 0
}

$Before = Get-Fingerprint
$Stamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
$Backup = Join-Path $Target "_arquivo\atualizacao-$Stamp"
New-Item -ItemType Directory -Force -Path $Backup | Out-Null

New-Item -ItemType Directory -Force -Path (Join-Path $Target "skills\minhas") | Out-Null
foreach ($Name in @($Rescue.Keys)) {
    $Src = $Rescue[$Name]
    Copy-Item -Recurse -Force -LiteralPath $Src -Destination (Join-Path $Target "skills\minhas\$Name")
    if ($Src.StartsWith($OsSkills)) {
        New-Item -ItemType Directory -Force -Path (Join-Path $Backup "skills\os") | Out-Null
        Move-Item -LiteralPath $Src -Destination (Join-Path $Backup "skills\os\$Name")
    }
}

foreach ($Rel in $Changed) {
    $Dst = Join-Path $Target $Rel
    if (Test-Path -LiteralPath $Dst) {
        $Bk = Join-Path $Backup $Rel
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Bk) | Out-Null
        Move-Item -LiteralPath $Dst -Destination $Bk
    }
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Dst) | Out-Null
    Copy-Item -Force -LiteralPath (Join-Path $NewRoot $Rel) -Destination $Dst
}

$After = Get-Fingerprint
if ($Before -ne $After) {
    throw "Seus dados mudaram durante a atualizacao. Nada foi apagado; a copia do produto antigo esta em $Backup."
}

Write-Host ""
Write-Host "OK: seus dados estao intactos (impressao digital $Before)."
Write-Host "Arquivos antigos do produto guardados em: _arquivo\atualizacao-$Stamp\"
if ($Rescue.Count -gt 0) { Write-Host "Skills suas guardadas em skills\minhas\: $(@($Rescue.Keys) -join ', ')" }
& (Join-Path $Target "skills\sync-skills.ps1")
try { & (Join-Path $Target "ferramentas\doctor.ps1") } catch { Write-Host $_ }
Write-Host ""
Write-Host "OK: OS atualizado para a versao $NewV."
Write-Host "Feche esta conversa e abra uma nova na pasta do OS: as skills novas so aparecem numa conversa nova."
