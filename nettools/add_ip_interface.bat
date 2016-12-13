@echo off
cls
title Adding/removing IP addresses to network interface
echo Please select your desired network interface.


:menu
echo Please specify if you want to add or remove an address.
echo.
echo 1: Add an IP address to an interface.
echo 2: Remove an IP address from an interface.
echo.
set /p choice=Select your choice: 
if %choice% == 1 goto add
if %choice% == 2 goto remove
echo Incorrect choice, please try again.
goto menu


:remove
netsh interface ipv4 show interfaces
echo.
echo Please type the full name of the interface you want to remove an IP from: 
set /p interface=Please type the name of the interface you want to remove an IP from: 
netsh interface ipv4 delete address "%interface%" %ip%
if %errorlevel% == 1 goto error
goto noerror


:add
echo.
netsh interface ipv4 show interfaces
echo.
echo Please type the full name of the interface you want to add an IP to:
set /p interface=Please type the name of the interface you want to add an IP to: 
set /p ip=Please enter the IP you want to add: 
set /p subnet=Enter subnetmask (default 255.255.255.0): 
if %subnet% == "" goto nosubnet
pause
:subnet
netsh interface ipv4 add address "%interface%" %ip% %subnet%
if %errorlevel% == 1 goto error
goto noerror
:nosubnet
netsh interface ipv4 add address "%interface%" %ip% 255.255.255.0
goto noerror



:error
echo Invalid configuration, please try again.
pause
cls
goto menu


:noerror
echo Complete!
pause
exit