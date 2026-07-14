param(
    [Parameter(Mandatory = $true)]
    [int]$PrNumber,

    [Parameter(Mandatory = $true)]
    [int]$IssueNumber,

    [string]$ScreenshotPath = "validation_harness/artifacts/02_posts_loaded.png",

    [string]$Branch = "",

    [int]$ImageWidth = 300,

    [string]$AltText = "Validation evidence",

    [switch]$SkipUpload
)

$ErrorActionPreference = "Stop"

$GhScript = Join-Path $PSScriptRoot "gh.ps1"
if (-not (Test-Path $GhScript)) {
    throw "GitHub CLI wrapper not found: $GhScript"
}

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $projectRoot

if (-not $Branch) {
    $Branch = (git rev-parse --abbrev-ref HEAD).Trim()
}

$owner = "BlackLeg15"
$repo = "desafio_bloc_1"
$screenshotFile = Split-Path $ScreenshotPath -Leaf
$remotePath = ".github/pr-assets/issue-$IssueNumber/$screenshotFile"
$rawUrl = "https://raw.githubusercontent.com/$owner/$repo/$Branch/$remotePath"

function Invoke-GhApi {
    param(
        [string]$Method = "GET",
        [string]$Endpoint,
        [string]$InputFile = ""
    )

    $args = @("api")
    if ($Method -ne "GET") {
        $args += "--method", $Method
    }
    $args += $Endpoint
    if ($InputFile) {
        $args += "--input", $InputFile
    }

    & $GhScript @args | ConvertFrom-Json
}

function Upload-Screenshot {
    param([string]$LocalPath, [string]$RemoteFilePath)

    if (-not (Test-Path $LocalPath)) {
        throw "Screenshot not found: $LocalPath"
    }

    $bytes = [IO.File]::ReadAllBytes((Resolve-Path $LocalPath))
    $content = [Convert]::ToBase64String($bytes)

    $payload = @{
        message = "docs: add PR evidence screenshot for #$IssueNumber"
        content = $content
        branch  = $Branch
    }

    $existing = $null
    try {
        $encodedRef = [Uri]::EscapeDataString($Branch)
        $existing = & $GhScript api "repos/$owner/$repo/contents/$RemoteFilePath?ref=$encodedRef" 2>$null | ConvertFrom-Json
    } catch {
        $existing = $null
    }

    if ($existing -and $existing.sha) {
        $payload.sha = $existing.sha
    }

    $tempFile = Join-Path $env:TEMP "attach-pr-evidence-$IssueNumber.json"
    $payload | ConvertTo-Json -Compress | Set-Content -Path $tempFile -Encoding UTF8

    try {
        Invoke-GhApi -Method "PUT" -Endpoint "repos/$owner/$repo/contents/$RemoteFilePath" -InputFile $tempFile | Out-Null
        Write-Host "Uploaded screenshot to $RemoteFilePath on branch $Branch"
    } finally {
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
    }
}

function Get-ImageMarkdown {
    param([string]$Url, [int]$Width, [string]$Alt)

    return "<img src=""$Url"" width=""$Width"" alt=""$Alt"">"
}

function Update-PrBody {
    param([string]$ImageHtml)

    $body = (& $GhScript pr view $PrNumber --json body -q ".body")

    $screenshotSection = @"
### Screenshots

$ImageHtml

Evidência local: ``$ScreenshotPath``
"@

    if ($body -match '(?s)### Screenshots.*?(?=## |\z)') {
        $body = $body -replace '(?s)### Screenshots.*?(?=## |\z)', ($screenshotSection + "`n`n")
    } elseif ($body -match '(?s)## Evidências') {
        $body = $body -replace '(?s)(## Evidências.*?)(## )', "`$1`n$screenshotSection`n`n`$2"
    } else {
        $body += "`n`n$screenshotSection"
    }

    $tempBody = Join-Path $env:TEMP "pr-$PrNumber-body.md"
    Set-Content -Path $tempBody -Value $body -Encoding UTF8 -NoNewline

    try {
        & $GhScript pr edit $PrNumber --body-file $tempBody | Out-Null
        Write-Host "Updated PR #$PrNumber description with screenshot (width=$ImageWidth)"
    } finally {
        Remove-Item $tempBody -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Attaching evidence to PR #$PrNumber (issue #$IssueNumber)..."

if (-not $SkipUpload) {
    Upload-Screenshot -LocalPath $ScreenshotPath -RemoteFilePath $remotePath
}

$imageHtml = Get-ImageMarkdown -Url $rawUrl -Width $ImageWidth -Alt $AltText
Update-PrBody -ImageHtml $imageHtml

Write-Host "Done: https://github.com/$owner/$repo/pull/$PrNumber"
