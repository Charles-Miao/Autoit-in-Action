@echo on
path | find /i "\tool;" >nul || path=%path%;..\..\tool;..\tool;.\tool
call Log.bat start %0 %1
call c:\info.bat

REM ----------------------- Main Program -----------------------------
:Init
Set USL=OK
Set LSL=OK
set Msg=%~n0 return:

:Check_File
if exist mac.txt del mac.txt
if exist mac_address.txt del mac_address.txt

:Four_Slot_Ethernet_Cradle
::check network
ping 192.168.1.2
ping 192.168.1.2 -n 2 -w 1000 | findstr TTL
if errorlevel 1 goto fail
arp -a 192.168.1.2 | findstr dynamic >>mac_address.txt

goto pass


:Fail
call log.bat Fail
goto End


:Pass
call log.bat Pass
goto End

:End