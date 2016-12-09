@echo off
cls
title Extreme OverScript
echo Checking permissions....
echo Temp >%windir%\tempfile
if %errorlevel% == 1 then goto perm_fail
:main
echo.
echo Welkom in de all-in-one batch toolkit!
echo.
echo.
echo ----------------------------------------------------
echo -                                                  -
echo - 1. Windows System Tools                          -
echo - 2. Hardware information/tools                    -
echo - 3. Network Tools                                 -
echo -                                                  -
echo ----------------------------------------------------
set /p choiche=Maak uw keuze:
if %choice% == 1 goto winsystools
if %choice% == 2 goto hwtools
if %choice% == 3 goto nettools







:perm_fail
echo U heeft niet de goede permissies, start dit programma opnieuw als admin om het te gebruiken.
pause >nul
exit