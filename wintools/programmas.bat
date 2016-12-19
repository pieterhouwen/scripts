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
echo Wilt u een programma starten?
echo | set /p none="Maak uw keuze:"
set /p c=[Y/N]?
cls
if %c% == Y goto :startup
if %c% == N goto :afsluiten
if %c% == y goto :startup
if %c% == n goto :afsluiten
goto vekeerdekeuze

:vekeerdekeuze
echo U heeft een verkeerde keuze gemaakt!
echo Druk op een toets om terug te gaan naar het hoofdmenu.
pause
goto menu-begin
pause

:menu-start
:startup
echo Welk programma wilt u starten?
echo.
echo kies 1  om Google Chrome te starten.
echo kies 2  om cmd te starten.
echo kies 3  om skype te starten.
echo kies 4  om taakbeheer te starten.
echo kies 5  om kladblok te starten.
echo kies 6  om sublime script te starten.
echo kies 7  om configuratiescherm te starten.
echo kies 8  om msconfig te starten.
echo kies 9  om appdata te starten.
echo kies 10 om terug te gaan.
echo.
set /p c=Kies een nummer:
if %c% == 1  call  "C:\Users\roland\AppData\Local\Google\Chrome\Application\chrome.exe" & exit
if %c% == 2  call  "C:\Windows\System32\cmd.exe" & exit
if %c% == 3  call  "C:\Program Files (x86)\Skype\Phone\skype.exe" & exit
if %c% == 4  call  "C:\Windows\System32\taskmgr.exe" & exit
if %c% == 5  call  "C:\Windows\notepad.exe" & exit
if %c% == 6  call  "C:\Program Files\Sublime Text 3\sublime_text.exe" & exit
if %c% == 7  call  "c:\Windows\system32\control.exe" & exit
if %c% == 8  call  "c:\Windows\system32\msconfig.exe" & exit
if %c% == 9  goto  appdata
if %c% == 10 goto  menu-begin
goto vekeerdekeuze2

:vekeerdekeuze2
echo U heeft een verkeerde keuze gemaakt!
echo Druk op een toets om terug te gaan naar het hoofdmenu.
pause
cls
goto menu-start

:menu-programma-stoppen
:afsluiten
cls
echo Wilt u een programma stoppen/Y?
echo.
echo Wilt u cmd afsluiten/N?
echo.
ECHO -----------------------------------
echo -                                 -	
echo - TOETS "TERUG" OM TERUG TE GAAN! -
echo -                                 -
echo -----------------------------------
echo.
echo | set /p none="Maak uw keuze:"
set /p c=[Y/N/TERUG]?
cls
if %c% == Y goto :programmaafsluiten
if %c% == N goto :end
if %c% == y goto :programmaafsluiten
if %c% == n goto :end
IF %c% == TERUG goto :menu-begin
if %c% == terug goto :menu-begin

:menuafsluiten
:programmaafsluiten
echo Welk programma wilt u afsluiten?
echo.
echo kies 1  om Google Chrome af te sluiten.
echo kies 2  om cmd af te sluiten.
echo kies 3  om skype af te sluiten.
echo kies 4  om taakbeheer af te sluiten.
echo kies 5  om kladblok af te sluiten.
echo kies 6  om sublime script af te sluiten.
echo kies 7  om configuratiescherm af te sluiten.
echo kies 8  om msconfig af te sluiten.
echo kies 9  om terug te gaan.
set /p c=Kies een nummer:

if %c% == 1  taskkill /f /im chrome.exe
if %c% == 2  taskkill /f /im cmd.exe
if %c% == 3  taskkill /f /im skype.exe
if %c% == 4  taskkill /f /im taskmgr.exe
if %c% == 5  taskkill /f /im notepad.exe
if %c% == 6  taskkill /f /im sublime_text.exe
if %c% == 7  taskkill /f /im control.exe
if %c% == 8  taskkill /f /im msconfig.exe 
if %c% == 9  goto afsluiten
goto vekeerdekeuze3

:AppData
echo Klik op enter om appdata te starten.
set appdata=%userprofile%\appdata
start explorer.exe %appdata% & exit
exit

:vekeerdekeuze3
echo U heeft een verkeerde keuze gemaakt!
echo Druk op een toets om terug te gaan naar het hoofdmenu.
pause
cls
goto menuafsluiten

:end
exit

REM Ode aan Roland!