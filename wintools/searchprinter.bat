@echo off
rem First check if the nmap executable is installed and added to the PATH variable
rem If nmap is installed but not added to the PATH variable, we should give the user
rem the option to add it manually.

echo %PATH% | findstr -i nmap >%temp%\nul
if %errorlevel% == 1 goto wrongpath

rem Just add REM <space> before the above 2 lines and remove it in the line under here.

rem set nmap=<your install dir here> 
rem if nmap has to be set manually replace all further instances of "nmap" with %nmap%.

echo Searching for network printers. . .

if [%1] == [] goto twei
if %1 NEQ [] goto othernet

:twei
nmap 192.168.2.0/24 -p 515 --open >printers.txt
goto result

:othernet
nmap %1 -p 515 --open >printers.txt
goto result

:result
type printers.txt | findstr -v -i "host" | findstr -v -i "Starting"
goto end

:wrongpath
echo Nmap has not been found in your PATH variable, please install. . .
echo If this is in error please edit the code and put the full path to nmap in the variable

:end