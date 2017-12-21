@echo off
echo Startup items are:
echo.
mode 500
wmic startup get name, command
pause