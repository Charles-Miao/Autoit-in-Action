chcp 437
echo off

SET Sfc_IP=140.58.16.10
::ipconfig /all | find /i "DHCP Server" >server.txt
 ::for /f "tokens=15" %%i in (server.txt) do set Sfc_IP=%%i

NET USE  \\%Sfc_IP%\share btco /USER:Admin /PERSISTENT:YES
NET TIME \\%Sfc_IP% /SET /Y

ROBOCOPY "\\%Sfc_IP%\Molly_FA\FA\VT158_ACC\VT158ACCNEW\."    C:\VT158ACCNEW /E

