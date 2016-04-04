#include "CommMG.au3"
Local $sTmp
Local $gsInfo
Local $GetString_file

Local $IniPort=$CmdLine[1]
Local $sErr

_CommSetPort($IniPort, $sErr, 115200, 8, 0, 1, 2)

MsgBox(262144+1+32+4096,"提示選擇","請確認Terminal是否發送文件")

$gsInfo=""
$sTmp = _CommGetString()


if $sTmp <> "" Then
	$gsInfo &= $sTmp
	If StringInStr($gsInfo, "AT") <> 0 Then
		$GetString_file=FileOpen("GetString.txt",2)
		FileWrite($GetString_file,"OK")
		FileClose($GetString_file)
		$gsInfo=""
	Else
		$GetString_file=FileOpen("GetString.txt",2)
		FileWrite($GetString_file,"Fail")
		FileClose($GetString_file)
		$gsInfo=""
	EndIf
EndIf
