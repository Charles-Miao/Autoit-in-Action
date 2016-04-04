@echo off
rem version 1.1 
rem date 2011-1-13
rem Author:Shower Zhen

echo =====================================================================
echo ======================Server Check daily report======================
echo ===================Please don't close this Window====================
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
::sET FROM=""TE Server" <shower_zhen@wistron.com>"
SET FROM="P5C_TE_Server"
SET SUBJECT="Server Check Daily Report"
set year=
set month=
set day=
set nowdate=


for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set month=%%a
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set day=%%b
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set year=%%c

set nowdate=%year%%month%%day%
set LOGFile=D:\TEJob\ServerCheck\LOG\%year%%month%%day%.log

if not exist D:\TEjob\ServerCheck\LOG\%nowdate%\NUL MD D:\TEjob\ServerCheck\LOG\%nowdate%

echo Dear All, >%LOGFile%
echo This is Server check daily report. >>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check SBK Report***********************************************>>%LOGFile%
set report_name=74_CheckSBK.log
set server_ip=192.168.168.74
FOR /F "eol= delims=" %%i in (74_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=88_CheckSBK.log
set server_ip=192.168.168.88
FOR /F "eol= delims=" %%i in (88_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=91_CheckSBK.log
set server_ip=192.168.168.91
FOR /F "eol= delims=" %%i in (91_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=123.84_CheckSBK.log
set server_ip=192.168.123.84
FOR /F "eol= delims=" %%i in (123.84_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=123.85_CheckSBK.log
set server_ip=192.168.123.85
FOR /F "eol= delims=" %%i in (123.85_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=123.97_CheckSBK.log
set server_ip=192.168.123.97
FOR /F "eol= delims=" %%i in (123.97_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%

set report_name=123.98_CheckSBK.log
set server_ip=192.168.123.98
FOR /F "eol= delims=" %%i in (123.98_CheckSBK.log) do set sbkreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SBK file >>%LOGFile%
if exist %report_name% echo %sbkreport%>>%LOGFile%
echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%


echo **************************************Time check Report**********************************************>>%LOGFile%
for /F "eol= delims=. tokens=1-29" %%i in (checktimeserverip) do (
setlocal enabledelayedexpansion
if exist %%l_time.txt (for /f %%u in (%%l_time.txt) do echo 192.168.168.%%l time is %%u >>%LOGFile%) else echo Can not find 192.168.168.%%l time check report>>%LOGFile%
)
)

for /F "eol= delims=. tokens=3,4" %%i in (checktimeserverip_B1) do (
setlocal enabledelayedexpansion
if exist %%i.%%j_time.txt (for /f %%u in (%%i.%%j_time.txt) do echo 192.168.%%i.%%j time is %%u >>%LOGFile%) else echo Can not find 192.168.%%i.%%j time check report>>%LOGFile%
)
)

echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check Log Report***********************************************>>%LOGFile%
set report_name=174_CheckLog.log
set server_ip=192.168.168.174
FOR /F "eol= delims=" %%i in (174_CheckLog.log) do set logreport=%%i
if not exist %report_name% echo Can not find %server_ip% CheckLog file >>%LOGFile%
if exist %report_name% echo %logreport%>>%LOGFile%

set report_name=231_CheckLog.log
set server_ip=192.168.168.231
FOR /F "eol= delims=" %%i in (231_CheckLog.log) do set logreport=%%i
if not exist %report_name% echo Can not find %server_ip% CheckLog file >>%LOGFile%
if exist %report_name% echo %logreport%>>%LOGFile%

set report_name=236_CheckLog.log
set server_ip=192.168.168.236
FOR /F "eol= delims=" %%i in (236_CheckLog.log) do set logreport=%%i
if not exist %report_name% echo Can not find %server_ip% CheckLog file >>%LOGFile%
if exist %report_name% echo %logreport%>>%LOGFile%
echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check Server Space Report**************************************>>%LOGFile%
set report_name=71_space.txt
set server_ip=192.168.168.71
FOR /F "eol= delims=" %%i in (71_space.txt) do set space=%%i
if not exist %report_name% echo Can not find %server_ip% Check space file >>%LOGFile%
if exist %report_name% echo %server_ip% free space is %space%>>%LOGFile%

set report_name=237_space.txt
set server_ip=192.168.168.237
FOR /F "eol= delims=" %%i in (237_space.txt) do set space=%%i
if not exist %report_name% echo Can not find %server_ip% Check space file >>%LOGFile%
if exist %report_name% echo %server_ip% free space is %space%>>%LOGFile%
echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check Server NetWork Report************************************>>%LOGFile%
for /F "eol= delims=. tokens=1-29" %%i in (checknetworkserverip) do (
setlocal enabledelayedexpansion
if exist %%l_CheckNetWork.log (FOR /F "eol= delims=" %%u in (%%l_CheckNetWork.log) do echo %%u >>%LOGFile%) else echo Can not find 192.168.168.%%l check server network report>>%LOGFile%
)
)


for /F "eol= delims=. tokens=3,4" %%i in (checknetworkserverip_B1) do (
setlocal enabledelayedexpansion
if exist %%i.%%j_CheckNetWork.log (FOR /F "eol= delims=" %%u in (%%i.%%j_CheckNetWork.log) do echo %%u >>%LOGFile%) else echo Can not find 192.168.%%i.%%j check server network report>>%LOGFile%
)
)
echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check Virus Pattern Report*************************************>>%LOGFile%
for /F "eol= delims=. tokens=1-31" %%i in (checkviruspatternip) do (
setlocal enabledelayedexpansion
if exist %%l_CheckVirusPattern.log (FOR /F "eol= delims=" %%u in (%%l_CheckVirusPattern.log) do echo %%u >>%LOGFile%) else echo Can not find 192.168.168.%%l check virus pattern report>>%LOGFile%
)
)


for /F "eol= delims=. tokens=3,4" %%i in (checkviruspatternip_B1) do (
setlocal enabledelayedexpansion
if exist %%i.%%j_CheckVirusPattern.log (FOR /F "eol= delims=" %%u in (%%i.%%j_CheckVirusPattern.log) do echo %%u >>%LOGFile%) else echo Can not find 192.168.%%i.%%j check virus pattern report>>%LOGFile%
)
)

echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check SSD Server Report****************************************>>%LOGFile%
set report_name=166_SSDreport.txt
set server_ip=192.168.168.166
FOR /F "eol= delims=" %%i in (166_SSDreport.txt) do set SSDreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SSD Report >>%LOGFile%
if exist %report_name% echo %SSDreport%>>%logfile%

set report_name=210_SSDreport.txt
set server_ip=192.168.168.210
FOR /F "eol= delims=" %%i in (210_SSDreport.txt) do set SSDreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SSD Report >>%LOGFile%
if exist %report_name% echo %SSDreport%>>%logfile%

echo *****************************************************************************************************>>%LOGFile%

echo.>>%LOGFile%
echo.>>%LOGFile%
echo.>>%LOGFile%

echo **************************************Check SecCopy Errors Report************************************>>%LOGFile%
set report_name=74_SecCopyreport.txt
set server_ip=192.168.168.74
FOR /F "eol= delims=" %%i in (74_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=88_SecCopyreport.txt
set server_ip=192.168.168.88
FOR /F "eol= delims=" %%i in (88_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=91_SecCopyreport.txt
set server_ip=192.168.168.91
FOR /F "eol= delims=" %%i in (91_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=166_SecCopyreport.txt
set server_ip=192.168.168.166
FOR /F "eol= delims=" %%i in (166_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=230_SecCopyreport.txt
set server_ip=192.168.168.230
FOR /F "eol= delims=" %%i in (230_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=123.84_SecCopyreport.txt
set server_ip=192.168.123.84
FOR /F "eol= delims=" %%i in (123.84_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=123.85_SecCopyreport.txt
set server_ip=192.168.123.85
FOR /F "eol= delims=" %%i in (123.85_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=123.97_SecCopyreport.txt
set server_ip=192.168.123.97
FOR /F "eol= delims=" %%i in (123.97_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

set report_name=123.98_SecCopyreport.txt
set server_ip=192.168.123.98
FOR /F "eol= delims=" %%i in (123.98_SecCopyreport.txt) do set SecCopyreport=%%i
if not exist %report_name% echo Can not find %server_ip% Check SecCopy Report >>%LOGFile%
if exist %report_name% echo %SecCopyreport%>>%logfile%

echo *****************************************************************************************************>>%LOGFile%
del temp.log

Move /y *.log D:\TEjob\ServerCheck\LOG\%nowdate%
Move /y *.txt D:\TEjob\ServerCheck\LOG\%nowdate%
::wksmail.wistron.com10.42.22.50

echo Best Regards!>>%LOGFile%

echo ==========WKS Plant 5C============>>%LOGFile%

echo WKS Plant 5C/MEZ920/TE >>%LOGFile%

echo Charles Miao(2948)>>%LOGFile%

echo Tel: 15250187824 &687824>>%LOGFile%

echo E-Mail: Charles Miao/WKS/Wistron>>%LOGFile%

echo Wistron InfoComm (Kunshan) Co. Ltd.>>%LOGFile%

echo ================================= >>%LOGFile%

::if exist %LOGFile% (
::	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO k1203781@wistron.local, -MSG -USEFILE %LOGFile% -SUBJ %SUBJECT% -ATTACH %LOGFile% -server 10.42.22.50
::)
if exist %LOGFile% (
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO k1203781@wistron.local, -CC JALY_SHIEH@wistron.com,Joyi_Chen@wistron.com,mez900.wks.wistron@wistron.local, -MSG -USEFILE %LOGFile% -SUBJ %SUBJECT% -ATTACH %LOGFile% -server 10.42.22.50
)
::if exist %LOGFile% (
::	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO k1203781@wistron.local,K1207551@wistron.local -MSG -USEFILE %LOGFile% -SUBJ %SUBJECT% -ATTACH %LOGFile% -server 10.42.22.50
::)