@echo off
title Fast Universal Cleaning Kit
:check_Permissions
echo Checking permissions. . . 
net session >nul 2>&1
if %errorLevel% == 0 goto perm_success 
echo Failure: Current permissions inadequate. Trying again as admin.
powershell "saps -filepath %0 -verb runas"
exit
:perm_success
echo Cleaning Temporary Internet Files
del "%userprofile%\appdata\local\microsoft\windows\temporary internet files\"*.* /f /q /s >nul 2>&1
echo Cleaning is done.
echo.
echo Cleaning Prefetch folder
del %windir%\Prefetch\*.* /f /q /s >nul 2>&1
echo Cleaning is done.
echo.
echo Cleaning Windows Temp folder
del %windir%\Temp\*.* /f /q /s >nul 2>&1
echo Cleaning is done.
echo.
echo Cleaning User Temp folder
del %temp%\*.* /f /q /s >nul 2>&1
echo Cleaning SoftwareDistribution folder
del %windir%\SoftwareDistribution\WuRedir\*.* /f /q /s >nul 2>&1
del %windir%\SoftwareDistribution\EventCache\*.* /f /q /s >nul 2>&1
del %windir%\SoftwareDistribution\SelfUpdate\*.* /f /q /s >nul 2>&1
del %windir%\SoftwareDistribution\Download\*.* /f /q /s >nul 2>&1
del %windir%\SoftwareDistribution\Datastore\*.* /f /q /s >nul 2>&1
del %windir%\SoftwareDistribution\AuthCabs\*.* /f /q /s >nul 2>&1
echo Cleaning is done.
cls
echo Phase 1 complete. Press any key to continue to Phase 2.
pause >nul
cls
echo Beginning Phase 2 . . .
echo.
echo Starting Clean Manager with preset config.
echo This will take a while. . . 
:: Set what we want to clear
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress Old Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Content Indexer Cleaner" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
:: Clean it up
CleanMgr.exe /sagerun:0011

:: Remove our state flag
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress Old Files" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Content Indexer Cleaner" /v StateFlags0011 /f >nul 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >nul 2>&1
:perm_fail
exit
