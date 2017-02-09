@echo off
cls
net session >nul
if %errorlevel% == 0 goto mainexecution
echo Permissions inadequate, trying again as admin.
rem The following command tries to run itself (%0) as admin.
powershell "saps -filepath %0 -verb runas"
goto end

:mainexecution
echo Note: All users should be able to view the image or else the background will be empty!
set /p location=Specify where the image is located (example C:\image.jpg):
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v Wallpaper /t reg_sz /d %location%
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v WallpaperStyle /t reg_sz /d 2
pause

:end