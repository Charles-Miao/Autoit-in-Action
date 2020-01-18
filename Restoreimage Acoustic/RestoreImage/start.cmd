@echo off
set path=X:\windows\system32;%vol%\tool;x:\tool;
set drv=%vol%
SET WPEVERISION=20140611
REM BASE ON WPEVERISION 


:START
:Chkmodel
CLS
::echo restore image 
::echo restore image 

::get mac address
del mac_address.txt /f /q
ipconfig /all | find /i "Physical Address" >mac_address.txt
for /f "tokens=12" %%i in (mac_address.txt) do set mac_address=%%i
echo %mac_address%

::set mac_ID
set mac_ID=NA
if @%mac_address%==@2C-41-38-5D-03-18 set mac_ID=0

if @%mac_address%==@90-2B-34-7E-F3-37 set mac_ID=1
if @%mac_address%==@50-E5-49-A5-3D-36 set mac_ID=2

if @%mac_address%==@44-8A-5B-64-30-C5 set mac_ID=3

if @%mac_address%==@94-DE-80-AC-D0-3E set mac_ID=4

if @%mac_address%==@94-DE-80-A7-5D-79 set mac_ID=5
if @%mac_address%==@44-8A-5B-64-2F-CB set mac_ID=6

if @%mac_ID%==@NA goto start
echo %mac_ID%

%ivol%
cd /d %ivol%\ghost115
call restoreimage.exe %mac_ID%

:pass
cls
type ongoing.ans
echo .
echo .
echo .
echo If you restore image ok, or cancel restore image, you can close this window.


::color 2f
::type plpass.ans
::echo restore image Pass

pause>nul
exit

		