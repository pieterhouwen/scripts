
title Downloader
set name=%1
set link=%2
rem set location=%3
set i=0
set var1=%link%
:loopprocess
for /F "tokens=1* delims=/" %%A in ( "%var1%" ) do (
  set /A i+=1
  set var1=%%B
  goto loopprocess )

echo The string contains %i% tokens.


for /f "tokens=%i% delims=/" %%F in (%link%) do set url=%%F
for /f %%a in (%url%) do set location=%%a
set curdir=%cd%
:download_bitsadmin
bitsadmin /transfer %name% /download /priority normal %link% %curdir%\%location%
if %errorlevel% NEQ 0 goto download_error

exit
:download_error
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('$Env:link', '$Env:temp\')
if %errorlevel% NEQ 0 goto download_error_ftp
pause
exit
rem Werkt niet op subdirectories
:download_error_ftp
ftpdownload.bat %location%
pause
