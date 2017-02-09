@echo off
cls
rem HKEY_USERS\.Default\Software\microsoft\windows\currentversion\explorer\VisualEffects
rem Set to 1 (Let Windows choose), 2 (All settings off), 3 (manual settings)
reg add HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting /t reg_dword /d 00000003 /f
rem Value is DWORD 00000002
rem Here the keys you can set to 00000000 (off) or to 00000001 (on)
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations]

reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled/v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow /v DefaultApplied /t reg_dword /d 00000001 /f
rem   [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation]
reg add HKCU_Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation] /v DefaultApplied /t reg_dword /d 00000001 /f
rem All data = DefaultApplied = 00000001 (on) , 00000000 (off)
