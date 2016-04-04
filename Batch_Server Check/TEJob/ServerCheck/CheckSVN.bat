::@echo off
if not exist D:\TEJob\ServerCheck\CheckSVN.txt goto end

if exist D:\TEJob\ServerCheck\CheckSVN.txt goto send

:send
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
SET FROM="P5_SVN_Server"
SET SUBJECT="SVN Check Report"

set TempFile=D:\TEJob\ServerCheck\CheckSVN.log
set zipfile=D:\TEJob\ServerCheck\CheckSVN.txt

echo Dear All, >%TempFile%
echo This is Check SVN report. >>%TempFile%
echo Please known it, Thanks! >>%TempFile%
echo.>>%TempFile%
type D:\TEJob\ServerCheck\CheckSVN.txt>>%TempFile%
echo.>>%TempFile%
echo Best Regards!>>%TempFile%
echo ==========WKS Plant 5C============>>%TempFile%
echo WKS Plant 5C/MEZ920/TE >>%TempFile%
echo Charles Miao(2948)>>%TempFile%
echo Tel: 687824 >>%TempFile%
echo E-Mail: Charles Miao/WKS/Wistron>>%TempFile%
echo Wistron InfoComm (Kunshan) Co. Ltd.>>%TempFile%
echo ================================= >>%TempFile%

if exist %TempFile% (
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO Carl_Su@wistron.com,Jax_Yang@wistron.com,Jeyde_Pei@wistron.com,K1210568@wistron.local,Kima_Li@wistron.com,Michael_Y_Chen@wistron.com,MurPhy_Lee@wistron.com,Twist_Niu@wistron.com,Caitlin_Yang@wistron.com,K1304037@wistron.local,Yicheng_Yang@wistron.com,Chundong_Xue@Wistron.com,K0811272@wistron.local,Durk_Liu@wistron.com,Helen_Wei@wistron.com,K1101081@wistron.local,Iris_Xu@wistron.com,K1211L20@wistron.local,Leo_Simpson@wistron.com,Magic_Shan@wistron.com,Shupei_Li@Wistron.local,Tim_Zhang@wistron.com,Vigin_Liu@wistron.com,Weiwei_Wang@wistron.com, -CC JALY_SHIEH@wistron.com,Joyi_Chen@wistron.com,Tony_Dong@wistron.com,Hit_Lin@wistron.com,Charles_Miao@wistron.com,Dary_Cao@wistron.com, -MSG -USEFILE %TempFile% -SUBJ %SUBJECT% -ATTACH %zipfile% -server 10.42.22.50
)
del D:\TEJob\ServerCheck\CheckSVN.txt /q
goto end

:end

if not exist D:\TEJob\ServerCheck\CheckMollySVN.txt goto end2

if exist D:\TEJob\ServerCheck\CheckMollySVN.txt goto send2

:send2
SET SENDMAIL="C:\program files\febooti command line email\febootimail.exe"
SET FROM="P5_SVN_Server"
SET SUBJECT="SVN Check Report"

set TempFile=D:\TEJob\ServerCheck\CheckMollySVN.log
set zipfile=D:\TEJob\ServerCheck\CheckMollySVN.txt

echo Dear All, >%TempFile%
echo This is Check SVN report. >>%TempFile%
echo Please known it, Thanks! >>%TempFile%
echo.>>%TempFile%
type D:\TEJob\ServerCheck\CheckMollySVN.txt>>%TempFile%
echo.>>%TempFile%
echo Best Regards!>>%TempFile%
echo ==========WKS Plant 5C============>>%TempFile%
echo WKS Plant 5C/MEZ920/TE >>%TempFile%
echo Charles Miao(2948)>>%TempFile%
echo Tel: 687824 >>%TempFile%
echo E-Mail: Charles Miao/WKS/Wistron>>%TempFile%
echo Wistron InfoComm (Kunshan) Co. Ltd.>>%TempFile%
echo ================================= >>%TempFile%

if exist %TempFile% (
	%SENDMAIL%  -PRIORITY 1 -FROM %FROM% -TO Carl_Su@wistron.com,Jax_Yang@wistron.com,Jeyde_Pei@wistron.com,K1210568@wistron.local,Kima_Li@wistron.com,Michael_Y_Chen@wistron.com,MurPhy_Lee@wistron.com,Twist_Niu@wistron.com,Caitlin_Yang@wistron.com,K1304037@wistron.local,Yicheng_Yang@wistron.com,Chundong_Xue@Wistron.com,K0811272@wistron.local,Durk_Liu@wistron.com,Helen_Wei@wistron.com,K1101081@wistron.local,Iris_Xu@wistron.com,K1211L20@wistron.local,Leo_Simpson@wistron.com,Magic_Shan@wistron.com,Shupei_Li@Wistron.local,Tim_Zhang@wistron.com,Vigin_Liu@wistron.com,Weiwei_Wang@wistron.com, -CC JALY_SHIEH@wistron.com,Joyi_Chen@wistron.com,Tony_Dong@wistron.com,Hit_Lin@wistron.com,Charles_Miao@wistron.com,Dary_Cao@wistron.com, -MSG -USEFILE %TempFile% -SUBJ %SUBJECT% -ATTACH %zipfile% -server 10.42.22.50
)
del D:\TEJob\ServerCheck\CheckMollySVN.txt /q
goto end

:end2