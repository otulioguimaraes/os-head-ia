$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OsRoot = Split-Path -Parent $ScriptDir
$SourceDir = Join-Path $ScriptDir "os"

if (-not (Test-Path $SourceDir -PathType Container)) {
    throw "Skills canonicas nao encontradas em $SourceDir"
}

$Targets = @(
    (Join-Path $OsRoot ".agents\skills"),
    (Join-Path $OsRoot ".claude\skills")
)

$SkillDirs = Get-ChildItem -Path $SourceDir -Directory

function Test-TreesEqual {
    param(
        [string]$Source,
        [string]$Target
    )

    if (-not (Test-Path $Target -PathType Container)) { return $false }

    $SourceFiles = @(Get-ChildItem -Path $Source -Recurse -File | ForEach-Object {
        $_.FullName.Substring($Source.Length).TrimStart([char[]]"\/")
    } | Sort-Object)
    $TargetFiles = @(Get-ChildItem -Path $Target -Recurse -File | ForEach-Object {
        $_.FullName.Substring($Target.Length).TrimStart([char[]]"\/")
    } | Sort-Object)

    if ($SourceFiles.Count -ne $TargetFiles.Count) { return $false }

    for ($Index = 0; $Index -lt $SourceFiles.Count; $Index++) {
        if ($SourceFiles[$Index] -ne $TargetFiles[$Index]) { return $false }
        $SourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $Source $SourceFiles[$Index])).Hash
        $TargetHash = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $Target $TargetFiles[$Index])).Hash
        if ($SourceHash -ne $TargetHash) { return $false }
    }

    return $true
}

foreach ($TargetRoot in $Targets) {
    if (Test-TreesEqual -Source $SourceDir -Target $TargetRoot) {
        continue
    }
    if (Test-Path $TargetRoot) {
        Remove-Item -Recurse -Force -LiteralPath $TargetRoot
    }
    New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
    foreach ($SkillDir in $SkillDirs) {
        $TargetDir = Join-Path $TargetRoot $SkillDir.Name
        Copy-Item -Recurse -Force -LiteralPath $SkillDir.FullName -Destination $TargetDir
    }
}

Write-Host "OK: $($SkillDirs.Count) skills sincronizadas para Codex e Claude Code."
