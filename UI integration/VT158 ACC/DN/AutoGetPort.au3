#include "CommMG.au3"
Local $GetPort_File
Local $arrPort = _CommListPorts(0)

If Number($arrPort[0]) <> 1 Then
	$GetPort_File=FileOpen("AutoGetPort.txt",2)
	FileWrite($GetPort_File,"NA")
	FileClose($GetPort_File)
Else
	$GetPort_File=FileOpen("AutoGetPort.txt",2)
	FileWrite($GetPort_File,Number(StringTrimLeft($arrPort[1], 3)))
	FileClose($GetPort_File)
EndIf