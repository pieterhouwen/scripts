@echo off
title SMART monitoring tool
echo Gathering info. . .
for /f "tokens=2 delims==" %%A in ('wmic diskdrive get status /format:list') do set status=%%A
if %status% NEQ OK goto warning
goto nowarning
:warning
echo msgbox("Your hard drive monitoring system has been triggered! Press OK to learn more.") >%temp%\alert.vbs
%temp%\alert.vbs
cmd.exe /C "wmic diskdrive get caption, status" & pause
:nowarning
