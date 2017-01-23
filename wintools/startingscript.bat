@echo off
title service starten door Roland van Dam

net session >nul 2>&1
if %errorlevel% == 0 goto menu-begin
echo Dit programma wordt niet uitgevoerd als admin, fix die rechten yo.
pause
del nul
exit


:menu-begin
cls
echo kies een cijfer uit de lijst om een programma.bat te starten.
echo.
echo kies 1 om motherboard.bat te starten.
echo kies 2 om starting script.bat te starten.
echo kies 3 om windows7 change.bat te starten.
echo kies 4 om programmas.bat te starten.
echo kies 5 om showdrives.bat te starten.
echo.
set /p c=Maak uw keuze:
cls
if %c% == 1 goto :motherboard
if %c% == 2 goto :startingscript
if %c% == 3 goto :windows
if %c% == 4 goto :programma
if %c% == 5 goto :showdrives
goto vekeerdekeuze

:vekeerdekeuze
echo U heeft een verkeerde keuze gemaakt!
echo Druk op een toets om terug te gaan naar het hoofdmenu.
pause
goto menu-begin
pause


:motherboard

if %c% == 1  call "C:\Users\roland\Desktop\scripts\motherboard.bat"

:startingscript
if %c% == 2  call "C:\Users\roland\Desktop\scripts\starting script.bat"

:windows
if %c% == 3 call  "c:\users\roland\desktop\scripts\windows7 change.bat"

:programma
if %c% == 4 call  "c:\users\roland\desktop\scripts\programmas.bat"

:showdrives
if %c% == 5 call "c:\users\roland\desktop\scripts\showdrives.bat"