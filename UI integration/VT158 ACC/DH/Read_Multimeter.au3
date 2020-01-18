#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#include "Multimeter.au3"

Opt("TrayIconHide", 1)
Global $IniPort = $CmdLine[1]
Global $hPort = 0

Multimeter_LoadDll()
$hPort = Multimeter_InitPort("\\.\" & $IniPort)
Local $data=Multimeter_GetData($hPort)
If $data<>"" Then
	Local $M=StringSplit($data ," ")
	if $M[1]="DCV" And $M[0]=4 Then
		ConsoleWrite($M[3]*10)
	EndIf
EndIf
		
	
Multimeter_ClosePort($hPort)
Multimeter_UnloadDll()	
