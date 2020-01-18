#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)
Opt("TrayIconHide",1)

FileChangeDir(@ScriptDir)

;====================================
;问题：
;1.显示于最顶层？
;2.如何去除任务栏显示？
;====================================

_Main()


Func  _Main()
	;setup UI
	GUICreate("电脑检查", 240, 130, @DesktopWidth-250, @DesktopHeight-205)
	
	GUICtrlCreateLabel("系统正版激活状况", 10,10,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("病毒版本更新状况", 10,40,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("扫毒软体安装状况", 10,70,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	GUICtrlCreateLabel("扫毒Server连接状况", 10,100,800,100)
	GUICtrlSetFont(-1, "", 600, "", "Tahoma")
	
	;设定背景色
	GUISetBkColor(0x00AAAA)
	;GUISetBkColor(0x33ffaa)
		
	;close the GUI
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")
	
	;display the GUI
	GUISetState()
	
	While 1
		Sleep(1000)
		;查看电脑检查结果
		ShowResult()
	WEnd
EndFunc


Func OnExit()
	Exit
EndFunc


Func ShowResult()
	;显示激活结果，若电脑正常激活，则显示OK，否则显示NG
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

	;显示病毒码更新结果，与服务器相同，则显示OK，否则显示NG
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

	;显示是否安装OfficeScan，若未安装，则显示NG，否则显示OK
	If FileExists(@HomeDrive & "\IsNotAntiVirus")==1 Then
		GuiCtrlCreateInput("NG", 180, 70, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	Else
		GuiCtrlCreateInput("OK", 180, 70, 50, 20)
		GUICtrlSetFont(-1, "", 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	EndIf
	
	;显示是否连接扫毒服务器，若未正常连接，则显示NG，否则显示OK
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