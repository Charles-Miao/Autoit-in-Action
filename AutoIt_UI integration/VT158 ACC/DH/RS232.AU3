#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Res_Comment=Display Out Auto Test
#AutoIt3Wrapper_Res_Fileversion=0.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Wistron
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Include <File.au3>
#Include <String.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include 'CommMG.au3'
#include <ScreenCapture.au3>


Global $ComErr				;-- The error Message of commg.dll function
Global $AtCmdErr=False		;-- The error flag of AT command
Dim $ComPort				;-- Modem COM Port number
HotKeySet("{space}","HK_STOP")

;-- get com port number
ConsoleWrite("INFO    Detecting TBox USB device...")
$ComPort=GetModemComPort("\Device\VCP")
If $ComPort <> -1 Then
	ConsoleWrite("OK (Port=" & $ComPort & ")" & @CRLF)
Else
	ConsoleWrite(@CRLF & "ERROR   Can't find TBox (errorlevel=1)" & @CRLF)
	Exit(1)
EndIf

;-- initial com port
ConsoleWrite("INFO    Initial TBox....")
_CommSetport($ComPort,$ComErr,9600,8,'none',1,1)

;-- check error heppen or not
If $ComErr <> "" Then
	ConsoleWrite( @CRLF & "ERROR   Initial TBox COM port fail (errorlevel=2)" & @CRLF)
	ConsoleWrite("[Error] ComErr=" & $ComErr & @CRLF)
	Exit(2)
EndIf
ConsoleWrite("OK" & @CRLF)

;-- create default GUI screen
GUICreate("Tbox",  1024, 768, @DesktopWidth, 0, 0x80880008)
GUISetBkColor(0xFFFFFF)
GUISetState(@SW_SHOW)

;-- send Tbox COM command then wait respone

		RS232Read()
;-- close TBox COM port conenction
	_CommCloseport()

;---------------------------------------------------------------------------------------------------
; Description:      Send test command to TBox then wait return command
; Syntax:           TBoxTest($Cmd)
; Paramenter:
;		$Cmd		Sned test command (1=CRT,2=HDMI,3=HDMI_AUDIO)
; Return Value
;		Success:    show pass
;       Failure:    Exit program and return errorlevel 3
;---------------------------------------------------------------------------------------------------
Func RS232Read()
	Local $i=0, $Result
;-- send command to TBox then wait TBox return the test result
	while $i=0
		_CommSendString('16540D')
		_CommSendByte('0X16540D')
		Sleep(10)
		$Result=_Commgetstring()
		if $Result <> "" Then 
		MsgBox("",$result,"",1)
        WinActivate("AIS Ver.2010 for Wistron   (Wang Feng)")
         sleep(100)
		 send("{enter}")	
		sleep(4500)
      DirCreate("d:\AISLOG"&@MON&@mday)
	_ScreenCapture_Capture ("d:\aislog"&@MON&@mday&"\"&@YEAR&@MON&@MDAY&@HOUR&@min&@SEC&".jpg")

		endif	
    WEnd
		
;-- check test result
	If $Result <> "" Then
		ConsoleWrite( "Pass" & @CRLF)
	Else
		ConsoleWrite( @CRLF & "ERROR   Can't receive TBox test result (errorlevel=3)" & @CRLF)
		Exit(3)
	EndIf
EndFunc ;TBoxTest
;---------------------------------------------------------------------------------------------------
; Description:      Get Modem COM port number via register table
; Syntax:           GetModemComPort($ModemName)
; Paramenter:
;		$ModemName	the the modem name's key word in modem com port register
; Return Value
;		Success:    ComPort number
;       Failure:    -1
;---------------------------------------------------------------------------------------------------
Func GetModemComPort($ModemName)
	Local $i, $RegName
	Local $KeyName="HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM"
	For $i= 1 to 10
		$RegName=RegEnumVal($KeyName,$i)
		If @error <> 0 then
			ExitLoop
		ElseIf StringInStr($RegName,$ModemName) <> 0 Then
			Return StringTrimLeft(RegRead($KeyName,$RegName), 3)
		EndIf
	Next
	Return -1
EndFunc

Func HK_STOP()
	exit(0)
EndFunc