@echo off

set path=c:\windows\system32;
set infofile=info.txt
set Test_Result=HDD_Test_Result.txt

set cyy=2

cd /d %USERPROFILE%\desktop\Host_PC_Detection\HDTunePro\

cls
echo HDD_Scan_Test
type HDDtune.ans
echo .

::goto Pass

:start
if exist %infofile% del %infofile%
if exist %SystemDrive%\%Test_Result% del %SystemDrive%\%Test_Result%

HDTunePro.exe /disk:0 /FUNCTION:ErrorScan /QUICKSCAN /START /LOG:%infofile% /QUIT

find /i "0.0" %infofile%
if not errorlevel 1 goto Pass

:Fail
echo NG >%SystemDrive%\%Test_Result%
if exist %infofile% del %infofile%

set /a cyy=%cyy%-1
if not @%cyy%==@0 goto start
exit

:Pass
echo OK >%SystemDrive%\%Test_Result%
if exist %infofile% del %infofile%

:end
