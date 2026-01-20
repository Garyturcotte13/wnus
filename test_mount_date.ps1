#!/usr/bin/env powershell
# Test mount and date commands

Write-Host "Testing mount command..."
& ".\garysconsole.exe" -c "mount" 2>&1 | Select-Object -First 15

Write-Host "`nTesting date command..."
& ".\garysconsole.exe" -c "date" 2>&1 | Select-Object -First 5

Write-Host "`nTesting date with format..."
& ".\garysconsole.exe" -c "date '+%Y-%m-%d %H:%M:%S'" 2>&1 | Select-Object -First 5

Write-Host "`nTesting mount help..."
& ".\garysconsole.exe" -c "mount --help" 2>&1 | Select-Object -First 10

Write-Host "`nTesting date help..."
& ".\garysconsole.exe" -c "date --help" 2>&1 | Select-Object -First 20
