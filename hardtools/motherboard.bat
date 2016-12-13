@echo off
cls
wmic baseboard get product,Manufacturer,version,serialnumber
pause