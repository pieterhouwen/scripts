wmic diskdrive get caption, status >%userprofile%\smartmon.log
findstr -v "OK" %userprofile%\smartmon.log
if %errorlevel% NEQ 1 goto warning
:warning
echo msgbox("Your hard drive monitoring system has been triggered! Press OK to learn more.") >%tmp%\alert.vbs
start alert.vbs
cmd.exe /C "wmic diskdrive get caption, status" & pause