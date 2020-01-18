::Notice
chcp 437
echo off
net use * /d /y
ipconfig /release
ipconfig /renew
ipconfig /all | find /i "DHCP Server" >server.txt
for /f "tokens=15" %%i in (server.txt) do set Sfc_IP=%%i
net use \\%Sfc_IP%\vol1 /user:admin btco
NET TIME \\%Sfc_IP% /SET /Y
if exist \\%Sfc_IP%\vol1\pdline\serverip.bat call \\%Sfc_IP%\vol1\pdline\serverip.bat
net use \\%Sfc_IP%\vol1 /user:admin btco
CALL .\dir.bat
ROBOCOPY \\%Sfc_IP%\vol1\pdline\New_UI\. c:\. /E /R:2 /W:0
ROBOCOPY \\%Sfc_IP%\vol1\pdline\%directory%\. c:\. /E /R:2 /W:0
if not errorlevel 4 set c1=ok 
ATTRIB -R C:\%directory%\*.* /S
if "%c1%"=="ok" color A0
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if "%c1%"=="ok" echo PASS
if NOT "%c1%"=="ok" color C0
if NOT "%c1%"=="ok" echo NG
if NOT "%c1%"=="ok" echo NG
if NOT "%c1%"=="ok" echo NG
if NOT "%c1%"=="ok" echo NG
if NOT "%c1%"=="ok" echo NG
if NOT "%c1%"=="ok" echo NG
del "%USERPROFILE%\DESKTOP\TF*.lnk" 
del "%USERPROFILE%\DESKTOP\*tabl*.lnk"
cd /d c:\%directory%\tool\
refreshicon.exe
::SHORTCUT.EXE -F -t "C:\%directory%\TabletPcLaunch\TabletPcLaunch.exe" -n "%USERPROFILE%\DESKTOP\TF300T.lnk" 
SHORTCUT.EXE -F -t "C:\UITEST\TabletPC_Test_UI.exe" -n "%USERPROFILE%\DESKTOP\UI.lnk" 
start c:\%directory%\station\updateProgram\adbOnOffline.exe
cd /d c:\%directory%\tool\Installdrive\
ver | find /i "xp"
if errorlevel 1 start /min Install.bat
start /min c:\setWin7.bat
PAUSE
