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
if exist %temp%\download.bat goto pre-main
rem Check if downloader is present, if so, continue to the main menu.
bitsadmin /transfer downloader /download /priority normal https://pieterhouwen.info/scripts/download.bat %temp%\download.bat
rem Downloader is not present, so download it.
rem NOTE: BitsAdmin won't work on GitHub due to that GitHub doesn't return file sizes, which is required for BitsAdmin to work.
:pre-main
rem Let's add some CLI options to navigate the menus more quickly.
rem First, lets check if there are arguments passed to overscript.
rem We can check this by looking at a variable called %1 (This is for the first argument after overscript.bat)
rem Example: If the user opens overscript as follows: "overscript.bat winsystools" the %1 is "winsystools".
rem This can continue like so: overscript.bat arg1 arg2 arg3
rem So in this example %1 is "arg1" %2 is "arg2" etc.
rem So lets check if %1 is given.
rem So if %1 is not equal to "" (nothing) then go to the label specified in %1.

if %1 == "" goto main
if %1 == "Windows" goto winsystools
if %1 == "windows" goto winsystools
if %1 == "Hardware" goto hwtools
if %1 == "hardware" goto hwtools
if %1 == "Network" goto nettools
if %1 == "network" goto nettools

:main
cls
echo ^|-------------------------------------------------^|
echo ^|     Welcome to the all-in-one batch toolkit!    ^|
echo ^|             Made by Pieter and Roland           ^|
echo ^|-------------------------------------------------^|
echo.  
echo Hello %username%! And welcome to the toolkit!
echo.
echo 1. Windows System Tools.                         
echo 2. Hardware information/tools.                   
echo 3. Network Tools.
echo.
echo Q. Quit.
echo.
rem The following command makes a variable named choice which will contain 1 ,2 or 3.
set /p choice=Make your choice:
if %choice% == 1 goto winsystools
if %choice% == 2 goto hwtools
if %choice% == 3 goto nettools
if %choice% == q goto end
if %choice% == Q goto end
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
echo 1.  Fast Universal Cleaning Kit.                   
echo 2.  Legacy bootmenu switcher.                      
echo 3.  Outlook profile resetter.                      
echo 4.  Windows 7 Version changer (CD/DVD required).   
echo 5.  Show drives and free space.                    
echo 6.  System File Checker.
echo 7.  Startup checker (add "d" for more info).
echo 7d. Detailed startup checker.
echo 8.  Force Desktop Wallpaper.                                                                        
echo.
echo Q.  Return to main menu.
echo.
set /p choice=Make your choice:
if %choice% == 1 goto cleansys
if %choice% == 2 goto bcdedit
if %choice% == 3 goto outlookreset
if %choice% == 4 goto WinVerMenu
if %choice% == 5 goto showdrives
if %choice% == 6 goto sfc
if %choice% == 7 goto startup
if %choice% == 7d goto startupext
if %choice% == 8 goto wallpaper
if %choice% == q goto main
if %choice% == Q goto main
echo Invalid input detected! Please try again!
pause
goto winsystools

:cleansys
echo Downloading Fast Universal Cleaning Kit
powershell (New-Object Net.WebClient).DownloadFile('https://pieterhouwen.info/scripts/cleansys.bat', 'C:\Windows\Temp\cleansys.bat')
start C:\Windows\Temp\cleansys.bat
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
cd %localappdata%\Microsoft\Outlook && del *.* /f /s /q
rem The above commands are actually 2 seperate commands: CD and DEL.
rem because of the && the DEL command only runs if the previous command was succesful.
rem This can be used to make sure we don't end up deleting something we don't want to.
echo Done! You can now setup your Outlook account for the first time again.
echo Press any key to return to the main menu.
pause >nul
goto main

:WinVerMenu
cls
echo.
echo ^|-------------------------------------------------^|
echo ^| NOTE: YOU NEED THE ORIGINAL WINDOWS INSTALL CD! ^|
echo ^|      ALSO: THIS ONLY WORKS ON WINDOWS 7!        ^|
echo ^|-------------------------------------------------^|
echo.
echo Your currently installed Windows version is:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName
echo Which Windows version do you want to "install"?
echo Choose 1 voor Windows Professional.
echo Choose 2 voor Windows Home Premium.
echo Choose 3 voor Windows Ultimate.
echo Choose 4 voor Windows Enterprise.
echo.
echo Q. Return to previous menu.
echo.
set /p installver=Make your choice: 
if %installver% == 1 goto WinPro
if %installver% == 2 goto WinPrem
if %installver% == 3 goto WinUlt
if %installver% == 4 goto WinEnt
if %installver% == q goto winsystools
if %installver% == Q goto winsystools
echo Invalid input detected! Please try again!
pause
goto WinVerMenu

:WinPro
echo You have chosen Windows 7 Professional
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Professional" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Professional" /f >nul
pause
goto WinEnd

:WinPrem
echo You have chosen Windows 7 Home Premium
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 HomePremium" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "HomePremium" /f >nul
pause
goto WinEnd

:WinUlt
echo You have chosen Windows 7 Ultimate
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Ultimate" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Ultimate" /f >nul
pause
goto WinEnd

:WinEnt
echo You have chosen Windows 7 Enterprise
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v ProductName /d "Windows 7 Enterprise" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /t REG_SZ /v EditionID /d "Enterprise" /f >nul
pause
goto WinEnd

