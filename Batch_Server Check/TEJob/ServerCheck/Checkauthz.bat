@echo off
if not exist D:\TEJob\ServerCheck\authz.conf goto end

if exist D:\TEJob\ServerCheck\authz.conf goto send

:send
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
SET FROM="P5C_SVN_Server"
SET SUBJECT="SVN Authz"

set TempFile=D:\TEJob\ServerCheck\CheckSVNauthz.log
set zipfile=D:\TEJob\ServerCheck\authz.conf

echo Dear All, >%TempFile%
echo This is Check SVN authz report. >>%TempFile%
echo Please known it, Thanks! >>%TempFile%
echo.>>%TempFile%
type D:\TEJob\ServerCheck\authz.conf>>%TempFile%
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
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO Jeyde_Pei@wistron.com,Kima_Li@wistron.com,MurPhy_Lee@wistron.com,Twist_Niu@wistron.com, -CC JALY_SHIEH@wistron.com,Joyi_Chen@wistron.com,Charles_Miao@wistron.com, -MSG -USEFILE %TempFile% -SUBJ %SUBJECT% -ATTACH %zipfile% -server 10.42.22.50
)
del D:\TEJob\ServerCheck\authz.conf /q
goto end

:end