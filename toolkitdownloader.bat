@echo off
cls
echo Downloading toolkit, please wait. . .
mkdir toolkit & cd toolkit

bitsadmin /transfer overscript /download /priority normal https://github.com/pieterhouwen/scripts/overscript.bat toolkit/overscript.bat 2>overscript_log.log 1>nul

if %errorlevel% NEQ 0 goto download_error_os

bitsadmin /transfer motherboard /download /priority normal https://github.com/pieterhouwen/scripts/motherboard.bat toolkit/motherboard.bat 2>motherboard_log.log 1>nul
if %errorlevel% NEQ 0 goto download_error_mb
bitsadmin /transfer outlookreset /download /priority normal https://github.com/pieterhouwen/scripts/outlookreset.bat toolkit/outlookreset.bat 2>outlookreset_log.log 1>nul
if %errorlevel% NEQ 0 goto download_error_or

:download_error_os
:download_error_mb
:download_error_or