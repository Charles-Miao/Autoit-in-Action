chcp 437
echo off
net use * /d /y

SET Sfc_IP=140.58.16.10

::ipconfig /all | find /i "DHCP Server" >server.txt
  ::  for /f "tokens=15" %%i in (server.txt) do set Sfc_IP=%%i
net use \\%Sfc_IP%\Molly_FA /user:admin btco
NET TIME \\%Sfc_IP% /SET /Y

ROBOCOPY.exe \\%Sfc_IP%\Molly_FA\FA\AD161_ACC\DH_Function\.    C:\AD161_ACC /E
if not errorlevel 4 set c0=ok

net use * /d /y
NET USE Z: \\140.58.16.10\Share btco /USER:Admin /PERSISTENT:YES
cd\
C:
cd C:\AD161_ACC
start AD161_ACC.exe
