@echo off
call :randomPassword 6 pass1 pass2 pass3
echo %pass1% %pass2% %pass3%
pause
exit
:randomPassword
::--------- �����������
::---------%1 Ϊ���볤�ȣ� %2 ���Ժ�Ϊ���ر�������
::---------goto ѭ��������Ƕ�ס�����Ƕ��@echo off
if "%1"=="" goto :eof
if %1 lss 1 goto :eof
set password_len=%1
set return=
set wordset=abcdefghijklmnopqrstuvwxyz023456789_
::--------------------------- ѭ��
:randomPassword1
set /a numof=%random%%%36
call set return=%return%%%wordset:~%numof%,1%%
set /a password_len-=1
if %password_len% gtr 0 goto randomPassword1
::--------------------------- ѭ��
if not "%2"=="" set %2=%return%
shift /2
if not "%2"=="" goto randomPassword
goto :eof