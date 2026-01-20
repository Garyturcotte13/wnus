@echo off
setlocal enabledelayedexpansion

REM Test the history command
echo Testing history command...

(
  echo pwd
  echo ls test*.txt
  echo echo "Test 1"
  echo echo "Test 2"
  echo echo "Test 3"
  echo history
  echo history -n 2
  echo history -s test
  echo exit
) | .\garysconsole.exe > test_history_output.txt 2>&1

echo History test completed. Output saved to test_history_output.txt
type test_history_output.txt | findstr /i history
