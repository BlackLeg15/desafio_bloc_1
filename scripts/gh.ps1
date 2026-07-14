# Wrapper para GitHub CLI no Windows (PATH pode não incluir gh após instalação via winget).
$GhExe = "C:\Program Files\GitHub CLI\gh.exe"

if (-not (Test-Path $GhExe)) {
    Write-Error "GitHub CLI não encontrado em '$GhExe'. Instale com: winget install GitHub.cli"
    exit 1
}

& $GhExe @args
exit $LASTEXITCODE
