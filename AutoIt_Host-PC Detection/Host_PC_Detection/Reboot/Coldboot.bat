@echo off
set path=c:\windows\system32;\Host_PC_Detection\Reboot; C:\Host_PC_Detection;

REM ----------------------- Initial Arguments ------------------------
:init
SET Test_Result=%SystemDrive%\Coldboot_Test_Result.txt
SET CycMax=3
SET ErrSec=420
SET ErrCount=0
SET ErrMAX=2

cd /d %USERPROFILE%\desktop\Host_PC_Detection\Reboot\

::::::::Don't del, Only for UI Test:::::::::::
Echo Cold_Start>%SystemDrive%\Cold_Start.txt

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
type Coldboot.ans
Echo .
ping 127.0.0.1 /n 20 >nul

shutdown /s /t 20
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

Echo Cold_End>%SystemDrive%\Cold_End.txt
echo NG >%Test_Result%
Goto end


:pass
::::::::Don't del, Only for UI Test:::::::::::
DEL %SystemDrive%\Cold_Start.txt
Echo Cold_End>%SystemDrive%\Cold_End.txt

DEL %SystemDrive%\BootINI.bat
::schtasks /delete /tn reboot_test /F
echo OK >%Test_Result%



:end
