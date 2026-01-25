#!/bin/sh
# Test script for telnet and cmake commands

echo "=== Testing Telnet Command ==="
echo "Telnet help test:"
telnet -h 2>&1 | head -5

echo ""
echo "=== Testing CMake Command ==="
echo "CMake help test:"
cmake -h 2>&1 | head -5

echo ""
echo "=== Testing Man Pages ==="
echo "Telnet man page (first 10 lines):"
man telnet 2>&1 | head -10

echo ""
echo "CMake man page (first 10 lines):"
man cmake 2>&1 | head -10

echo ""
echo "=== Testing Whatis ==="
whatis telnet 2>&1
whatis cmake 2>&1

echo ""
echo "=== Help listing ==="
help 2>&1 | grep -E "telnet|cmake"
