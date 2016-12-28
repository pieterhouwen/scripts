@echo off
cls
title Extreme OverScript
echo Checking permissions....
rem Het volgende commando doet eigenlijk niks, maar het kan niet uitgevoerd worden als je niet admin bent, dus gebruiken we dat als check.
net session 2>&1 >nul
rem 2>&1 betekent dat de tweede outputstroom (de errors) naar de eerste outputstroom wordt geleid (normale output)
rem >nul betekent dat hij de normale outputstroom wegschrijft naar een niet-bestaand bestand.
if %errorlevel% == 0 goto perm_success
rem Hier checken we of de opdracht goed is gegaan, als de exitcode 0 is betekent dat dat er geen fouten zijn voorgekomen, dus wordt
rem hij als administrator gedraaid, dus slaan we het volgende stuk over, en gaan we direct naar 't hoofdmenu.
goto perm_fail
rem Hier geven we aan dat als hij op dit punt is aangekomen het programma blijkbaar niet wordt uitgevoerd als admin, dus leiden we hem
rem om naar de onderkant van dit script, waar hij hem opnieuw probeert te starten als admin. 
rem LET OP: Als er spaties in de maplocatie zitten zal het niet werken om hem als admin te starten. 

:perm_success
cls
rem cls staat voor CLearScreen, wat dus het scherm leegmaakt.
rem Als we hier aankomen betekent 't dus dat hij wordt uitgevoerd als admin.

:main
cls
echo.
echo       Welkom in de all-in-one batch toolkit!
echo.
echo ^|-------------------------------------------------^|
echo ^|                                                 ^|
echo ^| 1. Windows System Tools                         ^|
echo ^| 2. Hardware information/tools                   ^|
echo ^| 3. Network Tools                                ^|
echo ^|                                                 ^|
echo ^|           Made by Pieter and Roland             ^|
echo ^|                                                 ^|
echo ^|-------------------------------------------------^|
echo.
rem Het volgende commando maakt een variabele aan genaamd choice, wat dus een cijfer van 1 tot 3 moet bevatten.
set /p choice=Maak uw keuze:
if %choice% == 1 goto winsystools
if %choice% == 2 goto hwtools
if %choice% == 3 goto nettools
rem Als de code hier aankomt betekent het dus dat er niet op 1,2 of 3 is gedrukt, dus is het foute invoer, dus geven we
rem de gebruiker een melding en gaan weer naar 't hoofdmenu.
echo Onjuiste invoer! Probeer het opnieuw.
pause
rem pause geeft een bericht weer dat je op een toets moet drukken om door te gaan.
goto main

rem Een woord met een : ervoor heet een label, dit zijn handvaten voor CMD waar hij heen moet springen om verder te gaan met
rem het uitvoeren van de code.

:winsystools
cls
echo.
echo             Windows System Tools menu    
echo.
echo ^|--------------------------------------------------^|
echo ^|                                                  ^|
echo ^| 1. Fast Universal Cleaning Kit                   ^|
echo ^| 2. Legacy bootmenu switcher                      ^|
echo ^| 3. Outlook profile resetter                      ^|
echo ^| 4. Windows 7 Version changer (CD/DVD required)   ^|
echo ^| 5. Show drives and free space                    ^|
echo ^| 6. System File Checker                           ^|
echo ^|                                                  ^|
echo ^|--------------------------------------------------^|
echo.
set /p choice=Maak uw keuze:
if %choice% == 1 goto cleansys
if %choice% == 2 goto bcdedit
if %choice% == 3 goto outlookreset
if %choice% == 4 goto win7change
if %choice% == 5 goto showdrives
if %choice% == 6 goto sfc

:cleansys


:hwtools
cls
echo.
echo           Windows Hardware Tools
echo.
echo ^|--------------------------------------------------^|
echo ^|                                                  ^|
echo ^| 1. Get motherboard info                          ^|
echo ^| 2. Get RAM size (bytes) speed, type, bus         ^|
echo ^|                                                  ^|
echo ^|--------------------------------------------------^|
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
echo.
echo ^|--------------------------------------------------^|
echo ^|                                                  ^|
echo ^| 1. Firewall Settings Menu                        ^|
echo ^| 2. Add IP to network interface                   ^|
echo ^|                                                  ^|
echo ^|--------------------------------------------------^|

:perm_fail
echo U heeft niet de goede permissies, start dit programma opnieuw als admin om het te gebruiken.
echo Druk op een toets om dit programma als admin te starten.
pause >nul
rem Het volgende commando probeert met powershell het huidige script nogmaals te starten (%0), maar dit keer als admin.
powershell "saps -filepath %0 -verb runas"
exit