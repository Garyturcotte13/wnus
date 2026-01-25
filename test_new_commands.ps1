#!/usr/bin/env pwsh
# Test script for newly implemented POSIX commands: asa, batch, cflow

Write-Host "Testing New POSIX Commands (v0.1.7.0)" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: asa command
Write-Host "Test 1: asa (FORTRAN carriage-control)" -ForegroundColor Green
Write-Host "Creating test file..."
@"
 Normal line
0Double spaced line
1New page
+Overprint
"@ | Out-File -FilePath test_asa_input.txt -Encoding ASCII

Write-Host "Running: wnus asa test_asa_input.txt"
.\wnus.exe asa test_asa_input.txt
Write-Host ""

# Test 2: batch command
Write-Host "Test 2: batch (background job scheduler)" -ForegroundColor Green
Write-Host "Running: wnus batch --help"
.\wnus.exe -c "batch --help" | Select-Object -First 15
Write-Host ""

# Test 3: cflow command  
Write-Host "Test 3: cflow (C call graph generator)" -ForegroundColor Green
Write-Host "Creating test C file..."
@"
#include <stdio.h>

void helper() {
    printf("Helper\n");
}

void process() {
    helper();
}

int main() {
    process();
    return 0;
}
"@ | Out-File -FilePath test_cflow.c -Encoding ASCII

Write-Host "Running: wnus cflow test_cflow.c"
.\wnus.exe cflow test_cflow.c
Write-Host ""

# Test 4: Man pages
Write-Host "Test 4: Man pages" -ForegroundColor Green
Write-Host "Running: wnus man asa"
.\wnus.exe -c "man asa" | Select-Object -First 20
Write-Host ""

# Test 5: Whatis database
Write-Host "Test 5: Whatis/Apropos" -ForegroundColor Green
Write-Host "Running: wnus whatis asa"
.\wnus.exe -c "whatis asa"
Write-Host "Running: wnus whatis batch"
.\wnus.exe -c "whatis batch"
Write-Host "Running: wnus whatis cflow"
.\wnus.exe -c "whatis cflow"
Write-Host ""

# Test 6: Version check
Write-Host "Test 6: Version verification" -ForegroundColor Green
Write-Host "Checking version number..."
$versionOutput = .\wnus.exe -c "echo \`$WNUS_VERSION" 2>&1
Write-Host "Version: $versionOutput"
Write-Host ""

Write-Host "All tests completed!" -ForegroundColor Cyan
