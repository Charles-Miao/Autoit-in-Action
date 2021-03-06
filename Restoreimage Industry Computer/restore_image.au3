; A simple custom messagebox that uses the OnEvent mode

#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)

Global $ExitID

_Main()

Func _Main()
	Local $CountinueID, $font, $ACC_Dual_System, $AD268_XP, $QP200GA_Win7, $QP200WWAN_Win7, $VT208_VT306_XP, $VT306_Series_Win7

	$font="Comic Sans MS"
	GUICreate("Restore Image of Industrial Host", 800, 600)
	
	GUICtrlCreateLabel("P5 Industrial Host auto restore programs", 80,20,800,100)
	GUICtrlSetFont(-1, 25, 600, "", "Tahoma")
	
	GUICtrlCreateLabel("Can be auto restored model as below:", 50,100,800, 100)
	GUICtrlSetFont(-1, 15, 600, "", $font)
	
	;ACC Dual System
	
	$ACC_Dual_System = GUICtrlCreateButton("ACC Dual OS", 50, 180, 200, 100)
	GUICtrlSetOnEvent($ACC_Dual_System, "Restore_ACC_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)
	
	;AD268 XP
	
	$AD268_XP = GUICtrlCreateButton("AD268 and ACC Dual OS", 300, 180, 200, 100)
	GUICtrlSetOnEvent($AD268_XP, "Restore_AD268_ACC_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)

	
	;VT208&VT306 XP
	
	$VT208_VT306_XP = GUICtrlCreateButton("VT208 and VT306-B XP OS", 550, 180, 200, 100)
	GUICtrlSetOnEvent($VT208_VT306_XP, "Restore_VT208_VT306_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)

	;QP200GA Win7
	
	$QP200GA_Win7 = GUICtrlCreateButton("QP200GA Win7 OS", 50, 360, 200, 100)
	GUICtrlSetOnEvent($QP200GA_Win7, "Restore_QP200GA_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)
	
	;QP200WWAN Win7
	
	$QP200WWAN_Win7 = GUICtrlCreateButton("QP200WWAN Win7 OS", 300, 360, 200, 100)
	GUICtrlSetOnEvent($QP200WWAN_Win7, "Restore_QP200WWAN_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)

	
	;VT306 Series Win7
	
	$VT306_Series_Win7 = GUICtrlCreateButton("VT306 Series Win7 OS", 550, 360, 200, 100)
	GUICtrlSetOnEvent($VT306_Series_Win7, "Restore_VT306_Image")
	GUICtrlSetFont(-1, 10, 600, "", $font)
		
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")

	GUISetState()  ; display the GUI
	
	
	While 1
		Sleep(1000)
	WEnd
EndFunc   ;==>_Main

;--------------- Functions ---------------
Func Restore_ACC_Image()
	Run(@ComSpec & " /c " & "Restore_ACC_Image.bat ")
    Exit
EndFunc   ;==>Restore_ACC_Image

Func Restore_AD268_ACC_Image()
	Run(@ComSpec & " /c " & "Restore_AD268_ACC_Image.bat ")
    Exit
EndFunc   ;==>Restore_AD268_ACC_Image

Func Restore_VT208_VT306_Image()
	Run(@ComSpec & " /c " & "Restore_VT208_VT306_Image.bat ")
    Exit
EndFunc   ;==>Restore_VT208_VT306_Image

Func Restore_QP200GA_Image()
	Run(@ComSpec & " /c " & "Restore_QP200GA_Image.bat ")
    Exit
EndFunc   ;==>Restore_QP200GA_Image

Func Restore_QP200WWAN_Image()
	Run(@ComSpec & " /c " & "Restore_QP200WWAN_Image.bat ")
    Exit
EndFunc   ;==>Restore_QP200WWAN_Image

Func Restore_VT306_Image()
	Run(@ComSpec & " /c " & "Restore_VT306_Image.bat ")
    Exit
EndFunc   ;==>Restore_VT306_Image



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
