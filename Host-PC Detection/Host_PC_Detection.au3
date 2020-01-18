#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)

Global $ExitID

_Main()

Func _Main()
	Local $font, $reboot_Test, $Furmark_Test, $HDD_Test, $Battery_Test, $HDD_Result_file, $HDD_Result, $Reboot_Result_file, $Reboot_Result, $Battery_Result_file, $Battery_Result, $Furmark_Result_file, $Furmark_Result
	
	$font="Comic Sans MS"
	GUICreate("Host_PC_Detection", 600, 400)
	
	;UI
	GUICtrlCreateLabel("测试主机性能检测程式", 100,20,800,100)
	GUICtrlSetFont(-1, 25, 600, "", "Tahoma")
	
	;GUICtrlCreateLabel("测试项目", 100,120,150,60)
	;GUICtrlSetFont(-1, 20, 600, "", $font)
	
	;GUICtrlCreateLabel("测试结果", 320,120,150,60)
	;GUICtrlSetFont(-1, 20, 600, "", $font)
	
	GUICtrlCreateLabel("HDD测试", 100,120,150,60)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("重启测试", 100,170,150,60)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("Furmark测试", 100,220,150,60)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("电池测试", 100,270,150,60)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	;$HDD_Test = GUICtrlCreateButton("HDD检测", 100, 120, 120, 60)
	;GUICtrlSetFont(-1, 10, 600, "", $font)
	
	;$reboot_Test = GUICtrlCreateButton("重启检测", 340, 120, 120, 60)
	;GUICtrlSetFont(-1, 10, 600, "", $font)
	
	;$Furmark_Test = GUICtrlCreateButton("Furmark检测", 580, 120, 120, 60)
	;GUICtrlSetFont(-1, 10, 600, "", $font)
	
	
	
	;------------------------------------------------------------------------------------------------------
	;HDD_Test
	RunWait("\Host_PC_Detection\HDTunePro\HDTUNETEST.BAT","",@SW_HIDE)
	
	;Readfile HDD_Test_Result.txt
	$HDD_Result_file = FileOpen("\Host_PC_Detection\HDTunePro\HDD_Test_Result.txt", 0)

	If $HDD_Result_file = -1 Then
		MsgBox(0, "错误", "不能打开文件.")
		Exit
	EndIf

	$HDD_Result = FileReadLine($HDD_Result_file)
	
	FileClose($HDD_Result_file)
	
	;Change the button color
	If $HDD_Result="OK " Then 
		$HDD_Test = GUICtrlCreateButton($HDD_Result, 320, 120, 100, 30)
		GUICtrlSetBkColor(-1,0X0000ff00)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	Else
		$HDD_Test = GUICtrlCreateButton($HDD_Result, 320, 120, 100, 30)
		GUICtrlSetBkColor(-1,0X00ff0000)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	EndIf

	;-------------------------------------------------------------------------------------------------------
	;Readfile Reboot_Test_Result.txt
	$Reboot_Result_file = FileOpen("\Host_PC_Detection\Reboot\Reboot_Test_Result.txt", 0)

	If $Reboot_Result_file = -1 Then
		MsgBox(0, "错误", "不能打开文件.")
		Exit
	EndIf

	$Reboot_Result = FileReadLine($Reboot_Result_file)
	
	FileClose($Reboot_Result_file)
	
	;Change the button color
	If $Reboot_Result="OK " Then 
		$Reboot_Test = GUICtrlCreateButton($Reboot_Result, 320, 170, 100, 30)
		GUICtrlSetBkColor(-1,0X0000ff00)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	Else
		$Reboot_Test = GUICtrlCreateButton($Reboot_Result, 320, 170, 100, 30)
		GUICtrlSetBkColor(-1,0X00ff0000)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	EndIf
	
	;-------------------------------------------------------------------------------------------------------
	;Furmark_Test
	Runwait("\Host_PC_Detection\Furmark\VGAMARK.BAT","",@SW_HIDE)
	
	;Readfile Furmark_Test_Result.txt
	$Furmark_Result_file = FileOpen("\Host_PC_Detection\Furmark\Furmark_Test_Result.txt", 0)

	If $Furmark_Result_file = -1 Then
		MsgBox(0, "错误", "不能打开文件.")
		Exit
	EndIf

	$Furmark_Result = FileReadLine($Furmark_Result_file)
	
	FileClose($Furmark_Result_file)
	
	;Change the button color
	If $Furmark_Result="OK " Then 
		$Furmark_Test = GUICtrlCreateButton($Furmark_Result, 320, 220, 100, 30)
		GUICtrlSetBkColor(-1,0X0000ff00)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	Else
		$Furmark_Test = GUICtrlCreateButton($Furmark_Result, 320, 220, 100, 30)
		GUICtrlSetBkColor(-1,0X00ff0000)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	EndIf
	
	;-------------------------------------------------------------------------------------------------------
	;Battery_Test
	RunWait("\Host_PC_Detection\Battery\AC_DC_Detect.bat","",@SW_HIDE)
	
	;Readfile Battery_Test_Result.txt
	$Battery_Result_file = FileOpen("\Host_PC_Detection\Battery\Battery_Test_Result.txt", 0)

	If $Battery_Result_file = -1 Then
		MsgBox(0, "错误", "不能打开文件.")
		Exit
	EndIf

	$Battery_Result = FileReadLine($Battery_Result_file)
	
	FileClose($Battery_Result_file)
	
	;Change the button color
	If $Battery_Result="OK " Then 
		$Battery_Test = GUICtrlCreateButton($Battery_Result, 320, 270, 100, 30)
		GUICtrlSetBkColor(-1,0X0000ff00)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	Else
		$Battery_Test = GUICtrlCreateButton($Battery_Result, 320, 270, 100, 30)
		GUICtrlSetBkColor(-1,0X00ff0000)
		GUICtrlSetFont(-1, 10, 600, "", $font)
	EndIf
	;--------------------------------------------------------------------------------------------------------
	
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")
	GUISetState()
	While 1
		Sleep(1000)
	WEnd
EndFunc

Func OnExit()
	If @GUI_CtrlId = $ExitID Then
		MsgBox(0, "You clicked on", "Exit")
	Else
		MsgBox(0, "You clicked on", "Close")
	EndIf

	Exit
EndFunc   ;==>OnExit
