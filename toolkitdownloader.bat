@echo off
cls
echo Downloading toolkit, please wait. . .
mkdir toolkit & cd toolkit

:download_os
bitsadmin /transfer overscript /download /priority normal https://github.com/pieterhouwen/scripts/overscript.bat overscript.bat 2>overscript_log.log 1>nul
if %errorlevel% NEQ 0 goto download_error_os

:download_mb
bitsadmin /transfer motherboard /download /priority normal https://github.com/pieterhouwen/scripts/motherboard.bat motherboard.bat 2>motherboard_log.log 1>nul
if %errorlevel% NEQ 0 goto download_error_mb

:download_or
bitsadmin /transfer outlookreset /download /priority normal https://github.com/pieterhouwen/scripts/outlookreset.bat outlookreset.bat 2>outlookreset_log.log 1>nul
if %errorlevel% NEQ 0 goto download_error_or





REM ERRORS

:download_error_os
echo Overscript failed to download, trying another method.
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('https://github.com/pieterhouwen/scripts/tree/master/overscript.bat', '$Env:temp\overscript.bat')
if errorlevel NEQ 0 goto download_error_os2
copy %temp%\overscript.bat .
goto download_mb
pause

:download_error_mb
echo Motherboard failed to download, trying another method.powershell.exe -command (new-object System.Net.WebClient).DownloadFile('https://github.com/pieterhouwen/scripts/tree/master/motherboard.bat', '$Env:temp\motherboard.bat')
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('https://github.com/pieterhouwen/scripts/tree/master/overscript.bat', '$Env:temp\overscript.bat')
if errorlevel NEQ 0 goto download_error_mb2
copy %temp%\motherboard.bat .

:download_error_or
echo Outlokreset failed to download, trying another method.
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('https://github.com/pieterhouwen/scripts/tree/master/outlookreset.bat', '$Env:temp\outlookreset.bat')
if errorlevel NEQ 0 goto download_error_or2
copy %temp%\outlookreset.bat .

:download_error_os2
echo Something went wrong again, please check the output.
pause
exit

:download_error_mb2
echo Something went wrong again, please check the output.
pause
exit

:download_error_or2
echo Something went wrong again, please check the output.
pause
exit