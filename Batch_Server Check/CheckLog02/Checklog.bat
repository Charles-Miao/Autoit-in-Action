@echo off
set server_ip=174
set LOGFile=D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log

if exist D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log del D:\ServerCheck\CheckLog\%server_ip%_CheckLog.log

for /f %%i in ('dateadd.exe -1') do set timestr=%%i
set  NGlog=e:\sendlog\sendng.log
find /i "%timestr%" %NGlog%
if not errorlevel 1 echo 192.168.168.%server_ip% send log has error>>%logfile%
if errorlevel 1 echo 192.168.168.%server_ip% send log is OK>>%logfile%

d:
cd \ServerCheck\Checklog

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %LOGFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt