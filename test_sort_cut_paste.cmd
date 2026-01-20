@echo off
cd /d "c:\stuff\distribution\cpp\garysconsole"

REM Create test files
echo alice 25 nyc > test_cut.txt
echo bob 30 la >> test_cut.txt
echo charlie 35 chicago >> test_cut.txt

REM Test sort
echo Test 1: sort
.\garysconsole.exe -c "sort test_cut.txt"

echo.
echo Test 2: sort -r (reverse)
.\garysconsole.exe -c "sort -r test_cut.txt"

echo.
echo Test 3: cut -f 1 (extract field 1)
.\garysconsole.exe -c "cut -f 1 test_cut.txt"

echo.
echo Test 4: cut -f 1,3 (extract fields 1 and 3)
.\garysconsole.exe -c "cut -f 1,3 test_cut.txt"

echo.
echo Test 5: paste (merge)
echo line1 > file1.txt
echo line2 >> file1.txt
echo lineA > file2.txt
echo lineB >> file2.txt
.\garysconsole.exe -c "paste file1.txt file2.txt"

echo.
echo Test 6: paste with delimiter
.\garysconsole.exe -c "paste -d, file1.txt file2.txt"
