@echo off
cls
title Extreme OverScript
echo Checking permissions....
net session 2>&1 >nul
if %errorlevel% == 0 goto perm_success
goto perm_fail
:perm_success
:main
cls
echo.
echo       Welkom in de all-in-one batch toolkit!
echo.
echo ----------------------------------------------------
echo -                                                  -
echo - 1. Windows System Tools                          -
echo - 2. Hardware information/tools                    -
echo - 3. Network Tools                                 -
echo -                                                  -
echo -           Made by Pieter and Roland              -
echo -                                                  -
echo ----------------------------------------------------
echo.
set /p choice=Maak uw keuze:
if %choice% == 1 goto winsystools
if %choice% == 2 goto hwtools
if %choice% == 3 goto nettools

:winsystools
cls
echo.
echo             Windows System Tools menu    
echo.
echo ----------------------------------------------------
echo -                                                  -
echo - 1. Fast Universal Cleaning Kit                   -
echo - 2. Legacy bootmenu switcher                      -
echo - 3. Outlook profile resetter                      -
echo - 4. Windows 7 Version changer (CD/DVD required)   -
echo - 5. Show drives and free space                    -
echo - 6. System File Checker                           -
echo -                                                  -
echo -           Made by Pieter and Roland              -
echo -                                                  -
echo ----------------------------------------------------
echo.
set /p choice=Maak uw keuze:
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 


:hwtools
cls
echo.
echo           Windows Hardware Tools
echo.
echo ----------------------------------------------------
echo -                                                  -
echo - 1. Get motherboard info                          -
echo -                                                  -
echo -           Made by Pieter and Roland              -
echo -                                                  -
echo ----------------------------------------------------
set /p choice=Maak uw keuze:
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
if %choice% == goto 
:nettools
cls
echo          Windows Network Tools

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