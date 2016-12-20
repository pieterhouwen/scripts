@echo off
echo Startup items are:
echo.
wmic startup get name, command
pause