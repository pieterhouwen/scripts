@echo off
cls
net session 2>&1 >nul
if %errorlevel% NEQ 0 goto perm_fail
:perm_success
echo Downloading bcdedit to current folder. . . 
set desktop=%userprofile%\desktop
rem VEROUDERD: bitsadmin /transfer bcdedit /download /priority normal https://pieterhouwen.info/scripts/programs/bcdedit.exe %cd%\bcdedit.exe $Env:cd\bcdedit.exe	
rem powershell -command (New-Object System.Net.WebClient).DownloadFile("https://pieterhouwen.info/scripts/programs/bcdedit.exe", "bcdedit.exe")  
powershell -Command (New-Object System.Net.WebClient).DownloadFile("https://pieterhouwen.info/scripts/programs/bcdedit.exe", "C:\Windows\Temp\bcdedit.exe")
pause
echo Download complete, press any key to set the old boot menu.
bcdedit /set {default} bootmenupolicy legacy
if %errorlevel% NEQ 0 goto bcd_fail
pause
exit
:perm_fail
echo This program is not running as admin, please restart with the appropriate privileges.
pause
exit
:bcd_fail
echo Something went wrong, please check the output of the command and try again.
pause