title SMART monitoring tool
wmic diskdrive get caption, status >%userprofile%\smartmon.log
findstr -v "OK" %userprofile%\smartmon.log
if %errorlevel% NEQ 1 goto warning
goto nowarning
:warning
echo msgbox("Your hard drive monitoring system has been triggered! Press OK to learn more.") >%temp%\alert.vbs
%temp%\alert.vbs
cmd.exe /C "wmic diskdrive get caption, status" & pause
:nowarning
echo msgbox("All drives report normal.") >%temp%\alert.vbs
%temp%\alert.vbs
