@echo on
path | find /i "\tool;" >nul || path=%path%;..\..\tool;..\tool;.\tool
call Log.bat start %0 %1
call c:\info.bat

REM ----------------------- Main Program -----------------------------
:Init
Set USL=0
Set LSL=0
set Msg=%~n0 return:

:get_device
wait 3
set /a count=%count%+1
if @%count%==@50 goto fail
devcon status * | find /i "USB\VID_05E0&PID_1A00"
if errorlevel 1 goto get_device
goto pass
 
:Fail
set return=1
call log.bat Fail
goto End

:Pass
set return=0
call log.bat Pass
goto End

:End