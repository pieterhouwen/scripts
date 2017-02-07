@echo off
cls
title Adding/removing IP addresses to network interface

:menu
echo.         
echo ^|-------------------------------------------------^|
echo ^|Adding/removing IP addresses to network interface^|
echo ^|-------------------------------------------------^|
echo.
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
echo.
echo You can also choose to reset the entire IP-stack, but this will only work again if you restart the computer.
echo To do this, type "reset" at the IP input field.
set /p interface=Please type the name of the interface you want to remove an IP from:
set /p ip=Please type in the IP address you wish to remove: 
if %ip% == "reset" goto rstinterface
netsh interface ipv4 delete address "%interface%" addr=%ip% gateway=all
if %errorlevel% == 1 goto error
goto noerror

:rstinterface
netsh interface ipv4 reset
echo Computer must be rebooted for changes to take effect. Do that now?
set /p restart=Restart computer? (Y/N):
if %restart% == "Y" shutdown -r -t 00
if %restart% == "y" shutdown -r -t 00
if %restart% == "N" echo Shutdown cancelled.
if %restart% == "n" echo Shutdown cancelled.
pause
goto end

:add
echo.
netsh interface ipv4 show interfaces
echo.
set /p interface=Please type the name of the interface you want to add an IP to: 
set /p ip=Please enter the IP you want to add: 
set /p subnet=Enter subnetmask (default 255.255.255.0): 
if %subnet% == "" goto nosubnet
if %ip% == "" goto noip
pause
:subnet
netsh interface ipv4 add address "%interface%" %ip% %subnet%
if %errorlevel% == 1 goto error
goto noerror

:nosubnet
netsh interface ipv4 add address "%interface%" %ip% 255.255.255.0
pause
goto noerror

:noip
echo You haven't given an IP address, please try again!
goto add

:error
echo Invalid configuration, please try again.
pause
cls
goto menu


:noerror
echo Complete!
pause

:end