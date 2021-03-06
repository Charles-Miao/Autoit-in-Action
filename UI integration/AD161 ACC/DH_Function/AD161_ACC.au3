#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
Opt('MustDeclareVars', 1)
Global Const $IniName  = "AD161_ACC.ini"
Global Const $Ver      = " (Ver 1.0  2014-08-07)"
Global $WinInfo, $Logpath,$SFCSSTAGE,$IniModel
Global $ToSfcs, $ToTest, $Stage,$CheckSNNum,$SFCSModel
Global $GuiWinIns, $GuiWinTxt, $GuiWinBtn, $GuiWinInf, $GuiWinStation, $Station, $INIStation, $Destination
Global Const $ErrFlag   = 0 + 16 + 0 + 4096 + 262144
Global $TempStr,$SnStr,$DSN

Global $StatusFlag
_Main()
Func _Main()
	;Step 1
	Local  $IniPath  = @ScriptDir & "\" & $IniName          ;INI file path
	If Not ReadINI($IniPath) Then
		Exit
	EndIf	
	CreateWindow()
	$StatusFlag = 1
	ShowInfo("等待機台")
	While True
		Switch $StatusFlag
		Case 1               ;Step 3
			If Not FileExists($Destination) Then
				;ShowInfo("等待機台 ....")
			Else				
				if 	FileExists($Destination) then 
					$StatusFlag = 2
					EnableWindow()
					ShowInfo("請入 SN...")
				EndIf
			EndIf
			Sleep(100)
		Case 2               ;Step 4
			WinActivate($WinInfo & $Ver, "SN")
			if Not FileExists($Destination) then 
				GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
				GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
				$StatusFlag = 1
				ShowInfo("等待機台 ....")
			EndIf	
			Sleep(100)
		Case 3               ;Step 5								
			If WaitSFCS_RA()=1 Then				
				Local $Result = RecvAAA()	
				FileDelete($ToTest & "\" & $SnStr & ".AAA")				
				RunWait(@ComSpec & " /c TestUpdate.bat","", @SW_MAXIMIZE)
				If $Result == "OK" Then		
					If $SFCSSTAGE=="DH" or $SFCSSTAGE==$STAGE Or $SFCSSTAGE=="IN" then 
						if StringInStr($SFCSModel,$IniModel) <>0 then 	
							$StatusFlag = 4	
						Else
							ShowNG("當前Model非ACC"&@CRLF&$SFCSModel)
							_CheckPath()					
							$StatusFlag = 1	
							ShowInfo("等待機台 ....")
						EndIf					
					Else
						ShowNG("站別不正確"&@CRLF&"SFCS站別:"&$SFCSStage)
						_CheckPath()					
						$StatusFlag = 1	
						ShowInfo("等待機台 ....")
					endif
				Else
					ShowNG("SFCS結果:"&$Result)
					_CheckPath()
					$StatusFlag = 1	
					ShowInfo("等待機台 ....")
				EndIf
			Else	
				_CheckPath()			
				$StatusFlag = 1
				ShowInfo("等待機台 ....")
			EndIf
			Sleep(500)
		Case 4               ;Step 5					
			ShowInfo("正在傳送 BBB 文件...")		
			If SendBBB() Then
				GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
				GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
				ShowInfo("等待 CCC 文件...")
				If WaitSFCS() Then
					Local $Result = RecvCCC()
					If $Result == "OK" Then
						ShowOK()
						GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
						GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
						_CheckPath()
						$StatusFlag = 1	
						ShowInfo("等待機台 ....")
					Else
						ShowNG($Result)
						GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
						GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
						_CheckPath()
						$StatusFlag = 1	
						ShowInfo("等待機台 ....")
					EndIf
					$StatusFlag = 1
					ShowInfo("等待機台 ....")
				EndIf
				Sleep(500)					
				$StatusFlag = 1
			Else
				ShowInfo("傳送 BBB 文件失敗!")
				EnableWindow()
			EndIf					
		Case Else            ;On error
				MsgBox($ErrFlag, "ERROR", "Unknown error! Reset the program...")
				$StatusFlag = 1
				ShowInfo("等待機台 ....")
				Sleep(500)
			EndSwitch
	WEnd
EndFunc

Func ReadINI($IniPath)
	If Not FileExists($IniPath) Then
		$TempStr = "Can not find INI file: " & $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	$Logpath = IniRead($IniPath, "CONFIG", "LOGFILE", "H")
	If $LogPath == "" Then
		$TempStr = "Can not find LOGFILE1 key in INI file: " & $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	$WinInfo = IniRead($IniPath, "CONFIG", "INFO", "")
	$INIStation = IniRead($IniPath, "CONFIG", "Station", "")
	$Destination = $Logpath	
	$Destination = StringLeft($Destination,1)&":\Parameters"
	ConsoleWrite($Destination&@CRLF)
	$IniModel=IniRead($IniPath, "CONFIG", "Model", "ACC")
	If $INIStation == "" Then
		$TempStr = "Can not find Station key in INI file: " & $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	
	$ToSfcs = IniRead($IniPath, "SFCS", "TOSFCS", "")
	If $ToSfcs == "" Or Not FileExists($ToSfcs) Then
		$TempStr = "TOSFCS key is wrong in INI file: " &@CRLF& $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	
	$ToTest = IniRead($IniPath, "SFCS", "TOTEST", "")
	If $ToTest == "" Or Not FileExists($ToTest) Then
		$TempStr = "TOTEST key is wrong in INI file: " &@CRLF& $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	
	$Stage = IniRead($IniPath, "SFCS", "STAGE", "")
	If $Stage == "" Then
		$TempStr = "Can not find STAGE key in INI file: " &@CRLF& $IniPath
		MsgBox($ErrFlag, "ERROR", $TempStr)
		Return False
	EndIf
	
	Return True
EndFunc

Func CreateWindow()
	Local Const $GuiWinWidth     = 460                       ;GUI window size
	Local Const $GuiWinHeight    = 300
	
	Local Const $GuiLable_X      = 20                        ;GUI lable position
	Local Const $GuiLable_Y      = 19
	Local Const $GuiLableWidth   = 103                        ;GUI label size
	Local Const $GuiLableHeight  = 41
	
	Local Const $GuiText_X       = 80                        ;GUI edit position
	Local Const $GuiText_Y       = 20
	Local Const $GuiTextWidth    = 280                       ;GUI edit size
	Local Const $GuiTextHeight   = 30
	
	Local Const $GuiButton_X     = 370                       ;GUI button position
	Local Const $GuiButton_Y     = 20
	Local Const $GuiButtonWidth  = 70                        ;GUI button size
	Local Const $GuiButtonHeight = 24
	
	Local Const $GuiInfo_X       = 20                        ;GUI information position
	Local Const $GuiInfo_Y       = 120
	Local Const $GuiInfoWidth    = 420                       ;GUI information size
	Local Const $GuiInfoHeight   = 150
	
	$GuiWinIns = GUICreate($WinInfo & $Ver, $GuiWinWidth, $GuiWinHeight, @DesktopWidth - $GuiWinWidth - 8, 1, -1, BitOR($WS_EX_APPWINDOW, $WS_EX_TOPMOST))
	GUICtrlCreateLabel("SN:", $GuiLable_X, $GuiLable_Y, $GuiLableWidth, $GuiLableHeight)
	GUICtrlSetFont(-1, 18, 800, 0, "Arial")
	$GuiWinTxt = GUICtrlCreateEdit("", $GuiText_X, $GuiText_Y, $GuiTextWidth, $GuiTextHeight, BitOR($ES_AUTOHSCROLL, $ES_UPPERCASE))
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	GUICtrlSetLimit($GuiWinTxt,15)
	$GuiWinBtn = GUICtrlCreateButton("Start", $GuiButton_X, $GuiButton_Y, $GuiButtonWidth, $GuiButtonHeight, BitOR($BS_CENTER, $BS_DEFPUSHBUTTON, $BS_VCENTER))
	GUICtrlSetFont(-1, 10, 800, 0, "Arial")
	$GuiWinInf = GUICtrlCreateEdit("", $GuiInfo_X, $GuiInfo_Y, $GuiInfoWidth, $GuiInfoHeight, BitOR(0, $ES_READONLY))
	
	$GuiWinStation = GUICtrlCreateLabel("Station:", 20, 60, 103, 41)
    GUICtrlSetFont(-1, 18, 800, 0, "Arial Narrow")
    $Station = GUICtrlCreateLabel($INIStation, 110, 62, 181, 35)
    GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	GUICtrlCreateLabel($Stage, 250, 62, 39, 35)
	GUICtrlSetFont(-1, 18, 400, 0, "Arial")
	GUICtrlSetColor(-1, 0xFF0000)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUISetOnEvent($GUI_EVENT_CLOSE, "MsgOnExit")
	GUICtrlSetOnEvent($GuiWinBtn, "MsgOnButton")
	
	Opt("GUIOnEventMode", 1)
	Opt("GUICloseOnESC", 0)
	
	GUISetState(@SW_SHOW, $GuiWinIns)
	
	GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
	GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
	
EndFunc

Func EnableWindow()
	GUISetState(@SW_SHOW, $GuiWinIns)
	GUICtrlSetState($GuiWinBtn, $GUI_ENABLE)
	GUICtrlSetState($GuiWinTxt, $GUI_ENABLE)
	GUICtrlSetData($GuiWinTxt, "")
	GUICtrlSetState($GuiWinTxt, $GUI_FOCUS)
EndFunc

Func WaitSFCS_RA()	
	while 1
		If FileExists($ToTest & "\" & $SnStr & ".AAA") Then			
			Return True
		EndIf
		Sleep(500)
	WEnd
EndFunc

Func WaitSFCS()
	While 1
	If FileExists($ToTest & "\" & $SnStr & ".CCC") Then
		Return True
	EndIf
	Sleep(500)
	WEnd
EndFunc

Func SendRRR()
	if FileExists($ToTest & "\" & $SnStr & ".AAA") then FileDelete($ToTest & "\" & $SnStr & ".AAA")
	Local $objFile, $strFile	
	$objFile = FileOpen($ToSfcs & "\" & $SnStr & ".RR_", 2)
	If $objFile = -1 Then Return False
	$strFile = "[SFC]" & @CRLF & "SN=" & $SnStr 
	FileWrite($objFile, $strFile)	
	FileClose($objFile)
	Sleep(500)
	If FileMove($ToSfcs & "\" & $SnStr & ".RR_", $ToSfcs & "\" & $SnStr & ".RRR", 1) Then	Return True
	Return False
EndFunc

Func RecvAAA()
	while 1
		$SFCSSTAGE = IniRead($ToTest & "\" & $SnStr & ".AAA", "SFC", "STAGE", "")
		Local $Result = IniRead($ToTest & "\" & $SnStr & ".AAA", "SFC", "RESULT", "")
		$SFCSModel = IniRead($ToTest & "\" & $SnStr & ".AAA", "SFC", "MODEL", "")
		Sleep(500)	
		if $Result<>"" Or $SFCSModel<>"" then Return $Result
	WEnd
EndFunc

Func SendBBB()
	if FileExists($ToTest & "\" & $SnStr & ".CCC") then FileDelete($ToTest & "\" & $SnStr & ".CCC")
	Local $objFile, $strFile	
	$objFile = FileOpen($ToSfcs & "\" & $SnStr & ".BB_", 2)
	If $objFile = -1 Then Return False
	$strFile = "[SFC]" & @CRLF & "SN=" & $SnStr & @CRLF & "STAGE=" & $Stage & @CRLF & "TIME=" & @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & @CRLF & "RESULT=OK"
	FileWrite($objFile, $strFile)
	FileClose($objFile)
	Sleep(500)
	If FileMove($ToSfcs & "\" & $SnStr & ".BB_", $ToSfcs & "\" & $SnStr & ".BBB", 1) Then Return True
	Return False
EndFunc

Func RecvCCC()
	While 1
		Local $Result = IniRead($ToTest & "\" & $SnStr & ".CCC", "SFC", "RESULT", "")
		Sleep(500)
		If $Result<>"" then ExitLoop
	WEnd
	FileDelete($ToTest & "\" & $SnStr & ".CCC")
	Return $Result
EndFunc

Func ShowOK()
	GUICtrlSetColor($GuiWinInf, 0x000000)
	GUICtrlSetBkColor($GuiWinInf, 0x00ff00)
	GUICtrlSetFont($GuiWinInf, 64)
	GUICtrlSetData($GuiWinInf, "PASS")
EndFunc

Func ShowNG($ErrStr)
	GUICtrlSetColor($GuiWinInf, 0x000000)
	GUICtrlSetBkColor($GuiWinInf, 0xff0000)
	GUICtrlSetFont($GuiWinInf, 16)
	GUICtrlSetData($GuiWinInf, "ERROR: " & $ErrStr)
EndFunc

Func ShowInfo($InfoStr)
	GUICtrlSetColor($GuiWinInf, 0x000000)
	GUICtrlSetBkColor($GuiWinInf, 0xffffff)
	GUICtrlSetFont($GuiWinInf, 16)
	GUICtrlSetData($GuiWinInf, $InfoStr)
EndFunc

; ========= GUI function ==========

Func MsgOnExit()
	Exit
EndFunc

Func MsgOnButton()	
	$SnStr = GUICtrlRead($GuiWinTxt)
	If $SnStr <> "" And StringIsASCII($SnStr) Then
		ShowInfo("正在傳送 RRR 文件...")		
		If SendRRR() Then
			GUICtrlSetState($GuiWinBtn, $GUI_DISABLE)
			GUICtrlSetState($GuiWinTxt, $GUI_DISABLE)
			ShowInfo("等待 AAA 文件...")
			$StatusFlag = 3
		Else
			ShowInfo("傳送 RRR 文件失敗!")
			EnableWindow()
		EndIf	
	Else
		EnableWindow()
		ShowInfo("SN錯誤，請再次輸入SN...")
	EndIf	
EndFunc

Func _CheckPath()
	While 1
		If FileExists($Destination) Then
			Sleep(100)
		Else
			GUICtrlSetData($GuiWinTxt, "")
			ExitLoop
		EndIf
	WEnd
EndFunc						