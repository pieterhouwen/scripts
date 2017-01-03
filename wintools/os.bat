@echo off
cls
echo Uw OS is :
wmic os get caption | findstr -v "Caption"
pause