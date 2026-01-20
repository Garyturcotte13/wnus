#!/usr/bin/env pwsh
# Build script for Windows Native Unix Shell (wnus) using g++

$ErrorActionPreference = "Stop"

Write-Host "Building Windows Native Unix Shell (wnus)..." -ForegroundColor Cyan

# Check if g++ is available
if (-not (Get-Command g++ -ErrorAction SilentlyContinue)) {
    Write-Host "Error: g++ compiler not found in PATH" -ForegroundColor Red
    Write-Host "Please install MinGW or add g++ to your PATH" -ForegroundColor Yellow
    exit 1
}

# Source file
$sourceFile = "wnus.cpp"
$outputFile = "wnus.exe"

# Check if source file exists
if (-not (Test-Path $sourceFile)) {
    Write-Host "Error: Source file '$sourceFile' not found" -ForegroundColor Red
    exit 1
}

# Compile with g++
Write-Host "Compiling $sourceFile..." -ForegroundColor Green
try {
    g++ $sourceFile -o $outputFile -static -std=c++11 -O2 -mwindows -ldwmapi -luxtheme -lshlwapi -lws2_32 -liphlpapi -lbcrypt -lpsapi -lwtsapi32 -lwbemuuid -lole32 -loleaut32
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Build successful!" -ForegroundColor Green
        Write-Host "Output: $outputFile" -ForegroundColor Cyan
        
        # Show file size
        $fileSize = (Get-Item $outputFile).Length
        $fileSizeKB = [math]::Round($fileSize / 1KB, 2)
        Write-Host "Size: $fileSizeKB KB" -ForegroundColor Cyan
    } else {
        Write-Host "Build failed with exit code $LASTEXITCODE" -ForegroundColor Red
        exit $LASTEXITCODE
    }
} catch {
    Write-Host "Build failed: $_" -ForegroundColor Red
    exit 1
}
