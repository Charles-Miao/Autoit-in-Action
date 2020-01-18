set cradle_standard=1
set cradle=1

:Check_File
if exist Read_COM.txt del Read_COM.txt
if exist Check_COMPort.txt del Check_COMPort.txt
if exist message.txt del message.txt
if exist Read_Multimeter.txt del Read_Multimeter.txt

:Read_COMPort
Read_COM.exe
find /i "COM" Read_COM.txt
if errorlevel 1 goto Fail
for /f %%i in (Read_COM.txt) do set COM_Port=%%i

:Check_COMPort
Check_COMPort.exe %COM_Port%> Check_COMPort.txt
find /i "DCV" Check_COMPort.txt
if errorlevel 1 goto Fail

::�T�{�v��O�_��n, ��Ū���q�y����, �P�ɧP�w�O�_�bSpec����
:Read_Multimeter
if %cradle% > %cradle_standard% goto End_Read
::�T�{�v��O�_��n?
message.exe %cradle%
find /i "OK" message.txt
if errorlevel 1 goto Fail
::Ū��, �ç@�P�_
Read_Multimeter.exe %COM_Port%>Read_Multimeter.txt
for /f %%i in (Read_Multimeter.txt) do set Result=%%i
if %Result% GTR 5.67 goto Fail
if %Result% LSS 5.13 goto Fail

set cradle=cradle+1
goto Read_Multimeter

:End_Read
 

:Fail
goto End

:Pass
goto End

:End