#include "CommMG.au3"
Local $IniPort=$CmdLine[1]
Local $IniPort_File
Local $sErr
If _CommSetPort($IniPort, $sErr, 115200, 8, 0, 1, 2) = 0 Then
	$IniPort_File=FileOpen("IniPort.txt", 2)
	FileWrite($IniPort_File,"NG")
	FileClose($IniPort_File)
Else
	$IniPort_File=FileOpen("IniPort.txt", 2)
	FileWrite($IniPort_File,"OK")
	FileClose($IniPort_File)
EndIf