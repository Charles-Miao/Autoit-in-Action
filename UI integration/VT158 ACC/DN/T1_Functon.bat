
:Check_File
if exist AutoGetPort.txt del AutoGetPort.txt
if exist IniPort.txt del IniPort.txt

::�۰����COM�f
:AutoGetPort
AutoGetPort.exe
find /i "NA" AutoGetPort.txt
if not errorlevel 1 goto Fail
for /f %%i in (AutoGetPort.txt) do set COM_Port=%%i

::��l�Ʀ�f
IniPort.exe %COM_Port%
find /i "OK" IniPort.txt
if errorlevel 1 goto Fail

::�ˬd��f�ƾڤ��O�_�]�t"AT"
GetString.exe
find /i "OK" GetString.txt
if errorlevel 1 goto Fail

:Fail
goto End

:Pass
goto End

:End