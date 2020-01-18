#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)
Opt("TrayIconHide",1)

FileChangeDir(@ScriptDir)

;====================================
;���⣺
;1.��ʾ����㣿
;2.���ȥ����������ʾ��
;====================================

_Main()


Func  _Main()
	;setup UI
	GUICreate("���Լ��", 240, 130, @DesktopWidth-250, @DesktopHeight-205)
	
	GUICtrlCreateLabel("ϵͳ���漤��״��", 10,10,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("�����汾����״��", 10,40,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("ɨ�����尲װ״��", 10,70,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("ɨ��Server����״��", 10,100,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	;�趨����ɫ
	GUISetBkColor(0x00AAAA)
	;GUISetBkColor(0x33ffaa)
		
	;close the GUI
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")
	
	;display the GUI
	GUISetState()
	
	While 1
		Sleep(1000)
		;�鿴���Լ����
		ShowResult()
	WEnd
EndFunc


Func OnExit()
	Exit
EndFunc


Func ShowResult()
	;��ʾ�������������������������ʾOK��������ʾNG
	If FileExists(@HomeDrive & "\IsActivation")==1 Then
		GuiCtrlCreateInput("OK", 180, 10, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	ElseIf FileExists(@HomeDrive & "\IsNotActivation")==1 Then
		GuiCtrlCreateInput("NG", 180, 10, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	Else
		GuiCtrlCreateInput("", 180, 10, 50, 20)
		;GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xffffff)
	EndIf

	;��ʾ��������½�������������ͬ������ʾOK��������ʾNG
	If FileExists(@HomeDrive & "\IsVirusPattern")==1 Then
		GuiCtrlCreateInput("OK", 180, 40, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	ElseIf FileExists(@HomeDrive & "\IsNotVirusPattern")==1 Then
		GuiCtrlCreateInput("NG", 180, 40, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	Else
		GuiCtrlCreateInput("", 180, 40, 50, 20)
		;GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xffffff)		
	EndIf

	;��ʾ�Ƿ�װOfficeScan����δ��װ������ʾNG��������ʾOK
	If FileExists(@HomeDrive & "\IsNotAntiVirus")==1 Then
		GuiCtrlCreateInput("NG", 180, 70, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	Else
		GuiCtrlCreateInput("OK", 180, 70, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	EndIf
	
	;��ʾ�Ƿ�����ɨ������������δ�������ӣ�����ʾNG��������ʾOK
	If FileExists(@HomeDrive & "\IsNotNetWork")==1 Then
		GuiCtrlCreateInput("NG", 180, 100, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	Else
		GuiCtrlCreateInput("OK", 180, 100, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	EndIf
EndFunc