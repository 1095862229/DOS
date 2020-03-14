@echo off
call :randomPassword 6 pass1 pass2 pass3
echo %pass1% %pass2% %pass3%
pause
exit
:randomPassword
::--------- 生成随机密码
::---------%1 为密码长度， %2 及以后为返回变量名称
::---------goto 循环、变量嵌套、命令嵌套@echo off
if "%1"=="" goto :eof
if %1 lss 1 goto :eof
set password_len=%1
set return=
set wordset=abcdefghijklmnopqrstuvwxyz023456789_
::--------------------------- 循环
:randomPassword1
set /a numof=%random%%%36
call set return=%return%%%wordset:~%numof%,1%%
set /a password_len-=1
if %password_len% gtr 0 goto randomPassword1
::--------------------------- 循环
if not "%2"=="" set %2=%return%
shift /2
if not "%2"=="" goto randomPassword
goto :eof