@echo on
rem /*****************************************************/
rem /*    FurMark Runin test  version 1.0  2010/09/07    */
rem /*****************************************************/

REM ----------------------- Initial Arguments ------------------------
:init
set path=c:\windows\system32;%p3%\winfunc;%p3%\tool;c:\;%p3%\
SET Func=WIN_FurMark_RUNIN      
CALL SETLOG START
::set cyy=16


Cls
color 0F
TYPE FURMARK.ANS
ECHO.


cd \winfunc\FMKN14
lcd.exe
call out.bat

:start
call FurMark.exe /width=%width%-1 /height=%height%-1 /msaa=0 /max_time=3600000 /fullscreen /nogui /nomenubar /noscore /run_mode=1 /contest_mode=2 /log_score /disable_catalyst_warning
if not errorlevel 1 goto NG

::wait64 2000
::set /a cyy=%cyy%-1
::if not @%cyy%==@0 goto start

goto end

REM ----------------------- Fail Message -----------------------------
:NG 
::*** Log Error Message in Log File ***::
CALL SETLOG FAIL 
cls
color 4E
TYPE FURMARKNG.ANS
ECHO.
WAIT64 4000
goto init

:end
CALL SETLOG END
DEL %LogFile%
SET Func=
