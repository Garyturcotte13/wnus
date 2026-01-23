#!/bin/sh
# Comprehensive sh smoke tests

echo "=== SH SMOKE TESTS ==="
echo

# Test 1: Basic echo
echo "Test 1: Basic echo"
echo "Hello from sh"
echo

# Test 2: Variable assignment and expansion
echo "Test 2: Variable expansion"
x=42
echo "x=$x"
name="world"
echo "Hello $name"
echo

# Test 3: Inline if/then/fi
echo "Test 3: Inline if/then/fi"
if [ 5 -gt 3 ]; then echo "5 > 3: PASS"; fi
if [ 2 -gt 5 ]; then echo "2 > 5: FAIL"; else echo "2 > 5: PASS (else)"; fi
echo

# Test 4: Inline for loop
echo "Test 4: Inline for loop"
for i in 1 2 3; do echo "  i=$i"; done
echo

# Test 5: Arithmetic expansion
echo "Test 5: Arithmetic expansion"
echo "2 + 3 = $((2 + 3))"
echo "10 * 4 = $((10 * 4))"
echo "15 / 3 = $((15 / 3))"
echo

# Test 6: Command substitution
echo "Test 6: Command substitution"
result=$(echo "nested")
echo "Result: $result"
echo

# Test 7: Redirect to /dev/null
echo "Test 7: Redirect to /dev/null"
echo "invisible" > /dev/null
echo "After /dev/null redirect: PASS"
echo

# Test 8: File I/O
echo "Test 8: File I/O"
echo "test content" > smoke_temp.txt
if [ -f smoke_temp.txt ]; then echo "File created: PASS"; fi
echo

# Test 9: Test expressions
echo "Test 9: Test expressions"
if [ "abc" = "abc" ]; then echo "String equality: PASS"; fi
if [ 10 -eq 10 ]; then echo "Numeric equality: PASS"; fi
if [ 5 -lt 10 ]; then echo "Less than: PASS"; fi
if [ 10 -ge 10 ]; then echo "Greater or equal: PASS"; fi
echo

# Test 10: Multiple commands with semicolons
echo "Test 10: Multiple commands"
echo "First"; echo "Second"; echo "Third"
echo

echo "=== ALL TESTS COMPLETE ==="
