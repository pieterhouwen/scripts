@echo off
title Windows Version Changer by Roland van Dam

net session >nul 2>&1
if %errorlevel% == 0 goto WinVerMenu
echo Permissions inadequate, trying to run again as admin.
powershell "saps -filepath %0 -verb runas"
goto end

:WinVerMenu
cls
echo.
echo ^|-------------------------------------------------^|
echo ^| NOTE: YOU NEED THE ORIGINAL WINDOWS INSTALL CD! ^|
echo ^|      ALSO: THIS ONLY WORKS ON WINDOWS 7!        ^|
echo ^|-------------------------------------------------^|
echo.
echo Your currently installed Windows version is:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName
echo Which Windows version do you want to "install"?
echo Choose 1 voor Windows Professional.
echo Choose 2 voor Windows Home Premium.
echo Choose 3 voor Windows Ultimate.
echo Choose 4 voor Windows Enterprise.
set /p installver=Make your choice: 
if %installver% == 1 goto WinPro
if %installver% == 2 goto WinPrem
if %installver% == 3 goto WinUlt
if %installver% == 4 goto WinEnt
goto wrongchoice

:WinPro
echo You have chosen Windows 7 Professional
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Professional" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Professional" /f >nul
pause
goto end

:WinPrem
echo You have chosen Windows 7 Home Premium
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 HomePremium" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "HomePremium" /f >nul
pause
goto end

:WinUlt
echo You have chosen Windows 7 Ultimate
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Ultimate" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Ultimate" /f >nul
pause
goto end

:WinEnt
echo You have chosen Windows 7 Enterprise
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Enterprise" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Enterprise" /f >nul
pause
goto end

:wrongchoice
echo Invalid input! Please try again!
echo Press any key to return to the menu
pause
goto WinVerMenu