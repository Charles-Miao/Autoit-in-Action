@echo off


set server_ip=123.21
set year=
set month=
set day=
set nowdate=

if exist D:\ServerCheck\CheckVirusPattern\%server_ip%_CheckVirusPattern.log del D:\ServerCheck\CheckVirusPattern\%server_ip%_CheckVirusPattern.log

for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set month=%%a
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set day=%%b
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set year=%%c

set nowdate=%year%%month%%day%
set LOGFile=D:\ServerCheck\CheckVirusPattern\%server_ip%_CheckVirusPattern.log
set tempfile=D:\ServerCheck\CheckVirusPattern\temp.txt

if not exist C:\"Program Files (x86)\Trend Micro\OfficeScan Client"\lpt$vpn.* goto fail

if exist C:\"Program Files (x86)\Trend Micro\OfficeScan Client"\lpt$vpn.* goto pass

:fail
echo Can not find 192.168.%server_ip%'s Virus Pattern>>%LOGFile%

:pass
dir /a /b c:\"Program Files (x86)\Trend Micro\OfficeScan Client"\lpt$vpn.*>%tempfile%
for /f "eol= delims=" %%i in (%tempfile%) do set VirusPattern=%%i
echo 192.168.%server_ip%'s Virus Pattern is %VirusPattern%>>%LOGFile%


d:
cd \ServerCheck\CheckVirusPattern
::del temp.txt

echo open 192.168.123.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %LOGFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt
