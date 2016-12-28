@echo off
title Windows Version Changer door Roland van Dam

net session >nul 2>&1
if %errorlevel% == 0 goto menu
echo Dit programma wordt niet uitgevoerd als admin, opnieuw starten als admin. . . 
powershell "saps -filepath %0 -verb runas"
pause

exit
:menu
cls
echo ----------------------------------------------------
echo -                                                  -	
echo - LET OP: U MOET DE WINDOWS INSTALLATIE CD HEBBEN! -
echo -                                                  -
echo ----------------------------------------------------
echo.
echo Uw geinstalleerde Windows versie is momenteel:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName
echo welke Windows versie wilt Uw installeren?
echo kies 1 voor Windows Professional.
echo kies 2 voor Windows Home Premium.
echo kies 3 voor Windows Ultimate.
echo kies 4 voor Windows Enterprise.
set /p windowsinstalleren=Maak uw keuze: 
if %windowsinstalleren% == 1 goto WinPro
if %windowsinstalleren% == 2 goto WinPrem
if %windowsinstalleren% == 3 goto WinUlt
if %windowsinstalleren% == 4 goto WinEnt
goto verkeerdekeuze
:WinPro
echo U heeft gekozen voor Windows 7 Professional
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Professional" /f >dumpbestand
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Professional" /f >dumpbestand

goto end
:WinPrem
echo U heeft gekozen voor Windows 7 Home Premium
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 HomePremium" /f >dumpbestand
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "HomePremium" /f >dumpbestand

goto end
:WinUlt
echo U heeft gekozen voor Windows 7 Ultimate
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Ultimate" /f >dumpbestand
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Ultimate" /f >dumpbestand

goto end
:WinEnt
echo U heeft gekozen voor Windows 7 Enterprise
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Enterprise" /f >dumpbestand
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Enterprise" /f >dumpbestand

goto end
:verkeerdekeuze
echo U heeft een verkeerde keuze gemaakt!
echo Druk op een toets om terug te gaan naar het hoofdmenu.
pause
goto menu

:end
echo Complete!
echo
pause
del dumpbestand
REM Ode aan Roland!
exit