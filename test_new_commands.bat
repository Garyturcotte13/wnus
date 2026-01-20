@echo off
cd /d C:\stuff\distribution\cpp\garysconsole
echo version | wnus.exe
echo:
echo whatis expand | wnus.exe
echo:
echo whatis unexpand | wnus.exe
echo:
echo whatis od | wnus.exe
echo:
echo whatis hexdump | wnus.exe
echo:
echo whatis strings | wnus.exe
echo:
echo whatis column | wnus.exe
echo:
echo whatis comm | wnus.exe
echo:
echo help | wnus.exe | findstr /I "expand unexpand od hexdump strings column comm"
