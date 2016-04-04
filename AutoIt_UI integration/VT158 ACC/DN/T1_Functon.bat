
:Check_File
if exist AutoGetPort.txt del AutoGetPort.txt
if exist IniPort.txt del IniPort.txt

::自動獲取COM口
:AutoGetPort
AutoGetPort.exe
find /i "NA" AutoGetPort.txt
if not errorlevel 1 goto Fail
for /f %%i in (AutoGetPort.txt) do set COM_Port=%%i

::初始化串口
IniPort.exe %COM_Port%
find /i "OK" IniPort.txt
if errorlevel 1 goto Fail

::檢查串口數據中是否包含"AT"
GetString.exe
find /i "OK" GetString.txt
if errorlevel 1 goto Fail

:Fail
goto End

:Pass
goto End

:End