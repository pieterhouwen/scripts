@echo off
cls
title Extreme OverScript
echo Checking permissions....
rem The following command doesn't really do anything except requiring admin permissions to run it so we use it as a check
net session 2>&1 >nul
rem 2>&1 means that the second outputstream (the errors) is redirected to the first outputstream (the normal output)
rem >nul means that the normal outputstream gets redirected to "nul" which is a non-existing file. (to dispose of output).
if %errorlevel% == 0 goto perm_success
rem Here we check if the previous command executed succesfully, if so, go to the label named perm_success.
goto perm_fail
rem If the program reaches this line it means that the errorlevel was not 0, which means that the program wasn't run as admin.
rem NOTE: Starting this program again as admin won't work if there are spaces in the file path.

:perm_success
cls
rem cls means CLearScreen, which just empties the screen of all output.
rem If we are at this point, it means that the program is being run as admin.
if exist %temp%\download.bat goto main
rem Check if downloader is present, if so, continue to the main menu.
bitsadmin /transfer downloader /download /priority normal https://github.com/pieterhouwen/scripts/tree/master/nettools/download.bat %temp%\download.bat
rem Downloader is not present, so download it.
rem NOTE: BitsAdmin won't work on GitHub due to that GitHub doesn't return file sizes, which is required for BitsAdmin to work.
pause

:main
cls
echo ^|-------------------------------------------------^|
echo ^|     Welcome to the all-in-one batch toolkit!    ^|
echo ^|             Made by Pieter and Roland           ^|
echo ^|-------------------------------------------------^|
echo.  
echo 1. Windows System Tools                         
echo 2. Hardware information/tools                   
echo 3. Network Tools
echo.
rem The following command makes a variable named choice which will contain 1 ,2 or 3.
set /p choice=Make your choice:
if %choice% == 1 goto winsystools
if %choice% == 2 goto hwtools
if %choice% == 3 goto nettools
rem If the CMD reaches this point, it means that 1 , 2 or 3 wasn't pressed, so we return an error.
echo Invalid input, please try again!
pause
rem pause returns the message Press any key to continue, giving the user a chance to read the messages printed on the screen.
goto main
rem As invalid input was detected, return to the menu.

:winsystools
cls
echo.
echo ^|-------------------------------------------------^|            
echo ^|            Windows System Tools menu            ^|
echo ^|-------------------------------------------------^|
echo.                                                   
echo 1. Fast Universal Cleaning Kit                   
echo 2. Legacy bootmenu switcher                      
echo 3. Outlook profile resetter                      
echo 4. Windows 7 Version changer (CD/DVD required)   
echo 5. Show drives and free space                    
echo 6. System File Checker                                                                          
echo.
set /p choice=Make your choice:
if %choice% == 1 goto cleansys
if %choice% == 2 goto bcdedit
if %choice% == 3 goto outlookreset
if %choice% == 4 goto win7change
if %choice% == 5 goto showdrives
if %choice% == 6 goto sfc

:cleansys
echo Downloading Fast Universal Cleaning Kit
powershell (New-Object Net.WebClient).DownloadFile('https://pieterhouwen.info/scripts/cleansys.bat', 'C:\Windows\Temp\cleansys.bat')
C:\Windows\Temp\cleansys.bat
echo Program complete, press any key to return to the main menu.
pause >nul
rem pause >nul is used to pause the execution of the program without giving the message Press any key to continue, which is used when
rem we want to show our own message to press a key.
goto main

:bcdedit
rem The following command re-enables the good old F8 boot menu at Windows startup.
%windir%\system32\bcdedit /set {default} bootmenupolicy legacy
echo Complete! You can now use the old F8 menu while booting.
echo Press any key to return to the main menu.
pause >nul
goto main

:outlookreset
echo Use the control panel to remove the outlook profiles, the files we'll do later.
pause
rem The following command gets the Mail settings menu from the old Control Panel.
control.exe mlcfg32.cpl
rem The variable named appdata typically refers to C:\Users\<user>\AppData\Roaming, but because we want to get a level higher
rem we should edit the variable.
set appdata=%userprofile%\appdata
cd %AppData%\Local\Microsoft\Outlook
rem Now we're in the Outlook folder which holds the configuration files of the Outlook users.
rem We can safely remove all contents of this folder.
del *.* /f /s /q
echo Done! You can now setup your Outlook account for the first time again.
echo Press any key to return to the main menu.
pause >nul
goto main

:win7change
rem The following command downloads the windows 7 version changer script through PowerShell.
powershell (New-Object Net.WebClient).DownloadFile('https://pieterhouwen.info/scripts/win7change.bat', 'C:\Windows\Temp\win7change.bat')
rem Download complete, proceed to execute.
C:\Windows\Temp\win7change.bat
echo Done! Press any key to return to the main menu
pause >nul
goto main

:showdrives
rem I took the following command from internet. It searches for drives in the machine, and displays the free size.
for /f "tokens=1-3" %a in ('WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^|FINDSTR /I /V "Name"') do @echo wsh.echo "%b" ^& " free=" ^& FormatNumber^(cdbl^(%a^)/1024/1024/1024, 2^)^& " GiB"^& " size=" ^& FormatNumber^(cdbl^(%c^)/1024/1024/1024, 2^)^& " GiB" > %temp%\tmp.vbs & @if not "%c"=="" @echo( & @cscript //nologo %temp%\tmp.vbs & del %temp%\tmp.vbs 
echo Press any key to return to the main menu
pause >nul
goto main

:sfc
%windir%\system32\sfc /scannow
echo Press any key to return to the main menu
pause >nul
goto main

:hwtools
cls
echo ^|-------------------------------------------------^|            
echo ^|           Hardware information tools            ^|
echo ^|-------------------------------------------------^|
echo.
echo 1. Motherboard information
echo 2. RAM information
echo.
set /p choice=Make your choice:
if %choice% == 1 goto mboard_info
if %choice% == 2 goto ram_info
echo Invalid input! Please try again.
pause
goto hwtools

:nettools
cls
echo.         
echo ^|-------------------------------------------------^|
echo ^|                 Network Tools                   ^|
echo ^|-------------------------------------------------^|
echo.
echo 1. Firewall Settings Menu
echo 2. Add IP to network interface
echo.
rem I took the following command from internet. It searches for drives in the machine, and displays the free size.
set /p choice=Make your choice:
if %choice% == 1 goto fwsettings
if %choice% == 2 goto ipinterface
echo Invalid input! Please try again.
pause
goto nettools


:fwsettings

:ipinterface
:IPmenu
echo.         
echo ^|-------------------------------------------------^|
echo ^|Adding/removing IP addresses to network interface^|
echo ^|-------------------------------------------------^|
echo.
echo Please specify if you want to add or remove an address.
echo.
echo 1: Add an IP address to an interface.
echo 2: Remove an IP address from an interface.
echo 3: Show current IP configuration.
echo.
set /p choice=Select your choice: 
if %choice% == 1 goto add
if %choice% == 2 goto removeaddr
echo Incorrect choice, please try again.
pause
goto IPmenu

:removeaddr
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
goto IPmenu

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
goto IPmenu

:noerror
echo Complete!
pause

:showconfig
mode 500
netsh interface ipv4 show addresses
echo Complete! Press any key to return to the IP menu.
pause >nul
goto IPmenu

:perm_fail
echo Permissions inadequate, trying again as admin.
rem The following command tries to run itself (%0) as admin.
powershell "saps -filepath %0 -verb runas"
goto end

:download_prog

:end
