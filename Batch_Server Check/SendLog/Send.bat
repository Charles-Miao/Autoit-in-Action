for /f "tokens=1,2,3 delims=-" %%i in ('dateadd.exe -1') do set dd=%%i-%%j-%%k

set p1=E:\LOG\LOG_A80\A80_LOG%dd%
set PName=A80_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_A11\A11_LOG%dd%
set PName=A11_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_A68M\A68M_LOG%dd%
set PName=A68M_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_P101G\P101G_LOG%dd%
set PName=P101G_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME302KL\ME302KL_LOG%dd%
set PName=ME302KL_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_P05\P05_LOG%dd%
set PName=P05_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_A86\A86_LOG%dd%
set PName=A86_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME302C\ME302C_LOG%dd%
set PName=ME302C_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME372CG\ME372CG_LOG%dd%
set PName=ME372CG_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME102A\ME102A_LOG%dd%
set PName=ME102A_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%
set PName=ME175KG_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME180A\ME180A_LOG%dd%
set PName=ME180A_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_P71L\P71L_LOG%dd%
set PName=P71L_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME560CG\ME560CG_LOG%dd%
set PName=ME560CG_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME175CG\ME175CG_LOG%dd%
set PName=ME175CG_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME372CG_CR\ME372CG_CR_LOG%dd%
set PName=ME372CG_CR_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_A91\A91_LOG%dd%
set PName=A91_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_P92L\P92L_LOG%dd%
set PName=P92L_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_ME372CL\ME372CL_LOG%dd%
set PName=ME372CL_LOG%dd%
call :SendOne

set p1=E:\LOG\LOG_A91_P92L\A91_P92L_LOG%dd%
set PName=A91_P92L_LOG%dd%
call :SendOne

goto :eof


:SendOne
find /i "%p1%" sendOK.log
if not errorlevel 1 goto :eof

echo open 103.10.4.191>s.txt
echo WT0000001>>s.txt
echo fdb3c3a968633c3b>>s.txt

for /f %%i in ('dir /b /ad %P1%') do (
  7z.exe -tzip  a %P1%\%%i.zip %P1%\%%i
  echo put %P1%\%%i.zip %PName%%%i.zip>>s.txt
)
echo bye >>s.txt

if not exist dtl mkdir dtl
set acount=0
:BeginSend
set /a acount=%acount% + 1
ftp -s:s.txt >dtl\send_%PName%%acount%.log
for /f "tokens=*" %%i in ('find /c /i "226 Transfer" dtl\send_%PName%%acount%.log') do set OK1=%%i
for /f "tokens=*" %%i in ('find /c /i "put" dtl\send_%PName%%acount%.log') do set put1=%%i
if not "%OK1%"=="%put1%" (
    if %acount% LSS 5 goto :BeginSend
	echo Fail on %p1% send to server >>sendNG.log
	goto :eof
)
:sendOK
echo %date% %time% Pass on %p1% send to server >>sendOK.log
del %P1%\*.zip