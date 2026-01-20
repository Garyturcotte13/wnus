@echo off
setlocal enabledelayedexpansion

cd /d "c:\stuff\distribution\cpp\garysconsole"

echo Test 1: awk with print $1
.\garysconsole.exe -c "awk {print $1} test_awk.txt"

echo.
echo Test 2: awk with NR greater than 1
.\garysconsole.exe -c "awk NR 1 test_awk.txt"

echo.
echo Test 3: awk help
.\garysconsole.exe -c "awk -h"
