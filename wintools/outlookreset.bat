@echo off
echo Gebruik het configuratiepaneel om de gewenste profielen eerst te verwijderen. De bestanden doen we later.
pause
control.exe mlcfg32.cpl
set appdata=%userprofile%\appdata
cd %AppData%\Local\Microsoft\Outlook
del *.* /f /s /q
rem dit is een remark