@echo off
if not exist D:\TEJob\ServerCheck\NG_LOG.zip goto end

if exist D:\TEJob\ServerCheck\NG_LOG.zip goto send

:send
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
SET FROM="P5C_TE_Server"
SET SUBJECT="NG Log Report"

set TempFile=D:\TEJob\ServerCheck\NG_Formart_Log.log
set zipfile=D:\TEJob\ServerCheck\NG_LOG.zip

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
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO Charles_Miao@wistron.com,Carl_Su@wistron.com,JALY_SHIEH@wistron.com,Jax_Yang@wistron.com,Jeyde_Pei@wistron.com,Joyi_Chen@wistron.com,K1210568@wistron.local,Kima_Li@wistron.com,Michael_Y_Chen@wistron.com,MurPhy_Lee@wistron.com,Twist_Niu@wistron.com,Yicheng_Yang@wistron.com,Caitlin_Yang@wistron.com,K1304037@wistron.local,K1210568@wistron.local, -MSG -USEFILE %TempFile% -SUBJ %SUBJECT% -ATTACH %zipfile% -server 10.42.22.50
)

del D:\TEJob\ServerCheck\NG_LOG.zip /q
goto end

:end