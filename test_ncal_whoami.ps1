#!/usr/bin/env powershell
# Test ncal and whoami commands

Write-Host "Testing whoami command..."
.\garysconsole.exe -c "whoami" 2>&1

Write-Host "`nTesting whoami -u (user only)..."
.\garysconsole.exe -c "whoami -u" 2>&1

Write-Host "`nTesting whoami -d (domain only)..."
.\garysconsole.exe -c "whoami -d" 2>&1

Write-Host "`nTesting whoami -s (status)..."
.\garysconsole.exe -c "whoami -s" 2>&1

Write-Host "`nTesting ncal (current month)..."
.\garysconsole.exe -c "ncal" 2>&1

Write-Host "`nTesting ncal 2026 (full year)..."
.\garysconsole.exe -c "ncal 2026" 2>&1 | Select-Object -First 70

Write-Host "`nTesting ncal 2 2026 (February 2026)..."
.\garysconsole.exe -c "ncal 2 2026" 2>&1

Write-Host "`nTesting whoami --help..."
.\garysconsole.exe -c "whoami --help" 2>&1

Write-Host "`nTesting ncal --help..."
.\garysconsole.exe -c "ncal --help" 2>&1
