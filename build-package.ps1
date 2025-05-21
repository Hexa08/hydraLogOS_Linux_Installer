# Hydra Package Builder for Windows
# Copyright (c) 2025-2045 Hydra Package System
# All rights reserved.

# Colors for output
$RED = [System.ConsoleColor]::Red
$GREEN = [System.ConsoleColor]::Green
$YELLOW = [System.ConsoleColor]::Yellow
$BLUE = [System.ConsoleColor]::Blue

# Check if package directory exists
if (-not (Test-Path "example-package")) {
    Write-Host "Error: example-package directory not found" -ForegroundColor $RED
    exit 1
}

# Create temporary build directory
$BUILD_DIR = Join-Path $env:TEMP "hpkg_build_$(Get-Random)"
New-Item -ItemType Directory -Path $BUILD_DIR | Out-Null
Write-Host "Created temporary build directory: $BUILD_DIR" -ForegroundColor $BLUE

# Copy package contents
Write-Host "Copying package contents..." -ForegroundColor $YELLOW
Copy-Item -Path "example-package\*" -Destination $BUILD_DIR -Recurse

# Create package archive
Write-Host "Creating package archive..." -ForegroundColor $YELLOW
$zipPath = Join-Path $PSScriptRoot "example.zip"
Set-Location $BUILD_DIR
Compress-Archive -Path * -DestinationPath $zipPath -Force

# Rename to .hapk
Set-Location $PSScriptRoot
if (Test-Path $zipPath) {
    Rename-Item -Path $zipPath -NewName "example.hapk" -Force
}

# Clean up
Remove-Item -Path $BUILD_DIR -Recurse -Force

Write-Host "Package built successfully: example.hapk" -ForegroundColor $GREEN 