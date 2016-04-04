:start

for %%i in (\\192.168.168.88\vol1\MESSAGE\SFCS\FA\log\*.log) do (
copy %%i D:\LOG\. /Y
del %%i
)

:: forfiles /P L:\FA\ASUSRRRBBB\ /D -1  /c "cmd /c del /q @path"

ping 127.0.0.1 -n 2
 
goto Start