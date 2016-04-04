@echo off

set server_ip=230
set year=
set month=
set day=
set nowdate=

echo ===========================================================================
echo Check Server NetWork, please don't close this Windows, thanks! Charles
echo ===========================================================================

if exist D:\ServerCheck\CheckNetWork\%server_ip%_CheckNetWork.log del D:\ServerCheck\CheckNetWork\%server_ip%_CheckNetWork.log

for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set month=%%a
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set day=%%b
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set year=%%c

set nowdate=%year%%month%%day%
set LOGFile=D:\ServerCheck\CheckNetWork\%server_ip%_CheckNetWork.log
set tempfile=d:\ServerCheck\CheckNetWork\temp.txt

if exist d:\servercheck\checknetwork\%tempfile% del d:\servercheck\checknetwork\%tempfile%

echo **************************************NetWork*******************************************
ping 192.168.168.230
if not errorlevel 1 echo 192.168.168.%server_ip% Back NetWork is OK >>%tempfile%
if errorlevel 1 echo 192.168.168.%server_ip% Back NetWork is error>>%tempfile%

::ping 172.168.48.10
::if not errorlevel 1 echo 192.168.168.%server_ip% Front NetWork is OK >>%tempfile%
::if errorlevel 1 echo 192.168.168.%server_ip% Front NetWork is error>>%tempfile%

::ping 172.30.24.130
::if not errorlevel 1 echo 192.168.168.%server_ip% SFCS NetWork is OK >>%tempfile%
::if errorlevel 1 echo 192.168.168.%server_ip% SFCS NetWork is error>>%tempfile%

find /i "error" in %tempfile%
if not errorlevel 1 echo 192.168.168.%server_ip% network has error>>%logfile%
if errorlevel 1 echo 192.168.168.%server_ip% NetWork is OK>>%logfile%
echo **************************************NetWork*******************************************

del %tempfile%

d:
cd \ServerCheck\CheckNetWork

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %LOGFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt
