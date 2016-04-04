for /f "tokens=1,2,3 delims=-" %%i in ('dateadd.exe -1') do set dd=%%i-%%j-%%k

set p1=E:\P05_LOG%dd%
set PName=P05_LOG%dd%

echo open 103.10.4.191>s.txt
echo WT0000001>>s.txt
echo fdb3c3a968633c3b>>s.txt

for /f %%i in ('dir /b /ad %P1%') do (
  7z.exe -tzip  a %P1%\%%i.zip %P1%\%%i
  echo put %P1%\%%i.zip %PName%%%i.zip>>s.txt
)
echo bye >>s.txt

if not exist dtl mkdir dtl
ftp -s:s.txt >>dtl\send_%PName%.log
find /i "226 Transfer" dtl\send_%PName%.log
if errorlevel 1 (
	echo Fail on %p1% send to server >>sendP05NG.log
	goto :eof
)
:sendOK
echo %date% %time% Pass on %p1% send to server >>sendP05OK.log

 
