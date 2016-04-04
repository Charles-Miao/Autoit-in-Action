
for /f "tokens=2,3,4,5 delims=/ " %%i in ("%date%") do set dd=%%k-%%i-%%j
 
set dd=e:/backup/TF300_All-%dd%
::if not exist %dd% mkdir %dd%
net use \\192.168.168.230 /user:admin btco
robocopy \\192.168.168.230\MainServer\. %dd%\. /E /R:2 /W:0
 
 