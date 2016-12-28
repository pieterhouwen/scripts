@echo off
title Information Finder
cls

REM Query installed language:
for /f "tokens=3 delims= " %%L in ('reg query hklm\system\controlset001\control\nls\language /v Installlanguage ^| findstr 0') do set lng=%%L
if %lng%==0413 set gateway=11
if %lng%==0409 set gateway=13

cls
echo Gathering info. . . 

REM find OS
for /f "tokens=* delims=" %%E in ('wmic os get caption ^| findstr -i windows') do set windows=%%E

REM find IP
for /f "tokens=14 delims= " %%B in ('ipconfig -all ^| findstr -i ipv4') do set pieter=%%B

REM find Current gateway
for /f "tokens=%gateway% delims= " %%A in ('ipconfig -all ^| findstr -i gateway ^| findstr -i -v ::') do set gw=%%A

REM find processor
for /f "tokens=2 delims==" %%F in ('wmic cpu get name /format:list') do set cpu=%%F
cls
echo Hello %username%! You are running: %windows%
echo.
echo IP: %pieter%		Gateway: %gw%
echo Processor: %cpu%		
pause

rem Current IP
rem Default gateway
rem username
rem RAM (bytes total + speed)
