@echo off
title Fast Universal Cleaning Kit
goto check_Permissions
:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
	goto perm_success
    ) else (
        echo Failure: Current permissions inadequate.
	echo Please run this program again as Administrator.
	pause
	goto perm_fail
    )
    pause >nul
:perm_success
echo Cleaning Prefetch folder
del C:\Windows\Prefetch\*.* /f /q /s >tempfile 2>&1
echo Cleaning is done.
echo.
echo.
echo Cleaning Windows Temp folder
del C:\Windows\Temp\*.* /f /q /s >tempfile 2>&1
echo Cleaning is done.
echo.
echo.
echo Cleaning User Temp folder
del %temp%\*.* /f /q /s >tempfile 2>&1
echo Cleaning SoftwareDistribution folder
del C:\Windows\SoftwareDistribution\WuRedir\*.* /f /q /s >tempfile 2>&1
del C:\Windows\SoftwareDistribution\EventCache\*.* /f /q /s >tempfile 2>&1
del C:\Windows\SoftwareDistribution\SelfUpdate\*.* /f /q /s >tempfile 2>&1
del C:\Windows\SoftwareDistribution\Download\*.* /f /q /s >tempfile 2>&1
del C:\Windows\SoftwareDistribution\Datastore\*.* /f /q /s >tempfile 2>&1
del C:\Windows\SoftwareDistribution\AuthCabs\*.* /f /q /s >tempfile 2>&1
del tempfile >nul
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
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress Old Files" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Content Indexer Cleaner" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
:: Clean it up
CleanMgr.exe /sagerun:0011

:: Remove our state flag
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress Old Files" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Content Indexer Cleaner" /v StateFlags0011 /f >tempfile 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0011 /t REG_DWORD /d 0x02 /f >tempfile 2>&1
:perm_fail
exit
