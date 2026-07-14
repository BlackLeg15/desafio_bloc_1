param(
    [string]$Device = "",
    [switch]$RecordVideo,
    [switch]$SkipPull
)

$ErrorActionPreference = "Stop"

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "../..")
Set-Location $projectRoot

$PackageName = "com.example.desafio_bloc_1"
$RemoteHarnessRoot = "code_cache/validation_harness"
$RemoteAdbArtifactsPath = "/storage/emulated/0/Android/data/$PackageName/files/validation_harness/artifacts"
$RemoteAdbReportsPath = "/storage/emulated/0/Android/data/$PackageName/files/validation_harness/reports"
$HostReportsDir = Join-Path $projectRoot "validation_harness/reports"
$HostArtifactsDir = Join-Path $projectRoot "validation_harness/artifacts"
$HostIntegrationScreenshotsDir = Join-Path $projectRoot "build/integration_test_screenshots"

function Get-AdbArgs {
    param([string]$DeviceId)

    $args = @()
    if ($DeviceId) {
        $args += @("-s", $DeviceId)
    }
    return $args
}

function Resolve-AndroidDeviceId {
    param([string]$RequestedDevice)

    if ($RequestedDevice) {
        return $RequestedDevice
    }

    $flutterDevices = flutter devices --machine 2>$null | ConvertFrom-Json
    $androidDevice = $flutterDevices | Where-Object {
        $_.targetPlatform -eq "android" -or $_.id -like "adb-*"
    } | Select-Object -First 1

    if ($androidDevice) {
        return $androidDevice.id
    }

    return $null
}

function Ensure-HostDirectories {
    New-Item -ItemType Directory -Force -Path $HostReportsDir | Out-Null
    New-Item -ItemType Directory -Force -Path $HostArtifactsDir | Out-Null
}

function Sync-HostIntegrationScreenshots {
    if (-not (Test-Path $HostIntegrationScreenshotsDir)) {
        return
    }

    $screenshots = Get-ChildItem -Path $HostIntegrationScreenshotsDir -Recurse -Include *.png,*.jpg
    foreach ($screenshot in $screenshots) {
        $destination = Join-Path $HostArtifactsDir $screenshot.Name
        Copy-Item -Path $screenshot.FullName -Destination $destination -Force
        Write-Host "Copied host screenshot: $($screenshot.Name)"
    }
}

function Invoke-AdbShellRunAs {
    param(
        [string[]]$AdbArgs,
        [string]$Command
    )

    & adb @AdbArgs shell "run-as $PackageName $Command"
    return $LASTEXITCODE
}

function Pull-DeviceTextFile {
    param(
        [string[]]$AdbArgs,
        [string]$RemotePath,
        [string]$LocalPath
    )

    $tempFile = [System.IO.Path]::GetTempFileName()
    try {
        $process = Start-Process -FilePath "adb" -ArgumentList (@($AdbArgs + @("exec-out", "run-as", $PackageName, "cat", $RemotePath))) -RedirectStandardOutput $tempFile -NoNewWindow -Wait -PassThru
        if ($process.ExitCode -ne 0 -or -not (Test-Path $tempFile) -or (Get-Item $tempFile).Length -eq 0) {
            return $false
        }

        Copy-Item -Path $tempFile -Destination $LocalPath -Force
        return $true
    }
    finally {
        if (Test-Path $tempFile) {
            Remove-Item -Path $tempFile -Force
        }
    }
}

function Pull-AdbDirectory {
    param(
        [string[]]$AdbArgs,
        [string]$RemotePath,
        [string]$LocalPath
    )

    if (-not (Test-Path $LocalPath)) {
        New-Item -ItemType Directory -Force -Path $LocalPath | Out-Null
    }

    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    & adb @AdbArgs pull "$RemotePath/." $LocalPath 1>$null 2>&1 | Out-Null
    $ErrorActionPreference = $previousErrorAction

    return (Get-ChildItem -Path $LocalPath -Recurse -Include *.png,*.jpg -ErrorAction SilentlyContinue).Count -gt 0
}

