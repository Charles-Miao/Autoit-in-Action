#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $WinTitle = "[Class:ThunderRT6FormDC]"
Global $USEID = "KTESTERS"
Global $WinCtrlID = "ThunderRT6TextBox24"
Global $WinCtrlsn = "ThunderRT6TextBox23"
Global $SN = $CmdLine[1]

$DF=WinExists($WinTitle)
If $DF Then
	WinActivate($WinTitle)
	ControlSetText($WinTitle, "", $WinCtrlID,$USEID);填寫工號, 8位
	WinActivate($WinTitle)
	ControlClick($WinTitle, "", $WinCtrlID)
	send("{ENTER}")	;敲回車
	ControlSetText($WinTitle, "", $WinCtrlSN, $SN);填寫SN, 15位
	WinActivate($WinTitle)
	ControlClick($WinTitle, "", $WinCtrlSN)
	send("{ENTER}")	;敲回車						
Endif