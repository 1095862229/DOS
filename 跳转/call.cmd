@echo off
:begin
set /a var+=1
echo %var%
if %var% leq 3 call :begin
pause