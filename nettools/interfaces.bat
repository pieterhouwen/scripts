@echo off
cls
title Network interfaces.
echo Uw netwerkadapters zijn:
wmic nic description, macaddress, netconnectionid
pause