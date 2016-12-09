@echo off
cls
title Extreme OverScript
echo Checking permissions....
net session 2>&1 >nul
if %errorlevel% == 0 then goto perm_success
goto perm_fail
:perm_success
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

:winsystool
:hwtools
:nettools

REM TODO's
REM System cleaner van pieterhouwen.info/scripts/cleansys.bat
rem recoverytools (sfc) + win7 change + 
rem Files laten opstarten @ system startup
rem Opstartvolgorde aanvragen (registry)
rem Firewall regels toevoegen en verwijderen (poorten + IP's)
rem Firewall opties: alleen poorten (defineren als variable), executables, richtingen (in + uit)
rem Firewall opties: Regels toevoegen en verwijderen (alleen regels die wij zelf hebben aangemaakt)
rem Firewall opties: TIP: schrijf de namen van nieuwe regels weg naar bestand zodat je dat later weer kan
rem opvragen.

:perm_fail
echo U heeft niet de goede permissies, start dit programma opnieuw als admin om het te gebruiken.
echo Druk op een toets om dit programma als admin te starten.
pause >nul
runas /user:administrator %0
exit