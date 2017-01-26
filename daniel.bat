@echo off
cls
title Bezig met het bufferen van Roland
:begin
cls
echo Buffing Roland +1.
ping 1.1.1.1 -w 1000 -n 1 >nul
cls
echo Buffing Roland +2. .
ping 1.1.1.1 -w 1000 -n 1 >nul
cls
echo Buffing Roland +3. . .
ping 1.1.1.1 -w 1000 -n 1 >nul
cls
echo Buffing Roland +4. . . .
ping 1.1.1.1 -w 1000 -n 1 >nul
goto begin