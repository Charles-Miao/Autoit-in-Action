del 1.txt

pause
set linenumber=8
set maxnumber=210
dir C:\Users\k1203781\Desktop\xml\From > C:\Users\k1203781\Desktop\xml\1.txt
:copy_file

if %linenumber% GTR %maxnumber% goto end

for /f "tokens=5 delims= " %%i in ('find /v /n "" 1.txt ^| find /i "[%linenumber%]"') do set filename=%%i

set SN=%filename:~3,15%
set Year=%filename:~19,4%
set Month=%filename:~24,2%
set Day=%filename:~27,2%
set Hour=%filename:~30,2%
set Minute=%filename:~33,2%
set Second=%filename:~36,2%

COPY C:\Users\k1203781\Desktop\xml\From\%filename%  C:\Users\k1203781\Desktop\xml\To\%SN%_%Year%-%Month%-%Day%_%Hour%-%Minute%-%Second%.xml /Y

set /a linenumber=%linenumber%+1

goto copy_file


:end