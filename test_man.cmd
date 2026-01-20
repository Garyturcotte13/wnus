@echo off
echo Testing man command with different options
echo.
echo === Testing man without arguments ===
garysconsole.exe -c "man"
echo.
echo === Testing man ln ===
garysconsole.exe -c "man ln"
echo.
echo === Testing man version ===
garysconsole.exe -c "man version"
echo.
echo === Testing man wc ===
garysconsole.exe -c "man wc"
echo.
echo === Testing man nano ===
garysconsole.exe -c "man nano"
echo.
echo Tests complete!
