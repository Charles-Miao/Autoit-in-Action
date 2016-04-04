@echo off

:send
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
SET FROM="Charles_Miao@wistron.com"
SET SUBJECT="NG Log Report"

set TempFile=D:\TEJob\ServerCheck\test.log
set zipfile=D:\TEJob\ServerCheck\NG_LOG.txt

echo Dear All, >%TempFile%
echo This is Server check NG LOG report. >>%TempFile%
echo Please Check it, Thanks! >>%TempFile%
echo.>>%TempFile%

echo Best Regards!>>%TempFile%
echo ==========WKS Plant 5C============>>%TempFile%
echo WKS Plant 5C/MEZ920/TE >>%TempFile%
echo Charles Miao(2948)>>%TempFile%
echo Tel: 15250187824 &687824>>%TempFile%
echo E-Mail: Charles Miao/WKS/Wistron>>%TempFile%
echo Wistron InfoComm (Kunshan) Co. Ltd.>>%TempFile%
echo ================================= >>%TempFile%

if exist %TempFile% (
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO Charles_Miao@wistron.com, -MSG -USEFILE %TempFile% -SUBJ %SUBJECT% -ATTACH %zipfile% -server 10.42.22.50
)