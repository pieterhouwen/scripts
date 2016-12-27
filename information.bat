@echo off
title Information Finder
cls
echo Gathering info. . . 
REM find IP
for /f "tokens=14 delims= " %%B in ('ipconfig -all ^| findstr -i ipv4') do set pieter=%%B
rem echo B is still %pieter%

REM find Current gateway
for /f "tokens=11 delims= " %%A in ('ipconfig -all ^| findstr -i gateway') do set gw=%%A

REM find RAM speed
for /f "tokens=* delims=" %%C in ('wmic Memorychip get speed ^| findstr -i -v speed') do echo %%C

REM find RAM size
for /f "tokens=* delims=" %%D in ('wmic Memorychip get capacity ^| findstr -i -v capacity') do set rsz=%%D

cls
echo Hello %username%!
echo IP: %pieter%		Gateway: %pieter%
echo RAM: %rsp% Mhz		RAM size: %rsz% bytes


pause

rem Current IP
rem Default gateway
rem username
rem RAM (bytes total + speed)
