@echo on
path | find /i "\tool;" >nul || path=%path%;..\..\tool;..\tool;.\tool
call Log.bat start %0 %1
call c:\info.bat

REM ----------------------- Main Program -----------------------------
:Init
Set USL=OK
Set LSL=OK
set Msg=%~n0 return:

set mac_192.168.1.2=
set mac_192.168.1.3=
set mac_192.168.1.4=
set mac_192.168.1.5=
set mac_192.168.1.6=

:Check_File
if exist mac_address.txt del mac_address.txt

:Verify_PN
set Pr_SN=%USN%
set Pr_PN=%szCustomerPN%
set Jg=%Pr_PN:~9,3%
echo %Jg%

IF @%Jg%==@201 goto Four_Slot_Ethernet_Cradle
IF @%Jg%==@202 goto Four_Slot_Ethernet_Cradle
IF @%Jg%==@501 goto Vehicle_Cradle

:Four_Slot_Ethernet_Cradle
::check network
ping 192.168.1.2 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.2 | findstr dynamic >>mac_address.txt

ping 192.168.1.3 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.3 | findstr dynamic >>mac_address.txt

ping 192.168.1.4 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.4 | findstr dynamic >>mac_address.txt

ping 192.168.1.5 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.5 | findstr dynamic >>mac_address.txt

ping 192.168.1.6 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.6 | findstr dynamic >>mac_address.txt

::check mac_address
for /f "tokens=1,2" %%i in (mac_address.txt) do set mac_%%i=%%j
if @%mac_192.168.1.2%==@%mac_192.168.1.3% goto fail
if @%mac_192.168.1.2%==@%mac_192.168.1.4% goto fail
if @%mac_192.168.1.2%==@%mac_192.168.1.5% goto fail
if @%mac_192.168.1.2%==@%mac_192.168.1.6% goto fail

if @%mac_192.168.1.3%==@%mac_192.168.1.4% goto fail
if @%mac_192.168.1.3%==@%mac_192.168.1.5% goto fail
if @%mac_192.168.1.3%==@%mac_192.168.1.6% goto fail

if @%mac_192.168.1.4%==@%mac_192.168.1.5% goto fail
if @%mac_192.168.1.4%==@%mac_192.168.1.6% goto fail

if @%mac_192.168.1.5%==@%mac_192.168.1.6% goto fail

if @%mac_192.168.1.2%==@ goto Fail
if @%mac_192.168.1.3%==@ goto Fail
if @%mac_192.168.1.4%==@ goto Fail
if @%mac_192.168.1.5%==@ goto Fail
if @%mac_192.168.1.6%==@ goto Fail

goto pass

:Vehicle_Cradle
::get_device
wait 3
set /a count=%count%+1
if @%count%==@50 goto fail
devcon status * | find /i "USB\VID_0BDA&PID_0138"
if errorlevel 1 goto get_device

goto pass

:Fail
call log.bat Fail
goto End


:Pass
call log.bat Pass
goto End

:End