@echo off
set path=c:\windows\system32;\Host_PC_Detection\Reboot; C:\Host_PC_Detection;

REM ----------------------- Initial Arguments ------------------------
:init
SET Test_Result=%SystemDrive%\Warmboot_Test_Result.txt
SET CycMax=3
SET ErrSec=420
SET ErrCount=0
SET ErrMAX=2


cd /d %USERPROFILE%\desktop\Host_PC_Detection\Reboot\

::::::::Don't del, Only for UI Test:::::::::::
Echo Warm_Start>%SystemDrive%\Warm_Start.txt

if exist %SystemDrive%\%Test_Result% del %SystemDrive%\%Test_Result%


REM ----------------------- Main Program -----------------------------
:BootINI
:CheckTime
if not exist %SystemDrive%\BootINI.bat goto start
call %SystemDrive%\BootINI.bat

runtime "SET NowTime=" >%SystemDrive%\BootINI.bat
echo. >>%SystemDrive%\BootINI.bat
call %SystemDrive%\BootINI.bat
set /a differ=%NowTime%-%PreTime%

if %differ% GTR %ErrSec% goto fail
if %CycNow% GTR %CycMax% goto pass
goto BootTest

:START
set CycNow=1
::schtasks /create /tn reboot_test /tr %USERPROFILE%\desktop\Host_PC_Detection\Reboot\warm.bat /sc onstart /F
::goto BootTest

:BootTest
cls
color 0f
type Warmboot.ans
Echo .
ping 127.0.0.1 /n 20 >nul

shutdown /r /t 10
set /a CycNow=CycNow+1
echo set CycNow=%CycNow% >%SystemDrive%\BootINI.bat
echo set ErrCount=%ErrCount% >>%SystemDrive%\BootINI.bat
runtime  "SET PreTime=" >>%SystemDrive%\BootINI.bat

goto end

REM ----------------------- End & Clear Temporary Data ---------------
:fail
ping 127.0.0.1 /n 5 >nul

DEL %SystemDrive%\BootINI.bat

set /a ErrCount=ErrCount+1
if %ErrCount% LSS %ErrMax% goto CheckTime

echo NG >%Test_Result%
Goto end


:pass
::::::::Don't del, Only for UI Test:::::::::::
del %SystemDrive%\Warm_Start.txt
Echo Warm_End>%SystemDrive%\Warm_End.txt

DEL %SystemDrive%\BootINI.bat
::schtasks /delete /tn reboot_test /F
echo OK >%Test_Result%

:end
if not exist %SystemDrive%\Warmboot_Test_Result.txt ping 127.0.0.1 /n 10>nul
if not exist %SystemDrive%\Warmboot_Test_Result.txt goto end

DEL %SystemDrive%\BootINI.bat
::pause