#!/usr/bin/env powershell
# Test id and uname commands

Write-Host "Testing id..."
.\garysconsole.exe -c "id" 2>&1

Write-Host "`nTesting id -u..."
.\garysconsole.exe -c "id -u" 2>&1

Write-Host "`nTesting id -g..."
.\garysconsole.exe -c "id -g" 2>&1

Write-Host "`nTesting uname..."
.\garysconsole.exe -c "uname" 2>&1

Write-Host "`nTesting uname -a..."
.\garysconsole.exe -c "uname -a" 2>&1

Write-Host "`nTesting uname -n..."
.\garysconsole.exe -c "uname -n" 2>&1

Write-Host "`nTesting uname -m..."
.\garysconsole.exe -c "uname -m" 2>&1

Write-Host "`nTesting id --help..."
.\garysconsole.exe -c "id --help" 2>&1

Write-Host "`nTesting uname --help..."
.\garysconsole.exe -c "uname --help" 2>&1
