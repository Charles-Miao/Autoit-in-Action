#include <file.au3>
#include <Array.au3>

Opt("TrayIconHide",1)

;��ʼ��
Global $IsActivation=0
;the path of virus pattern
$server_path="\\172.168.168.100\c$\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV"
$computer_x64_path="C:\Program Files (x86)\Trend Micro\OfficeScan Client"
$computer_x86_path="C:\Program Files\Trend Micro\OfficeScan Client"

FileChangeDir(@ScriptDir)


;����������
_Main()

;������
Func _Main()
	;========================================================����ģ��========================================================
	;�ر��쳣�Ի���
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
	
	;�����ж�����״��ָ��
	Run(@ComSpec & " /c" & "CheckActivation.bat","",@SW_HIDE)
	
	;�ȴ����ڳ���
	Do
		sleep(1)
	Until WinExists("Windows Script Host","Windows")
	
	;�ж��Ƿ񼤻�����IsActivation������ͬʱ���ȷ�ϰ�ť
	If WinExists("Windows Script Host","����Ȩ") Or WinExists("Windows Script Host","��ȡ���ڙ�") Or WinExists("Windows Script Host","Licensed") Then
		$IsActivation=1
		TabEnter()
	Else
		TabEnter()
	EndIf
	
	;ɾ���������ļ�
	FileDelete(@HomeDrive & "\IsActivation")
	FileDelete(@HomeDrive & "\IsNotActivation")
	;���ɼ������ļ����Ա�UI��ʾ����������δ�����������м���Ķ���
	If $IsActivation==1 Then
		;MsgBox(0, "���򷵻ص��˳����ǣ�", $IsActivation)
		_FileCreate(@HomeDrive & "\IsActivation")
	Else
		_FileCreate(@HomeDrive & "\IsNotActivation")
		ActivateWindows()
	EndIf
	
	;========================================================ɨ��ģ��========================================================
	;����ɨ��������
	DriveMapAdd("","\\172.168.168.100\c$",0,"administrator","Z900TE@Quality!!#")
	
	;��ȡ����·���Ĳ�����
	$computer_x64_pattern=FindVirusPattern($computer_x64_path)
	$computer_x86_pattern=FindVirusPattern($computer_x86_path)
	$server_pattern=FindVirusPattern($server_path)
	
	;ɾ������������
	DriveMapDel("\\172.168.168.100\c$")
	
	;�ж��������Ƿ�Ϊ���£�����Ϊ���£�����и���
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

;�Զ����ȷ�ϰ�ť
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

;�����
Func ActivateWindows()
	;���ü���ָ��
	Run(@ComSpec & " /c" & "ActivateWindows.bat","",@SW_HIDE)
	;���ȷ�ϰ�ť
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

;��ȡ��Ӧ·���еĲ�����汾��ͨ������ʵ��
;ʹ�ú�����
;FileFindFirstFile()
;FileFindNextFile()
;################�ر�ע��################
;�޸�·���������ع���·��(@ScriptDir)
;################�ر�ע��################
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

;����OfficeScan�����쳣
Func AntiVirusTreatment(ByRef $x86, ByRef $x64, ByRef $server)
	
	;�ж��Ƿ���������
	If Not $server Then
		_FileCreate(@HomeDrive & "\IsNotNetWork")
	EndIf
	;�ж��Ƿ�װOfficeScan
	If (Not $x86) And (Not $x64) Then
		_FileCreate(@HomeDrive & "\IsNotAntiVirus")
	Else
		$x64_bool=(IniRead("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		$x86_bool=(IniRead("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		;����Officesan��ֻ����һ�Σ�
		If FileExists(@HomeDrive & "\IsOpen")==0 And ProcessExists("PccNTMon.exe")==0 Then
			Run("C:\Program Files (x86)\Trend Micro\OfficeScan Client\PccNTMon.exe","",@SW_MINIMIZE)
			Run("C:\Program Files\Trend Micro\OfficeScan Client\PccNTMon.exe","",@SW_MINIMIZE)
			
			_FileCreate(@HomeDrive & "\IsOpen")
		;�޸�OfficeScan�ķ�������ָ��ֻ�޸�һ�Σ�
		ElseIf FileExists(@HomeDrive & "\IsDirect")==0 And (Not($x64_bool Or $x86_bool)) Then
			If FileExists("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x64_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient_x64.bat","",@SW_HIDE)
			ElseIf FileExists("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x86_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient.bat","",@SW_HIDE)
			EndIf
			
			_FileCreate(@HomeDrive & "\IsDirect")
		;�޸�OfficeScan��GUID
		ElseIf FileExists(@HomeDrive & "\IsGUID")==0 Then
			$count=1
			Run(@ScriptDir & "\ImgSetup.exe","",@SW_MINIMIZE)
			;���ȷ�ϰ�ť�����Ի�������
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