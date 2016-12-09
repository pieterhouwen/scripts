@echo off
cls
title Extreme OverScript
echo Checking permissions....
echo Temp >%windir%\tempfile
if %errorlevel% == 1 then goto perm_fail
:perm_fail
echo U heeft niet 
:main
echo.
echo Welkom in de all-in-one batch toolkit!
echo.
echo.
echo ----------------------------------------------------
echo -                                                  -
echo - 1. Windows System Tools                          -
echo - 2. Hardware information                          -
echo - 3. Network Tools                                 -
echo -                                                  -
echo ----------------------------------------------------
set /p choiche=Maak uw keuze:
if 