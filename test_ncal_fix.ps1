#!/usr/bin/env powershell
# Test ncal fix

Write-Host "Testing January 2026..."
.\garysconsole.exe -c "ncal 1 2026" 2>&1 | tail -20

Write-Host "`nTesting February 2026..."
.\garysconsole.exe -c "ncal 2 2026" 2>&1 | tail -10

Write-Host "`nTesting current month..."
.\garysconsole.exe -c "ncal" 2>&1 | tail -10
