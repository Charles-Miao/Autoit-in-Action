#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#Include <WinAPI.au3>
#include "CommMG.au3"
Opt('MustDeclareVars', 1)
Global $GuiWinIns, $GuiEdtSn, $GuiBtnOk, $GuiEdtDbg, $GuiEdtSta
Global $IniStage, $IniToSfcs, $IniToTest, $IniPort,$SendStage
Global $SfcStage, $SfcResult,$gsInfo,$sSN,$fFunc,$sErr,$IniPath
Global $Error = 0+16+0+4096+262144
;Global $SFCSIN="IN"
if not FileExists(@ScriptDir &"\log\") then
	DirCreate(@ScriptDir &"\log\")
EndIf
_Main()
Exit

Func _Main()
	If _InitFunc() Then
		_CreateWin()
		_DisableInput()
		_ShowInfo(@CRLF & "等待連接產品...")
		GUICtrlSetBkColor($GuiEdtSta, 0xffff00)
		$gsInfo = ""
		$fFunc = False
		While True
			_LoopFunc()
			Sleep(100)
		WEnd
	EndIf
EndFunc

Func _InitFunc()
	$IniPath = @ScriptDir & "\Config.ini"
	$IniStage = IniRead($IniPath, "SFCS", "STAGE", "DN")
	$IniToSfcs = IniRead($IniPath, "SFCS", "TOSFCS", "Z:\SFCS\TOSFCS")
	$IniToTest = IniRead($IniPath, "SFCS", "TOTEST", "Z:\SFCS\TOTEST")
	$IniPort = Number(IniRead($IniPath, "DEVICE", "ComPort", "-1"))
	;RunWait(@ComSpec & " /c " & "share.bat","", @SW_HIDE)
	If Not FileExists($IniToSfcs) Then
		MsgBox($Error, "錯誤", "TOSFCS:"& $IniToSfcs &"資料夾不存在!")
		Return False
	EndIf
	If Not FileExists($IniToTest) Then
		MsgBox($Error, "錯誤", "TOTEST:"& $IniToTest &"資料夾不存在!")
		Return False
	EndIf
	If $IniPort = -1 Then
		$IniPort = _AutoGetPort()
	EndIf
	If _CommSetPort($IniPort, $sErr, 115200, 8, 0, 1, 2) = 0 Then
		MsgBox($Error, "錯誤", "錯誤: Com Port Error")
		Return False
	EndIf
	Return True
EndFunc

Func _AutoGetPort()
	Local $arrPort = _CommListPorts(0)
	If Number($arrPort[0]) <> 1 Then
		Return -1
	EndIf
	
	Return Number(StringTrimLeft($arrPort[1], 3))
EndFunc

Func _CreateWin()
	$GuiWinIns = GUICreate("VT158 ACC Version: 0.2  TE/Chundong 2014-06-24", 605, 480, -1, -1, -1, BitOR($WS_EX_APPWINDOW, $WS_EX_TOPMOST))
	GUICtrlCreateLabel("SN序號:", 15, 20)
	$GuiEdtSn = GUICtrlCreateEdit("", 65, 17, 400, 22, BitOR($ES_AUTOHSCROLL, $ES_UPPERCASE))
	GUICtrlSetLimit($GuiEdtSN,15)
	$GuiBtnOk = GUICtrlCreateButton("啟動", 485, 16, 100, 25, BitOR($BS_CENTER, $BS_DEFPUSHBUTTON, $BS_VCENTER))
	GUICtrlCreateLabel("調試信息:", 15, 55)
	GUICtrlCreateLabel("當前站別:"& $IniStage, 455, 50,100,30,BitOR($SS_CENTER,$SS_NOPREFIX,$SS_CENTERIMAGE),$WS_EX_STATICEDGE)
	GUICtrlSetColor(-1,0x008000)
	GUICtrlSetBkColor(-1,0x00F00F)
	$GuiEdtDbg = GUICtrlCreateEdit("", 15, 90, 570, 200, BitOR($ES_AUTOVSCROLL, $ES_MULTILINE, $ES_READONLY, $WS_VSCROLL))
	GUICtrlCreateLabel("當前狀態:", 15, 290)
	$GuiEdtSta = GUICtrlCreateEdit("", 15, 310, 570, 150, BitOR($ES_AUTOVSCROLL, $ES_MULTILINE, $ES_READONLY, $ES_CENTER))
	GUISetOnEvent($GUI_EVENT_CLOSE, "_MsgOnExit")
	GUICtrlSetOnEvent($GuiBtnOk, "_MsgOnOk")
	Opt("GUIOnEventMode", 1)
	Opt("GUICloseOnESC", 0)
	GUISetState(@SW_SHOW, $GuiWinIns)
EndFunc

Func _EnableInput()
	GUICtrlSetState($GuiEdtSn, $GUI_ENABLE)
	GUICtrlSetState($GuiBtnOk, $GUI_ENABLE)
EndFunc

Func _DisableInput()
	GUICtrlSetState($GuiEdtSn, $GUI_DISABLE)
	GUICtrlSetState($GuiBtnOk, $GUI_DISABLE)
EndFunc

Func _ShowPass()
	Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
	If $filex = -1 Then
		MsgBox($Error, "Error", "Log File Can't Open")
		Exit
	EndIf
	FileWrite($filex,$sSN &";" & ";" &  ";" & @HOUR&":"& @MIN &";PASS"&@CRLF)
	FileClose($filex)
	GUICtrlSetFont($GuiEdtSta, 86)
	GUICtrlSetBkColor($GuiEdtSta, 0x00ff00)
	GUICtrlSetData($GuiEdtSta, "PASS")
	GUICtrlSetData($GuiEdtDbg, @CRLF &$sSN  &"	  OK" &  @CRLF &"請取下ACC,流向下一站")
	GUICtrlSetFont($GuiEdtDbg,29)
	$fFunc = False
EndFunc

Func _ShowFail($sInfo)
	Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
	If $filex = -1 Then
		MsgBox($Error, "Error", "Log File Can't Open")
		Exit
	EndIf
	FileWrite($filex,$sSN &";" & @HOUR&":"& @MIN &";Fail"&@CRLF)
	FileClose($filex)
	
	GUICtrlSetFont($GuiEdtSta, 32)
	GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
	GUICtrlSetData($GuiEdtSta, "FAIL" & @CRLF & $sInfo)
	GUICtrlSetData($GuiEdtDbg, @CRLF  & $sSN &"	Fail" & @CRLF &"請重新放入ACC,重新測試")
	GUICtrlSetFont($GuiEdtDbg,29)
	$fFunc = False
EndFunc

Func _ShowInfo($sInfo)
	GUICtrlSetFont($GuiEdtSta, 32)
	GUICtrlSetBkColor($GuiEdtSta, 0xffffff)
	GUICtrlSetData($GuiEdtSta, $sInfo)
EndFunc

Func _LoopFunc()

	Local $sTmp
	Local $arrFile
	Local $sFileList	
	If not $fFunc Then
		$sTmp = _CommGetString()
		If $sTmp <> "" Then
			$gsInfo &= $sTmp
			If StringInStr($gsInfo, "AT") <> 0 Then
				_EnableInput()
				_ShowInfo(@CRLF & "請輸入產品條碼...")
				GUICtrlSetFont($GuiEdtDbg,9)
				GUICtrlSetBkColor($GuiEdtSta, 0xffff00)
				$gsInfo = ""
				GUICtrlSetData($GuiEdtSn, "")
				GUICtrlSetState($GuiEdtSn, $GUI_FOCUS)
			EndIf
			GUICtrlSetData($GuiEdtDbg, $gsInfo)
		EndIf
	Else
		_ShowInfo(@CRLF & "正在連接SFCS進行檢查...")
		GUICtrlSetBkColor($GuiEdtSta, 0xffff00)
		If Not _SendRRR() Then
			_ShowFail("服務器連接失敗!")
			Return
		EndIf
		If Not _RecvAAA() Then			
			GUICtrlSetFont($GuiEdtSta, 32)
			GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
			GUICtrlSetData($GuiEdtSta, @CRLF & "Fail")
			GUICtrlSetData($GuiEdtDbg, @CRLF & $sSN & "	Fail" & @CRLF & "網絡超時A請檢查網絡是否連通" & @CRLF &"請重新放入ACC,重新測試")
			GUICtrlSetFont($GuiEdtDbg,29)
			$fFunc = False
			Return
		EndIf
		If $SfcResult <> "OK" Then
			_ShowFail("Result=" & $SfcResult)
			Return
		EndIf
		;if $SfcStage<>$SFCSIN and $SfcStage<>$IniStage Then
		if $SfcStage<>$IniStage Then
			GUICtrlSetFont($GuiEdtSta, 32)
			GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
			GUICtrlSetData($GuiEdtSta, "站別不正確," &  @CRLF & "當前機台站別為:" & $SfcStage)
			GUICtrlSetData($GuiEdtDbg, @CRLF  & $sSN & "	Fail" & @CRLF  &"請取下ACC,請測試下一台")
			GUICtrlSetFont($GuiEdtDbg,29)
			$fFunc = False
			Return
		EndIf
		#cs
		If $SfcStage=$SFCSIN  Then
			$SendStage=$SFCSIN
			If $SfcStage <> $SFCSIN Then
					GUICtrlSetFont($GuiEdtSta, 32)
					GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
					GUICtrlSetData($GuiEdtSta, "前總檢站別不正確," &  @CRLF & "當前機台站別為:" & $SfcStage)
					GUICtrlSetData($GuiEdtDbg, @CRLF  & $sSN & "	Fail" & @CRLF  &"請取下ACC,請測試下一台")
					GUICtrlSetFont($GuiEdtDbg,29)
					$fFunC = False
				Return
			EndIf
				_ShowInfo("前總檢"&$SFCSIN &@CRLF & "前總檢連接SFCS進行確認..."&@CRLF&"CCC")
				GUICtrlSetBkColor($GuiEdtSta, 0xffff00)
			If Not _SendBBB() Then
				_ShowFail("前總檢"&$SFCSIN &"服務器連接失敗!")
				Return
			EndIf
			If Not _RecvCCC() Then
				GUICtrlSetFont($GuiEdtSta, 32)
				GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
				GUICtrlSetData($GuiEdtSta, @CRLF & "Fail")
				GUICtrlSetData($GuiEdtDbg, @CRLF & $sSN & "	Fail" & @CRLF & "網絡超時C請檢查網絡是否連通" & @CRLF &"請重新放入ACC,重新測試"&$SFCSIN )
				GUICtrlSetFont($GuiEdtDbg,29)
				Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
				If $filex = -1 Then
					MsgBox($Error, "Error", "Log File Can't Open")
					Exit
				EndIf
				FileWrite($filex,$sSN &";" & @HOUR&":"& @MIN &";網絡超時"&@CRLF)
				FileClose($filex)
				$fFunc = False
				Return
			EndIf
			If $SfcResult <> "OK" Then
				_ShowFail("前總檢過站NG"&@CRLF&"Result=" & $SfcResult)
				Return
			EndIf
			If $SfcStage <> $SFCSIN Then
				GUICtrlSetFont($GuiEdtSta, 32)
				GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
				GUICtrlSetData($GuiEdtSta, "Fail"&@CRLF&"前總檢站別:IN" & @CRLF &"過站后站別:" & $SfcStage)
				GUICtrlSetData($GuiEdtDbg, @CRLF & $sSN  & "	Fail " & @CRLF &"請檢查是否手動刷過站,禁止手動過站")
				GUICtrlSetFont($GuiEdtDbg,29)
				Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
				If $filex = -1 Then
					MsgBox($Error, "Error", "Log File Can't Open")
					Exit
				EndIf
				FileWrite($filex,$sSN &";" & @HOUR&":"& @MIN &";Stage Error!"&@CRLF)
				FileClose($filex)
				$fFunc = False
				Return
			EndIf			
			Return
		EndIf;
		#CE
		$SendStage=$IniStage
		if $SfcStage=$IniStage Then
				;Global $SFCSIN="IN"
			If $SfcStage <> $IniStage Then
				GUICtrlSetFont($GuiEdtSta, 32)
				GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
				GUICtrlSetData($GuiEdtSta, "站別不正確," &  @CRLF & "當前機台站別為:" & $SfcStage)
				GUICtrlSetData($GuiEdtDbg, @CRLF  & $sSN & "	Fail" & @CRLF  &"請取下ACC,請測試下一台")
				GUICtrlSetFont($GuiEdtDbg,29)
				$fFunC = False
				Return
			EndIf
			_ShowInfo("Test:"&$IniStage&@CRLF & "Test連接SFCS進行確認..."&@CRLF&"CCC")
			GUICtrlSetBkColor($GuiEdtSta, 0xffff00)
			If Not _SendBBB() Then
				_ShowFail("服務器連接失敗!")
				Return
			EndIf
			If Not _RecvCCC() Then
				GUICtrlSetFont($GuiEdtSta, 32)
				GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
				GUICtrlSetData($GuiEdtSta, @CRLF & "Fail")
				GUICtrlSetData($GuiEdtDbg, @CRLF & $sSN & "	Fail" & @CRLF & "網絡超時C請檢查網絡是否連通" & @CRLF &"請重新放入ACC,重新測試")
				GUICtrlSetFont($GuiEdtDbg,29)
				Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
				If $filex = -1 Then
					MsgBox($Error, "Error", "Log File Can't Open")
					Exit
				EndIf
				FileWrite($filex,$sSN &";" & @HOUR&":"& @MIN &";網絡超時"&@CRLF)
				FileClose($filex)
				$fFunc = False
				Return
			EndIf
			If $SfcResult <> "OK" Then
				_ShowFail("Test過站NG"&"Result=" & $SfcResult)
				Return
			EndIf
			If $SfcStage <> $IniStage Then
				GUICtrlSetFont($GuiEdtSta, 32)
				GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
				GUICtrlSetData($GuiEdtSta, "Fail"&@CRLF&"Test前站別:"& $IniStage & @CRLF &"過站后站別:" & $SfcStage)
				GUICtrlSetData($GuiEdtDbg, @CRLF & $sSN  & "	Fail " & @CRLF &"請檢查是否手動刷過站,禁止手動過站")
				GUICtrlSetFont($GuiEdtDbg,29)
				Local $filex=FileOpen("log\"& @YEAR & @MON &  @MDAY & ".txt",1)
				If $filex = -1 Then
					MsgBox($Error, "Error", "Log File Can't Open")
					Exit
				EndIf
				FileWrite($filex,$sSN &";" & @HOUR&":"& @MIN &";Stage Error!"&@CRLF)
				FileClose($filex)
				$fFunc = False
				Return
			EndIf			
			_ShowPass()
		EndIf
	Return
	EndIf
	
EndFunc

Func _MsgOnExit()
	_CommClosePort()
	Exit
EndFunc

Func _MsgOnOk()
	Local $iLen
	$sSN = GUICtrlRead($GuiEdtSn)
	$iLen = StringLen($sSN)
	GUICtrlSetData($GuiEdtDbg, "")
	If $iLen = 15 then 
		$fFunc = True
		_DisableInput()
	Else
		GUICtrlSetData($GuiEdtDbg, @CRLF & @CRLF &"SN序號長度錯誤,請重新輸入...")
		GUICtrlSetFont($GuiEdtDbg,29)
		_ShowInfo(@CRLF & "SN序號長度錯誤,請重新輸入...")
		GUICtrlSetBkColor($GuiEdtSta, 0xff0000)
		GUICtrlSetData($GuiEdtSn, "")
		GUICtrlSetState($GuiEdtSn, $GUI_FOCUS)
	EndIf
EndFunc

Func _SendRRR()
	Local $objFile, $strFile
	$objFile = FileOpen($IniToSfcs & "\" & $sSN & ".RR_", 2)
	If $objFile = -1 Then
		Return False
	EndIf
	$strFile = "[SFC]" & @CRLF & "SN=" & $sSN & @CRLF & "TIME=" & @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC &@CRLF
	FileWrite($objFile, $strFile)
	FileClose($objFile)
	Sleep(500)
	If FileMove($IniToSfcs & "\" & $sSN & ".RR_", $IniToSfcs & "\" & $sSN & ".RRR", 1) Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func _RecvAAA()
	Local $loop =0
	while True
		If FileExists($IniToTest & "\" & $sSN & ".AAA") Then
			ExitLoop
		Else
			$loop = $loop+1
			Sleep(1000)
			if $loop == 20 Then
				return False
				ExitLoop
			EndIf
		EndIf
	WEnd
	$SfcStage = IniRead($IniToTest & "\" & $sSN & ".AAA", "SFC", "STAGE", "")
	$SfcResult = IniRead($IniToTest & "\" & $sSN & ".AAA", "SFC", "RESULT", "")
	Sleep(500)
	FileDelete($IniToTest & "\" & $sSN & ".AAA")
	RunWait(@ComSpec & " /c " & "TestUpdate.bat","", @SW_MAXIMIZE)
	If $SfcStage == "" Or $SfcResult == ""  Then
		Return False
	Else
		Return True
	EndIf
EndFunc

Func _SendBBB()
    Local $objFile, $strFile
    $objFile = FileOpen($IniToSfcs & "\" & $sSN & ".BB_", 2)
    If $objFile = -1 Then
        Return False
    EndIf
    $strFile = "[SFC]" & @CRLF & "SN=" & $sSN & @CRLF & "STAGE=" & $SendStage & @CRLF & "TIME=" & @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & @CRLF & "RESULT=OK"&@CRLF
    FileWrite($objFile, $strFile)
    FileClose($objFile)
    Sleep(500)
    If FileMove($IniToSfcs & "\" & $sSN & ".BB_", $IniToSfcs & "\" & $sSN & ".BBB", 1) Then
        Return True
    Else
        Return False
    EndIf
EndFunc

Func _RecvCCC()
	Local $loop =0
	while True
		If FileExists($IniToTest & "\" & $sSN & ".CCC") Then
			ExitLoop
		Else
			$loop = $loop+1
			Sleep(1000)
			if $loop == 20 Then
				return False
				ExitLoop
			EndIf
		EndIf
	WEnd
	$SfcStage = IniRead($IniToTest & "\" & $sSN & ".CCC", "SFC", "STAGE", "")
	$SfcResult = IniRead($IniToTest & "\" & $sSN & ".CCC", "SFC", "RESULT", "")
	Sleep(500)
	FileDelete($IniToTest & "\" & $sSN & ".CCC")
	If $SfcResult == "" Then
		Return False
	Else
		Return True
	EndIf
EndFunc


