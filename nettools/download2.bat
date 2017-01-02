@echo off
title Downloader
set name=%1
set link=%2
set location=%3
bitsadmin /transfer %name% /download /priority normal %link% %location%
if %errorlevel% NEQ 0 goto download_error
pause
exit
:download_error
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('$Env:link', '$Env:temp\ $Env:location')
if %errorlevel% NEQ 0 goto download_error_ftp
pause
exit
rem Werkt niet op subdirectories
:download_error_ftp
ftpdownload.bat %location%
pause