function Sync-AndroidHarnessArtifacts {
    param([string]$DeviceId)

    $adbArgs = Get-AdbArgs -DeviceId $DeviceId
    Ensure-HostDirectories

    $pulledFromAdb = Pull-AdbDirectory -AdbArgs $adbArgs -RemotePath $RemoteAdbArtifactsPath -LocalPath $HostArtifactsDir
    if ($pulledFromAdb) {
        $screenshots = Get-ChildItem -Path $HostArtifactsDir -Recurse -Include *.png,*.jpg
        foreach ($screenshot in $screenshots) {
            Write-Host "Pulled screenshot: $($screenshot.Name)"
        }
    } else {
        Write-Warning "Could not adb pull from $RemoteAdbArtifactsPath"
    }

    $pulledReports = Pull-AdbDirectory -AdbArgs $adbArgs -RemotePath $RemoteAdbReportsPath -LocalPath $HostReportsDir
    if ($pulledReports) {
        $reports = Get-ChildItem -Path $HostReportsDir -Recurse -Include *.json
        foreach ($report in $reports) {
            Write-Host "Pulled report: $($report.Name)"
        }
    }

    $remoteReportsDir = "$RemoteHarnessRoot/reports"
    $reportsCheck = Invoke-AdbShellRunAs -AdbArgs $adbArgs -Command "ls $remoteReportsDir"
    if ($reportsCheck -eq 0) {
        $reportListing = (& adb @adbArgs shell "run-as $PackageName ls $remoteReportsDir") -split "\s+" | Where-Object { $_ -match "\.json$" }
        foreach ($reportFile in $reportListing) {
            $reportFile = $reportFile.Trim()
            if (-not $reportFile) { continue }

            $localReportPath = Join-Path $HostReportsDir $reportFile
            if (Pull-DeviceTextFile -AdbArgs $adbArgs -RemotePath "$remoteReportsDir/$reportFile" -LocalPath $localReportPath) {
                Write-Host "Pulled report: $reportFile"
            }
        }
    }

    Sync-HostIntegrationScreenshots
}

function Save-ReportFromFlutterOutput {
    param([string]$Output)

    if ($Output -match 'VALIDATION_REPORT_JSON:(\{.+\})') {
        $json = $Matches[1]
        Ensure-HostDirectories
        $latestReport = Join-Path $HostReportsDir "validation_report_latest.json"
        Set-Content -Path $latestReport -Value $json -Encoding utf8
        Write-Host "Saved report: validation_harness/reports/validation_report_latest.json"
    }
}

Write-Host "Running validation harness..."

$resolvedDevice = Resolve-AndroidDeviceId -RequestedDevice $Device
if ($resolvedDevice) {
    Write-Host "Target device: $resolvedDevice"
}

$flutterArgs = @(
    "test",
    "integration_test/harness_test.dart",
    "--no-uninstall"
)

if ($resolvedDevice) {
    $flutterArgs += @("-d", $resolvedDevice)
}

if ($RecordVideo) {
    $flutterArgs += @("--dart-define=RECORD_VIDEO=true")
}

$flutterOutput = flutter @flutterArgs 2>&1 | Out-String
Write-Host $flutterOutput
$exitCode = $LASTEXITCODE

Save-ReportFromFlutterOutput -Output $flutterOutput

if (-not $SkipPull -and $resolvedDevice) {
    Write-Host ""
    Write-Host "Pulling harness artifacts from device..."
    Sync-AndroidHarnessArtifacts -DeviceId $resolvedDevice
}

Write-Host ""
if ($exitCode -eq 0) {
    Write-Host "Validation harness passed."
} else {
    Write-Host "Validation harness failed with exit code $exitCode."
}

Write-Host "Reports: validation_harness/reports/"
Write-Host "Artifacts: validation_harness/artifacts/"

exit $exitCode
