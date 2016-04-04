@echo off


set server_ip=236
set year=
set month=
set day=
set nowdate=

if exist D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log del D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log


for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set month=%%a
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set day=%%b
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set year=%%c

set nowdate=%year%%month%%day%
set LOGFile=D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log

if not exist D:\log%nowdate% echo Can not find %server_ip% log%nowdate% >>%LOGFile%
if exist D:\log%nowdate% echo %server_ip% Logfile is log%nowdate% >>%LOGFile%

d:
cd \ServerCheck\CheckLog

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %LOGFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt
