# Test awk command
cd "c:\stuff\distribution\cpp\garysconsole"

# Test 1: Extract first field
Write-Host "Test 1: awk '{print `$1}' test_awk.txt"
.\garysconsole.exe -c "awk '{print `$1}' test_awk.txt"

# Test 2: Extract second field
Write-Host "`nTest 2: awk '{print `$2}' test_awk.txt"
.\garysconsole.exe -c "awk '{print `$2}' test_awk.txt"

# Test 3: Pattern matching
Write-Host "`nTest 3: awk '/jane/' test_awk.txt"
.\garysconsole.exe -c "awk '/jane/' test_awk.txt"

# Test 4: Line number condition
Write-Host "`nTest 4: awk 'NR > 1' test_awk.txt"
.\garysconsole.exe -c "awk 'NR > 1' test_awk.txt"
