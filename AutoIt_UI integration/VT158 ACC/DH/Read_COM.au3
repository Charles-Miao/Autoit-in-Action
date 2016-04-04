#Include <File.au3>
#Include <String.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ScreenCapture.au3>

Dim $ComPort				;-- Modem COM Port number
Local $COM_File

$ComPort=GetModemComPort("\Device\ProlificSerial0")
If $ComPort <> -1 Then
	$COM_File = FileOpen("Read_COM.txt",2)
	FileWrite($COM_File,"COM"&$ComPort)
	FileClose($COM_File)
Else
	$COM_File = FileOpen("Read_COM.txt",2)
	FileWrite($COM_File,"NA")
	FileClose($COM_File)
EndIf

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