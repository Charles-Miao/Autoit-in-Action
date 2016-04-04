@echo off
rem /*****************************************************/
rem /*    FurMark Runin test  version 1.0  2010/09/07    */
rem /*****************************************************/

REM ----------------------- Initial Arguments ------------------------
:init
set path=c:\windows\system32;%p3%\winfunc;%p3%\tool;c:\;%p3%\;\Host_PC_Detection\Battery\Furmark;
SET Func=WIN_FurMark_RUNIN      
SET Test_Result=Furmark_Test_Result.txt

if exist %SystemDrive%\%Test_Result% del %SystemDrive%\%Test_Result%

::goto end


Cls
color 0F


cd  /d %USERPROFILE%\desktop\Host_PC_Detection\FURMARK

%USERPROFILE%\desktop\Host_PC_Detection\FURMARK\lcd.exe
call %USERPROFILE%\desktop\Host_PC_Detection\FURMARK\out.bat

:start

call FurMark.exe /width=%width%-1 /height=%height%-1 /msaa=0 /max_time=25000 /fullscreen /nogui /nomenubar /noscore /run_mode=1 /contest_mode=2 /log_score /disable_catalyst_warning
if not errorlevel 1 goto NG



goto end

REM ----------------------- Fail Message -----------------------------
:NG 
::*** Log Error Message in Log File ***::

cls
color 4E

echo NG >%SystemDrive%\%Test_Result%
DEL %LogFile%
SET Func=
exit

:end
DEL %LogFile%
SET Func=
echo OK >%SystemDrive%\%Test_Result%