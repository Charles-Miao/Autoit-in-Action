for /f "tokens=1,2,3 delims=-" %%i in ('dateadd.exe -1') do set dd=%%i-%%j-%%k

set p1=E:\A80_LOG%dd%
set PName=A80_LOG%dd%
find /i "%p1%" sendOK.log
if not errorlevel 1 echo OK
pause