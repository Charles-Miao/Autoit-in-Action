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
Local $StrCheck=Multimeter_GetData($hPort)
ConsoleWrite($StrCheck&@CRLF)
	
Multimeter_ClosePort($hPort)
Multimeter_UnloadDll()	
