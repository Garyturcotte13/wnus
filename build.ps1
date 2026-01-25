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
$objectFile = "wnus.o"
$outputFile = "wnus.exe"

# Check if source file exists
if (-not (Test-Path $sourceFile)) {
    Write-Host "Error: Source file '$sourceFile' not found" -ForegroundColor Red
    exit 1
}

# Step 1: Compile to object file
Write-Host "Step 1: Compiling $sourceFile to object file..." -ForegroundColor Green
Write-Host "This may take 1-2 minutes for 63,000+ lines of code..." -ForegroundColor Yellow
$compileStart = Get-Date

# Use direct g++ call (not Start-Process) for proper output handling
g++ -c $sourceFile -o $objectFile -std=c++11

if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}

$compileEnd = Get-Date
$compileTime = ($compileEnd - $compileStart).TotalSeconds

if (Test-Path $objectFile) {
    Write-Host "Object file created: $objectFile" -ForegroundColor Green
    $objSize = (Get-Item $objectFile).Length
    $objSizeMB = [math]::Round($objSize / 1MB, 2)
    Write-Host "Object file size: $objSizeMB MB" -ForegroundColor Cyan
    Write-Host "Compilation time: $([math]::Round($compileTime, 1)) seconds" -ForegroundColor Cyan
} else {
    Write-Host "Error: Object file was not created" -ForegroundColor Red
    exit 1
}

# Step 2: Link object file to executable
Write-Host "`nStep 2: Linking $objectFile to $outputFile..." -ForegroundColor Green
$linkStart = Get-Date

# Link with all required libraries
g++ $objectFile -o $outputFile -static -mwindows -ldwmapi -luxtheme -lshlwapi -lws2_32 -liphlpapi -lbcrypt -lpsapi -lwtsapi32 -lwbemuuid -lole32 -loleaut32 -lnetapi32 -ldnsapi -ladvapi32 -lcomctl32

if ($LASTEXITCODE -ne 0) {
    Write-Host "Linking failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}

$linkEnd = Get-Date
$linkTime = ($linkEnd - $linkStart).TotalSeconds

if (Test-Path $outputFile) {
    Write-Host "`nBuild successful!" -ForegroundColor Green
    Write-Host "Output: $outputFile" -ForegroundColor Cyan
    
    # Show executable file size
    $fileSize = (Get-Item $outputFile).Length
    $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
    Write-Host "Executable size: $fileSizeMB MB" -ForegroundColor Cyan
    Write-Host "Linking time: $([math]::Round($linkTime, 1)) seconds" -ForegroundColor Cyan
    Write-Host "Total build time: $([math]::Round($compileTime + $linkTime, 1)) seconds" -ForegroundColor Cyan
    
    # Clean up object file
    Write-Host "`nCleaning up object file..." -ForegroundColor Yellow
    Remove-Item $objectFile -ErrorAction SilentlyContinue
    Write-Host "Build complete!" -ForegroundColor Green
} else {
    Write-Host "Error: Executable was not created" -ForegroundColor Red
    exit 1
}
