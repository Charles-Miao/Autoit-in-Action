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
	ControlSetText($WinTitle, "", $WinCtrlID,$USEID);��g�u��, 8��
	WinActivate($WinTitle)
	ControlClick($WinTitle, "", $WinCtrlID)
	send("{ENTER}")	;�V�^��
	ControlSetText($WinTitle, "", $WinCtrlSN, $SN);��gSN, 15��
	WinActivate($WinTitle)
	ControlClick($WinTitle, "", $WinCtrlSN)
	send("{ENTER}")	;�V�^��						
Endif