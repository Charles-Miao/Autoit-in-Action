; A simple custom messagebox that uses the OnEvent mode

#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)

Global $ExitID

_Main()

Func _Main()
	Local $CountinueID, $CancelID, $font, $VT306_DP1, $VT306_DP2, $QP200_THD_DP1, $QP200_THD_DP2, $QP200_GA_DP1, $QA100_DP1

	$font="Comic Sans MS"
	GUICreate("Restore Acoustic Image", 800, 600)
	
	GUICtrlCreateLabel("P5 Acoustic�Զ���ԭ��ʽ", 240,20,800,100)
	GUICtrlSetFont(-1, 25, 600, "", "Tahoma")
	
	GUICtrlCreateLabel("���Զ���ԭ��������:", 21,80,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	;VT306
	GUICtrlCreateLabel("VT306", 21,120,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�1���:", 190,120,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�2���:", 420,120,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	
	$VT306_DP1 = GUICtrlCreateButton("VT306-1", 300, 120)
	
	
	$VT306_DP2 = GUICtrlCreateButton("VT306-2", 530, 120)
	
	
	;QP200 THD
	GUICtrlCreateLabel("QP200 THD", 21,160,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�1���:", 190,160,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�2���:", 420,160,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	$QP200_THD_DP1 = GUICtrlCreateButton("QP200 THD-1", 300, 160)
	
	
	$QP200_THD_DP2 = GUICtrlCreateButton("QP200 THD-2", 530, 160)
	
	;QP200 GA
	GUICtrlCreateLabel("QP200 GA", 21,200,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�1���:", 190,200,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	$QP200_GA_DP1 = GUICtrlCreateButton("QP200 GA-1", 300, 200)
	
	;QA100
	GUICtrlCreateLabel("QA100", 21,240,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	GUICtrlCreateLabel("�ξ�1���:", 190,240,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	$QA100_DP1 = GUICtrlCreateButton("QA100-1", 300, 240)
	
	



	;restore image
	GUICtrlCreateLabel("���½������Զ���ԭ�׶�, ϵͳ���Ͻ������. ����, �Ƿ����?"  & @CRLF & "��ȷ��, �밴��ȷ�ϡ���ť; ����ȷ��, �밴��ȡ������ť.", 21,320, 700, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)

	$CountinueID = GUICtrlCreateButton("ȷ��", 150, 410, 210, 60)
	GUICtrlSetOnEvent($CountinueID, "OnCountinue")
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	$CancelID = GUICtrlCreateButton("ȡ��", 450, 410, 210, 60)
	GUICtrlSetOnEvent($CancelID, "OnExit")
	GUICtrlSetFont(-1, 15, 600, "", $font)
	

	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")

	GUISetState()  ; display the GUI
	
	;display button color
	If $CmdLine[1] = 1 Then
		$QA100_DP1 = GUICtrlCreateButton("VT306-1", 300, 120)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf
	
	If $CmdLine[1] = 2 Then
		$QA100_DP1 = GUICtrlCreateButton("VT306-2", 530, 120)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf
	
	If $CmdLine[1] = 3 Then
		$QA100_DP1 = GUICtrlCreateButton("QP200 GA-1", 300, 200)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf
	
	If $CmdLine[1] = 4 Then
		$QA100_DP1 = GUICtrlCreateButton("QA100-1", 300, 240)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf

	If $CmdLine[1] = 5 Then
		$QA100_DP1 = GUICtrlCreateButton("QP200 THD-1", 300, 160)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf

	If $CmdLine[1] = 6 Then
		$QA100_DP1 = GUICtrlCreateButton("QP200 THD-2", 530, 160)
		GUICtrlSetBkColor(-1,0X0000ff00)
	EndIf



	While 1
		Sleep(1000)
	WEnd
EndFunc   ;==>_Main

;--------------- Functions ---------------
Func OnCountinue()
	Run(@ComSpec & " /c " & "table.bat ")
    Exit
EndFunc   ;==>OnCountinue

Func OnNo()
	MsgBox(0, "You clicked on", "No")
EndFunc   ;==>OnNo

Func OnExit()
	If @GUI_CtrlId = $ExitID Then
		MsgBox(0, "You clicked on", "Exit")
	Else
		MsgBox(0, "You clicked on", "Close")
	EndIf

	Exit
EndFunc   ;==>OnExit
