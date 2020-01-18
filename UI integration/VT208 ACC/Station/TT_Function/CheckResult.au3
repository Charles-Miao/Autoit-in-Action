#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $WinTitle = "[Class:ThunderRT6FormDC]"
Global $WinCtrl = "ThunderRT6TextBox22"
Global $Passfile
Global $Failfile

Opt("TrayIconHide", 1)

while 1
	If WinExists($WinTitle) And ControlGetText($WinTitle, "", $WinCtrl) == "PASS" Then
		$Passfile=FileOpen("Pass.txt",2)
		FileClose($Passfile)
		Exit(0)
	ElseIf WinExists($WinTitle) And ControlGetText($WinTitle, "", $WinCtrl) == "FAIL" Then
		$Failfile=FileOpen("Fail.txt",2)
		FileClose($Failfile)
		Exit(1)
	Else
		Sleep(10)
	EndIf
WEnd