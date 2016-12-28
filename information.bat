@echo off
title Information Finder
cls

REM Query installed language:
for /f "tokens=3 delims= " %%L in ('reg query hklm\system\controlset001\control\nls\language /v Installlanguage ^| findstr 0') do set lng=%%L
if %lng%==0413 set tkens=11
if %lng%==0409 set tkens=13
if %lng%==0413 set tkensdns=13
if %lng%==0409 set tkensdns=15

cls
echo Gathering info. . . 

bitsadmin /transfer externalIP /download /priority normal http://myexternalip.com/raw %temp%\extip.txt 2>download_error.log 1>nul
if %errorlevel% NEQ 0 goto extiperror
set /p extIP=<%temp%\extip.txt

:findinfo
REM find OS
for /f "tokens=* delims=" %%E in ('wmic os get caption ^| findstr -i windows') do set windows=%%E

REM find IP
for /f "tokens=14 delims= " %%B in ('ipconfig -all ^| findstr -i ipv4') do set pieter=%%B

REM find Current gateway and DNS
for /f "tokens=%tkens% delims= " %%A in ('ipconfig -all ^| findstr -i gateway ^| findstr -i -v ::') do set gw=%%A

for /f "tokens=%tkensdns% delims= " %%C in ('ipconfig -all ^| findstr -i dns ^| findstr -i server ^| findstr -v ::') do set dns=%%C

REM find processor
for /f "tokens=2 delims==" %%F in ('wmic cpu get name /format:list') do set cpu=%%F
cls
echo Hello %username%! You are running: %windows%
echo.
echo               Network information:
echo.
echo External IP: %extIP%
echo IP: %pieter%
echo.
echo Gateway: %gw%
echo DNS: %dns%




echo Processor: %cpu%		
pause

rem Current IP
rem Default gateway
rem username
rem RAM (bytes total + speed)
exit
:extiperror
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('http://myexternalip.com/raw', '$Env:temp\extip.txt')
goto findinfo