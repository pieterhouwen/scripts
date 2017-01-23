@echo off
title Information Finder
cls
:main_menu
echo -----------------------------------------------
echo ^|         System information finder           ^|
echo -----------------------------------------------
echo  Hello %username%!
echo. 
echo  1. Hardware information     
echo  2. Network Information      
echo  3. User information         
echo.
set /p choice=Select your choice:
if %choice% == 1 goto hwinfo
if %choice% == 2 goto network_info
if %choice% == 3 goto user_info
echo Invalid choice, please try again!
pause
goto main_menu

REM Query installed language:
for /f "tokens=3 delims= " %%L in ('reg query hklm\system\controlset001\control\nls\language /v Installlanguage ^| findstr 0') do set lng=%%L
if %lng%==0413 set tkens=11
rem 0413 = NL
if %lng%==0409 set tkens=13
if %lng%==0413 set tkensdns=14
if %lng%==0409 set tkensdns=15

rem Query displaylanguage
:findEN
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\MUI\UILanguages\en-US >nul
if %errorlevel% NEQ 0 goto findNL
goto 
:findNL
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\MUI\UILanguages\nl-NL >nul

cls


:network_info
echo Gathering info. . . 

bitsadmin /transfer externalIP /download /priority normal http://myexternalip.com/raw %temp%\extip.txt >nul
if %errorlevel% NEQ 0 goto extiperror
:extipnoerror
set /p extIP=<%temp%\extip.txt
REM find OS
for /f "tokens=* delims=" %%E in ('wmic os get caption ^| findstr -i windows') do set windows=%%E

REM find IP
for /f "tokens=14 delims= " %%B in ('ipconfig -all ^| findstr -i ipv4') do set pieter=%%B

REM find Current gateway and DNS
for /f "tokens=%tkens% delims= " %%A in ('ipconfig -all ^| findstr -i gateway ^| findstr -i -v ::') do set gw=%%A

for /f "tokens=%tkensdns% delims= " %%C in ('ipconfig -all ^| findstr -i dns ^| findstr -i server ^| findstr -v ::') do set dns=%%C

REM find processor
for /f "tokens=2 delims==" %%F in ('wmic cpu get name /format:list') do set cpu=%%F
pause
cls


echo -----------------------------------------------
echo ^|          Network Information                ^|
echo -----------------------------------------------
echo   External IP: %extip%
echo.
echo   Internal IP: %pieter%
echo   Gateway: %gw%
echo   DNS Server: %dns%						
echo.                                              
echo   If you are unable to see your default      
echo   gateway or DNS address, this may be        
echo   because multiple addresses have been       
echo   configured.                                
echo.
echo   Hello %username%! You are running: %windows%
echo.
echo               Network information:
echo.
echo   External IP: %extIP%
echo   IP: %pieter%
echo.
echo    Gateway: %gw%
echo    DNS: %dns%
echo.
echo.
echo   If you can't see the gateway and DNS, it means that you have
echo   multiple addresses for one or both.
echo.
pause

:hwinfo
cls
echo ----------------------------------------------
echo ^|           Hardware information             ^|
echo ----------------------------------------------
echo   RAM: %ram%                                
echo   CPU: %cpu%                                
echo.
echo.
echo.
echo Processor: %cpu%
pause

rem Current IP
rem Default gateway
rem username
rem RAM (bytes total + speed)
exit
:extiperror
powershell.exe -command (new-object System.Net.WebClient).DownloadFile('http://myexternalip.com/raw', '$Env:temp\extip.txt')
if %errorlevel% NEQ 0 goto end
goto extipnoerror

:end
