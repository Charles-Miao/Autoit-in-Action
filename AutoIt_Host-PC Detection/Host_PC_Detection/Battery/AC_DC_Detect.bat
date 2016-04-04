echo off

set path=c:\windows\system32;\Host_PC_Detection\Battery;
set Test_Result=Battery_Test_Result.txt
set battery_temp=%USERPROFILE%\desktop\Host_PC_Detection\\Battery\battery.bat

set errormax=2

:start
if exist %SystemDrive%\%Test_Result% del %SystemDrive%\%Test_Result%
if exist %battery_temp% del %battery_temp%

cd\
cd  /d %USERPROFILE%\desktop\Host_PC_Detection\Battery

cls
color 0f
type ACDCTEST.ANS
Echo .

battery.exe

ping 127.0.0.1 /n 2 >nul

call %battery_temp%

if @%DC_Status%==@128 goto DCFAIL
if @%DC_Status%==@255 goto DCFAIL
if @%AC_Status%==@0 goto ACFAIL
if @%AC_Status%==@255 goto ACFAIL
if @%BATT_CAP%==@255 goto DCFAIL
if @%BATT_CAP%==@0 goto BattFAIL

goto Pass

:DCFAIL
Echo NG >%SystemDrive%\%Test_Result%
cls
color 4f
type DCFail.ans
echo .
echo battery NG
echo can not find system battery
echo or unable to read the battery flag information
ping 127.0.0.1 /n 12 >nul
set /a errormax=%errormax%-1
if not @%errormax%==@0 goto start
goto end

:ACFAIL
Echo NG >%SystemDrive%\%Test_Result%
cls
color 4f
type ACFail.ans
echo .
echo AC Power NG
echo NO AC Power plug_in
echo pls check AC Power Status
ping 127.0.0.1 /n 12 >nul
set /a errormax=%errormax%-1
if not @%errormax%==@0 goto start
goto end

:BattFAIL
Echo NG >%SystemDrive%\%Test_Result%
cls
color 4f
type BattFail.ans
echo .
echo battery Unknown
echo unable to read the battery flag information
echo pls check DC Status
ping 127.0.0.1 /n 12 >nul
set /a errormax=%errormax%-1
if not @%errormax%==@0 goto start
goto end

:Pass
Echo OK >%SystemDrive%\%Test_Result%
del %battery_temp%

:end


