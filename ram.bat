@echo off
title Ram checker
mode 500
wmic Memorychip get Capacity, ConfiguredClockSpeed, MaxVoltage, MemoryType, MinVoltage, Speed, TypeDetail, PartNumber
pause
echo.
echo dit is een menu waar je alles kunt weten over ram.
echo kies 1  om Capacity
echo kies 2  om ConfiguredClockSpeed
echo kies 3  om MaxVoltage
echo kies 4  om MemoryType
echo kies 5  om MinVoltage
echo kies 6  om Speed
echo kies 7  om TypeDetail
echo kies 8  om PartNumber
pause