:WinEnd
echo.
echo Operation is complete. If it was succesful, please reboot from the Windows 
echo CD/DVD and choose the "Repair" option.
echo.
set /p rbt=Reboot now? [Y/N]:
if %rbt% == "y" shutdown -r -t 00
if %rbt% == "Y" shutdown -r -t 00
if %rbt% == "N" goto winsystools
if %rbt% == "n" goto winsystools
goto winsystools

:showdrives
rem I took the following command from internet. It searches for drives in the machine, and displays the free size.
for /f "tokens=1-3" %a in ('WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^|FINDSTR /I /V "mdName"') do @echo wsh.echo "%b" ^& " free=" ^& FormatNumber^(cdbl^(%a^)/1024/1024/1024, 2^)^& " GiB"^& " size=" ^& FormatNumber^(cdbl^(%c^)/1024/1024/1024, 2^)^& " GiB" > %temp%\tmp.vbs & @if not "%c"=="" @echo( & @cscript //nologo %temp%\tmp.vbs & del %temp%\tmp.vbs 
echo Press any key to return to the previous menu. 
pause >nul
goto winsystools

:sfc
start %windir%\system32\sfc /scannow
echo Press any key to return to the previous menu
pause >nul
goto winsystools

:startup
echo Your current startup items are:
wmic startup get command
pause
goto winsystools

:startupext
echo Your current startup items are:
mode 500
wmic startup get
pause
goto winsystools

:wallpaper
echo Note: All users should be able to view the image or else the background will be empty!
set /p location=Specify where the image is located (example C:\image.jpg):
rem Now we're going to write a registry file, this is used because in some cases there is no System subkey
rem in the registry and through the normal registry commands this cannot be added.
echo Windows Registry Editor Version 5.00 >%temp%\wallpaper.reg
rem The above line is the header which tells Windows it's dealing with a registry file (.reg)
echo. >>%temp%\wallpaper.reg
rem Add an empty line.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >>%temp%\wallpaper.reg
rem The above command specifies in which subkey in the registry we are going to be working.
rem If the structure does not exist, it will create it for us.
echo "WallpaperStyle"="2" >>%temp%\wallpaper.reg
reg import %temp%\wallpaper.reg
rem Import our registry key, so the subkey will be created, then we can use conventional methods to add our own key
rem for the background.
rem We use reg import because even though the .reg file can be added by starting (or double-clicking it) we want to suppress
rem the warning that messing with the registry can be dangerous.

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v Wallpaper /d "%location%" /f /t REG_SZ
echo Done
pause
goto winsystools

:hwtools
cls
echo ^|-------------------------------------------------^|            
echo ^|           Hardware information tools            ^|
echo ^|-------------------------------------------------^|
echo                Your current CPU is:
wmic cpu get name, numberofcores
echo.
echo 1. Motherboard information.
echo 2. RAM information.
echo.
echo Q. Return to main menu.
echo.
set /p choice=Make your choice:
if %choice% == 1 goto mboard_info
if %choice% == 2 goto ram_info
if %choice% == q goto main
if %choice% == Q goto main
echo Invalid input! Please try again.
pause
goto hwtools

:mboard_info
wmic baseboard get product,Manufacturer,version,serialnumber
pause
goto main

:ram_info
echo The values provided are in bytes,
wmic memorychip get speed, capacity
pause
goto main

:nettools
cls
rem myexternalip.com is down, 
bitsadmin /transfer externalIP /download /priority normal http://ipecho.net/plain %temp%\extip.txt >nul
set /p extip=<%temp%\extip.txt
cls
echo.         
echo ^|-------------------------------------------------^|
echo ^|                 Network Tools                   ^|
echo ^|-------------------------------------------------^|
echo.
echo Your current external IP is: %extip%
rem echo And your internal IP is: %internIP%
echo.
echo 1. Firewall Settings Menu.
echo 2. Add IP to network interface.
echo.
echo Q. Return to main menu.
echo.
set /p choice=Make your choice:
if %choice% == 1 goto fwsettings
if %choice% == 2 goto IPmenu
if %choice% == q goto main
if %choice% == Q goto main
echo Invalid input! Please try again.
pause
goto nettools

:fwsettings
rem Code to add and remove firewall rules goes here.
rem Well maybe not..

:IPmenu
cls
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
echo Q. Return to previous menu.
echo.
set /p choice=Select your choice: 
if %choice% == 1 goto add
if %choice% == 2 goto removeaddr
if %choice% == q goto nettools
if %choice% == Q goto nettools
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
if %errorlevel% NEQ 0 goto error
rem We use NEQ (Not EQual) because a program can have many exit codes, but everything non-zero is an error.
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
goto nettools

:add
echo.
netsh interface ipv4 show interfaces
echo.
set /p interface=Please type the full name of the interface you want to add an IP to: 
set /p ip=Please enter the IP you want to add: 
set /p subnet=Enter subnetmask (default 255.255.255.0): 
if %subnet% == "" goto nosubnet
if %ip% == "" goto noip
goto subnet
pause
goto IPmenu

:subnet
netsh interface ipv4 add address "%interface%" %ip% %subnet%
if %errorlevel% NEQ 0 goto error
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
goto main

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

:end