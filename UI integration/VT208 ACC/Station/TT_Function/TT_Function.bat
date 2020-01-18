@echo on
path | find /i "\tool;" >nul || path=%path%;..\..\tool;..\tool;.\tool
call Log.bat start %0 %1
call c:\info.bat

REM ----------------------- Main Program -----------------------------
:Init

Set USL=0
Set LSL=0
set Msg=%~n0 return:

if exist Pass.txt del Pass.txt
if exist Fail.txt del Fail.txt

taskkill /F /IM DMMTest.exe
taskkill /F /IM LoadingTest10G.exe
taskkill /F /IM LoadingTest101G.exe
taskkill /F /IM LoadingTest401G.exe
taskkill /F /IM LoadingTest601G.exe
taskkill /F /IM CheckResult.exe
taskkill /F /IM WriteInfoToTool.exe

set Pr_SN=%USN%
set Pr_PN=%szCustomerPN%
set Jg=%Pr_PN:~9,3%
echo %Jg%

IF @%Jg%==@001 goto Single_Slot_Terminal_Cradle
IF @%Jg%==@101 goto Toastor_cradle_1
IF @%Jg%==@102 goto Toastor_cradle_1
IF @%Jg%==@401 goto Toastor_cradle_2
IF @%Jg%==@402 goto Toastor_cradle_2
IF @%Jg%==@601 goto Toastor_cradle_3
IF @%Jg%==@201 goto Four_Slot_Ethernet_Cradle1
IF @%Jg%==@301 goto Four_Slot_Ethernet_Cradle1
IF @%Jg%==@202 goto Four_Slot_Ethernet_Cradle2
IF @%Jg%==@302 goto Four_Slot_Ethernet_Cradle2
IF @%Jg%==@501 goto Vehicle_Cradle

:Single_Slot_Terminal_Cradle
Start C:\VT208@ACC\Station\TT_Function\1-Slot_Terminal_Cradle\DMMTest.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Single_Slot_Terminal_Cradle
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Single_Slot_Terminal_Cradle

:Toastor_cradle_1
Start C:\VT208@ACC\Station\TT_Function\Toastor_Cradle_1\LoadingTest101G.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Toastor_cradle_1
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Toastor_cradle_1

:Toastor_cradle_2
Start C:\VT208@ACC\Station\TT_Function\Toastor_Cradle_2\LoadingTest401G.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Toastor_cradle_2
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Toastor_cradle_2

:Toastor_cradle_3
Start C:\VT208@ACC\Station\TT_Function\Toastor_Cradle_3\LoadingTest601G.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Toastor_cradle_3
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Toastor_cradle_3

:Four_Slot_Ethernet_Cradle1
Start C:\VT208@ACC\Station\TT_Function\4S_Ethernet_Cradle1\DMMTest.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Four_Slot_Ethernet_Cradle1
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Four_Slot_Ethernet_Cradle1

:Four_Slot_Ethernet_Cradle2
Start C:\VT208@ACC\Station\TT_Function\4S_Ethernet_Cradle2\DMMTest.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Four_Slot_Ethernet_Cradle2
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Four_Slot_Ethernet_Cradle2

:Vehicle_Cradle
Start C:\VT208@ACC\Station\TT_Function\Vehicle_Cradle\DMMTest.exe
Start C:\VT208@ACC\Station\TT_Function\WriteInfoToTool.exe %USN%
Start C:\VT208@ACC\Station\TT_Function\CheckResult.exe
:Check_Result_Vehicle_Cradle
if exist Fail.txt goto Fail
if exist Pass.txt goto Pass
ping 127.0.0.1 -n 2
goto Check_Result_Vehicle_Cradle


:Fail

call log.bat Fail
goto End


:Pass

call log.bat Pass
goto End

:End
	