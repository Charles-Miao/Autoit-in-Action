Global $Multimeter_dll_handle = -1

Func Multimeter_LoadDll()
	If $Multimeter_dll_handle <> -1 Then
		DllClose($Multimeter_dll_handle)
		$Multimeter_dll_handle = -1
	EndIf
	$Multimeter_dll_handle = DllOpen("Multimeter.dll")
	If $Multimeter_dll_handle = -1 Then
		Return False
	Else
		Return True
	EndIf
EndFunc

Func Multimeter_UnloadDll()
	If $Multimeter_dll_handle <> -1 Then
		DllClose($Multimeter_dll_handle)
		$Multimeter_dll_handle = -1
	EndIf
EndFunc

Func Multimeter_InitPort($sPort)
	Local $result = DllCall($Multimeter_dll_handle, "ptr", "_InitPort@4", "str", $sPort)
	Return $result[0]
EndFunc

Func Multimeter_ClosePort($hPort)
	Local $result = DllCall($Multimeter_dll_handle, "none", "_ClosePort@4", "ptr", $hPort)
	Return $result[0]
EndFunc

Func Multimeter_GetData($hPort)
	Local $buf=DllStructCreate("char buf[4096]")
	Local $result = DllCall($Multimeter_dll_handle, "BOOL", "_ReadPort@12", "ptr", $hPort, "ptr", DllStructGetPtr($buf), "UINT", DllStructGetSize($buf))
	If Not $result[0] Then
		$buf = 0
		Return ""
	Else
		Local $str = DllStructGetData($buf, 1)
		$buf = 0
		Return $str
	EndIf
EndFunc