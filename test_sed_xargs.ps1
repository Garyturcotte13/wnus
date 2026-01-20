#!/usr/bin/env powershell
# Test sed and xargs commands

Write-Host "Testing sed basic substitution..."
.\garysconsole.exe -c "sed 's/foo/bar/' test_sed_input.txt" 2>&1

Write-Host "`nTesting sed global substitution..."
.\garysconsole.exe -c "sed 's/foo/bar/g' test_sed_input.txt" 2>&1

Write-Host "`nTesting sed case-insensitive..."
.\garysconsole.exe -c "sed 's/the/THE/i' test_sed_input.txt" 2>&1

Write-Host "`nTesting sed --help..."
.\garysconsole.exe -c "sed --help" 2>&1

Write-Host "`nTesting xargs --help..."
.\garysconsole.exe -c "xargs --help" 2>&1
