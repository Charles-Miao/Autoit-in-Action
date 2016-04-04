@echo off
set path=c:\windows\system32;\Host_PC_Detection\Reboot; C:\Host_PC_Detection;

REM ----------------------- Initial Arguments ------------------------
:init
SET Test_Result=%SystemDrive%\Coldboot_Test_Result.txt
SET CycMax=2

::::::::Don't del, Only for UI Test:::::::::::
Echo Cold_Start>%SystemDrive%\Boottest.txt

pause
goto pass

REM ----------------------- Main Program -----------------------------
:BootINI
if not exist \Host_PC_Detection\Reboot\BootINI.bat goto start
call \Host_PC_Detection\Reboot\BootINI.bat

if %CycNow% GTR %CycMax% goto pass
goto BootTest

:START
set CycNow=1
schtasks /create /tn reboot_test /tr \Host_PC_Detection\Reboot\Reboot.bat /sc onstart /F
goto BootTest

:BootTest

shutdown /r /t 5
set /a CycNow=CycNow+1
echo set CycNow=%CycNow% >\Host_PC_Detection\Reboot\BootINI.bat
goto end

REM ----------------------- End & Clear Temporary Data ---------------
:pass
DEL %SystemDrive%\BootINI.bat
schtasks /delete /tn reboot_test /F
echo OK >%Test_Result%
cls
color 0F
Type c:\Host_PC_Detection\Reboot\Host_PC_Detection.ANS
Echo.
C:\Host_PC_Detection\Host_PC_Detection.exe
rd /s /q c:\Host_PC_Detection
:end

::::::::Don't del, Only for UI Test:::::::::::
Echo Cold_End>%SystemDrive%\Boottest.txt