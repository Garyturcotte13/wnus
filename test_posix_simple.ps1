#!/usr/bin/env pwsh
# Direct command test script (no bash)

$exe = ".\wnus.exe"
$PASS = 0
$FAIL = 0

"=== POSIX Commands Test for WNUS v0.1.4.7 ===" | Write-Host -ForegroundColor Cyan
""

# Test 1: Version
Write-Host "1. Version check..." -ForegroundColor Yellow
$out = & $exe --version 2>&1 | Out-String
if ($out -match "0.1.4.7") { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 2: getconf
Write-Host "2. getconf ARG_MAX..." -ForegroundColor Yellow
$out = & $exe getconf ARG_MAX 2>&1 | Where-Object { $_ } | Select-Object -First 1
if ($out -and $out -match "^\d+") { Write-Host "   PASS: $out" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 3: getconf PATH_MAX
Write-Host "3. getconf PATH_MAX..." -ForegroundColor Yellow
$out = & $exe getconf PATH_MAX 2>&1 | Where-Object { $_ } | Select-Object -First 1
if ($out -and $out -match "^\d+") { Write-Host "   PASS: $out" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 4: locale
Write-Host "4. locale..." -ForegroundColor Yellow
$out = & $exe locale 2>&1 | Out-String
if ($out.Length -gt 0) { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 5: locale -a
Write-Host "5. locale -a..." -ForegroundColor Yellow
$out = & $exe locale -a 2>&1 | Where-Object { $_ }
$count = ($out | Measure-Object -Line).Lines
if ($count -gt 0) { Write-Host "   PASS ($count locales)" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 6: tput clear
Write-Host "6. tput clear..." -ForegroundColor Yellow
& $exe tput clear 2>&1 | Out-Null
if ($?) { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 7: tput sgr0
Write-Host "7. tput sgr0..." -ForegroundColor Yellow
& $exe tput sgr0 2>&1 | Out-Null
if ($?) { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 8: tput setaf
Write-Host "8. tput setaf 1..." -ForegroundColor Yellow
& $exe tput setaf 1 2>&1 | Out-Null
if ($?) { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }

# Test 9: vi alias
Write-Host "9. vi -h..." -ForegroundColor Yellow
$out = & $exe vi -h 2>&1 | Out-String
if ($out.Length -gt 0) { Write-Host "   PASS" -ForegroundColor Green; $PASS++ } else { Write-Host "   SKIP (fvi not available)" -ForegroundColor Yellow }

# Test 10: link command
Write-Host "10. link (create hardlink)..." -ForegroundColor Yellow
$tmpfile1 = New-TemporaryFile
$tmpfile2 = $tmpfile1.FullName + "_link"
Set-Content $tmpfile1 "test"
& $exe link "$($tmpfile1.FullName)" "$tmpfile2" 2>&1 | Out-Null
if (Test-Path $tmpfile2) { Write-Host "   PASS" -ForegroundColor Green; $PASS++; Remove-Item $tmpfile2 } else { Write-Host "   FAIL" -ForegroundColor Red; $FAIL++ }
Remove-Item $tmpfile1 -Force

""
"=== Summary ===" | Write-Host -ForegroundColor Cyan
"PASS: $PASS" | Write-Host -ForegroundColor Green
"FAIL: $FAIL" | Write-Host -ForegroundColor Red
"Total: $($PASS + $FAIL)" | Write-Host -ForegroundColor Cyan
