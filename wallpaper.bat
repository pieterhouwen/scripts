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

:writekey
echo Windows Registry Editor Version 5.00 >%temp%\wallpaper.reg
echo. >>%temp%\wallpaper.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >>%temp%\wallpaper.reg
echo "WallpaperStyle"="2" >>%temp%\wallpaper.reg
reg import %temp%\wallpaper.reg
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v Wallpaper /d "%location%" /f /t REG_SZ
echo Done
pause
