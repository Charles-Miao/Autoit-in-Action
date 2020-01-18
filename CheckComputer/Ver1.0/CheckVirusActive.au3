#include <file.au3>
#include <Array.au3>

Opt("TrayIconHide",1)

;初始化
Global $IsActivation=0
;the path of virus pattern
$server_path="\\172.168.168.100\c$\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV"
$computer_x64_path="C:\Program Files (x86)\Trend Micro\OfficeScan Client"
$computer_x86_path="C:\Program Files\Trend Micro\OfficeScan Client"

FileChangeDir(@ScriptDir)


;调用主函数
_Main()

;主函数
Func _Main()
	;========================================================激活模块========================================================
	;关闭异常对话框
	$window_count=0
	While 1
		Sleep(1)
		$window_count=$window_count+1
		If WinExists("Windows Script Host","10.37.31.86:1688")Then
			WinActivate("Windows Script Host","10.37.31.86:1688")
			Send("{ENTER}")
		ElseIf WinExists("Windows Script Host","Windows")Then
			WinActivate("Windows Script Host","Windows")
			Send("{ENTER}")
		ElseIf $window_count>3 Then
			ExitLoop
		EndIf
	WEnd
	
	;调用判定激活状讨指令
	Run(@ComSpec & " /c" & "CheckActivation.bat","",@SW_HIDE)
	
	;等待窗口出现
	Do
		sleep(1)
	Until WinExists("Windows Script Host","Windows")
	
	;判定是否激活，并标记IsActivation参数，同时点击确认按钮
	If WinExists("Windows Script Host","已授权") Or WinExists("Windows Script Host","已取得授權") Or WinExists("Windows Script Host","Licensed") Then
		$IsActivation=1
		TabEnter()
	Else
		TabEnter()
	EndIf
	
	;删除激活标记文件
	FileDelete(@HomeDrive & "\IsActivation")
	FileDelete(@HomeDrive & "\IsNotActivation")
	;生成激活标记文件，以便UI显示激活结果，若未正常激活，则进行激活的动作
	If $IsActivation==1 Then
		;MsgBox(0, "程序返回的退出码是：", $IsActivation)
		_FileCreate(@HomeDrive & "\IsActivation")
	Else
		_FileCreate(@HomeDrive & "\IsNotActivation")
		ActivateWindows()
	EndIf
	
	;========================================================扫毒模块========================================================
	;连接扫毒服务器
	DriveMapAdd("","\\172.168.168.100\c$",0,"administrator","Z900TE@Quality!!#")
	
	;获取各个路径的病毒码
	$computer_x64_pattern=FindVirusPattern($computer_x64_path)
	$computer_x86_pattern=FindVirusPattern($computer_x86_path)
	$server_pattern=FindVirusPattern($server_path)
	
	;删除服务器连接
	DriveMapDel("\\172.168.168.100\c$")
	
	;判定病毒码是否为最新，若不为最新，则进行更新
	FileDelete(@HomeDrive & "\IsVirusPattern")
	FileDelete(@HomeDrive & "\IsNotVirusPattern")
	FileDelete(@HomeDrive & "\IsNotNetWork")
	FileDelete(@HomeDrive & "\IsNotAntiVirus")
	If ($server_pattern==$computer_x64_pattern Or $server_pattern==$computer_x86_pattern) And $server_pattern And ($computer_x86_pattern Or $computer_x64_pattern) Then
		_FileCreate(@HomeDrive & "\IsVirusPattern")
	Else
		_FileCreate(@HomeDrive & "\IsNotVirusPattern")
		AntiVirusTreatment($computer_x86_pattern,$computer_x64_pattern,$server_pattern)
	EndIf
EndFunc

;自动点击确认按钮
Func TabEnter()
	While 1
		Sleep(1)
		If WinExists("Windows Script Host","Windows")Then
			WinActivate("Windows Script Host","Windows")
			Send("{ENTER}")
			ExitLoop
		EndIf
	WEnd
EndFunc

;激活函数
Func ActivateWindows()
	;调用激活指令
	Run(@ComSpec & " /c" & "ActivateWindows.bat","",@SW_HIDE)
	;点击确认按钮
	While 1
		Sleep(1)
		If WinExists("Windows Script Host","10.37.31.86:1688")Then
			WinActivate("Windows Script Host","10.37.31.86:1688")
			Send("{ENTER}")
		EndIf

		If WinExists("Windows Script Host","Windows")Then
			WinActivate("Windows Script Host","Windows")
			Send("{ENTER}")
			ExitLoop
		EndIf
	WEnd
EndFunc

;获取对应路径中的病毒码版本，通过数组实现
;使用函数：
;FileFindFirstFile()
;FileFindNextFile()
;################特别注意################
;修改路径后续返回工作路径(@ScriptDir)
;################特别注意################
Func FindVirusPattern(ByRef $path)
	Dim $pattern_array[1]
	FileChangeDir($path)
	
	$search=FileFindFirstFile ( "lpt$vpn.*" )
	While 1
		$file_name = FileFindNextFile($search) 
		If @error Then ExitLoop
		_ArrayAdd( $Pattern_Array,$file_name)
	WEnd
	FileClose($search)
	$file_name=_ArrayMax( $Pattern_Array, 0, 1)
	
	FileChangeDir(@ScriptDir)
	return $file_name
EndFunc

;处理OfficeScan软体异常
Func AntiVirusTreatment(ByRef $x86, ByRef $x64, ByRef $server)
	
	;判断是否正常连网
	If Not $server Then
		_FileCreate(@HomeDrive & "\IsNotNetWork")
	EndIf
	;判断是否安装OfficeScan
	If (Not $x86) And (Not $x64) Then
		_FileCreate(@HomeDrive & "\IsNotAntiVirus")
	Else
		$x64_bool=(IniRead("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		$x86_bool=(IniRead("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		;开启Officesan（只开启一次）
		If FileExists(@HomeDrive & "\IsOpen")==0 And ProcessExists("PccNTMon.exe")==0 Then
			Run("C:\Program Files (x86)\Trend Micro\OfficeScan Client\PccNTMon.exe","",@SW_MINIMIZE)
			Run("C:\Program Files\Trend Micro\OfficeScan Client\PccNTMon.exe","",@SW_MINIMIZE)
			
			_FileCreate(@HomeDrive & "\IsOpen")
		;修改OfficeScan的服务器器指向（只修改一次）
		ElseIf FileExists(@HomeDrive & "\IsDirect")==0 And (Not($x64_bool Or $x86_bool)) Then
			If FileExists("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x64_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient_x64.bat","",@SW_HIDE)
			ElseIf FileExists("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x86_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient.bat","",@SW_HIDE)
			EndIf
			
			_FileCreate(@HomeDrive & "\IsDirect")
		;修改OfficeScan的GUID
		ElseIf FileExists(@HomeDrive & "\IsGUID")==0 Then
			$count=1
			Run(@ScriptDir & "\ImgSetup.exe","",@SW_MINIMIZE)
			;点击确认按钮，将对话框点击掉
			While 1
				Sleep(1000)
				$count=$count+1
				If WinExists("OfficeScan Image Setup Utility","system is restarted")Then
					WinActivate("OfficeScan Image Setup Utility","system is restarted")
					Send("{ENTER}")
					RunWait(@ScriptDir & "\ImgSetup.exe","",@SW_MINIMIZE)
					ExitLoop
				ElseIf $count>3 Then
					ExitLoop
				EndIf
			WEnd

			_FileCreate(@HomeDrive & "\IsGUID")
		EndIf
	EndIf
EndFunc