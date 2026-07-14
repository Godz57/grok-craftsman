# Install Grok Craftsman lite into ~/.grok or ./.grok
param(
    [switch]$Project,
    [string]$KitRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

if ($Project) {
    $base = Join-Path (Get-Location) ".grok"
    Write-Host "Install mode: PROJECT -> $base"
} else {
    $base = Join-Path $env:USERPROFILE ".grok"
    Write-Host "Install mode: GLOBAL -> $base"
}

$skills = Join-Path $base "skills"
$commands = Join-Path $base "commands"
$dstSkill = Join-Path $skills "code-craftsman"

New-Item -ItemType Directory -Force -Path $skills, $commands, $dstSkill | Out-Null

Copy-Item -Recurse -Force (Join-Path $KitRoot "skills\code-craftsman\*") $dstSkill
Write-Host "  skill: code-craftsman"

# default ON if flag missing
$flag = Join-Path $dstSkill "state\enabled.flag"
if (-not (Test-Path $flag)) {
    New-Item -ItemType Directory -Force -Path (Split-Path $flag) | Out-Null
    Set-Content -Path $flag -Value "on" -NoNewline
}
Write-Host "  flag: $(Get-Content $flag -Raw)"

Get-ChildItem (Join-Path $KitRoot "commands") -Filter "*.md" | ForEach-Object {
    Copy-Item -Force $_.FullName (Join-Path $commands $_.Name)
    Write-Host "  command: $($_.Name)"
}

Write-Host ""
Write-Host "Done. Try: /craftsman-status  |  /craftsman-on  |  /code-craftsman"
Write-Host "Companions: grok-superpowers, grok-loops"
