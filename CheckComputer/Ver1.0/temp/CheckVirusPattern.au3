#include <Array.au3>
#include <file.au3>

$server_path="\\172.30.21.63\c$\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV"
$computer_x64_path="C:\Program Files (x86)\Trend Micro\OfficeScan Client"
$computer_x86_path="C:\Program Files\Trend Micro\OfficeScan Client"


_Main()

Func _Main()
	;RunWait(@ComSpec & " /c" & "LinkOfficeScanServer.bat","",@SW_HIDE)
	DriveMapAdd("","\\172.30.21.63\c$",0,"administrator","Z900TE@Quality!!#")
	
	$computer_x64_pattern=FindVirusPattern($computer_x64_path)
	$computer_x86_pattern=FindVirusPattern($computer_x86_path)
	$server_pattern=FindVirusPattern($server_path)
	
	DriveMapDel("\\172.30.21.63\c$")
	
	MsgBox(0,"server",$server_pattern)
	MsgBox(0,"x64",$computer_x64_pattern)
	MsgBox(0,"x86",$computer_x86_pattern)
	
	
	;$file = FileOpen("test.txt", 1)
	;FileWrite($file, $server_pattern)
	;FileClose($file)
	
	
	
	FileDelete("IsVirusPattern")
	FileDelete("IsNotVirusPattern")
	;If $computer_x86_pattern==0 Or $server_pattern==0 Or $computer_x64_pattern==0 Then
	;	_FileCreate("IsNotVirusPattern")
	;Else
		If ($server_pattern==$computer_x64_pattern Or $server_pattern==$computer_x86_pattern) And $server_pattern And ($computer_x64_pattern Or $computer_x86_pattern ) Then
			_FileCreate("IsVirusPattern")
		Else
			_FileCreate("IsNotVirusPattern")
			AntiVirusTreatment($computer_x86_pattern,$computer_x64_pattern,$server_pattern)
		EndIf
	;EndIf
EndFunc

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

Func AntiVirusTreatment(ByRef $x86, ByRef $x64, ByRef $server)
	FileDelete("IsNotNetWork")
	FileDelete("IsNotAntiVirus")
	
	If Not $server Then
		_FileCreate("IsNotNetWork")
	ElseIf (Not $x86) And (Not $x64) Then
		_FileCreate("IsNotAntiVirus")
		;C:\Program Files (x86)\Trend Micro\OfficeScan Client\PccNTMon.exe
	Else
		$x64_bool=(IniRead("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		$x86_bool=(IniRead("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini", "INI_SERVER_SECTION", "Master_DomainName", "None")=="172.168.168.100")
		If FileExists("IsOpen")==0 And ProcessExists("PccNTMon.exe")==0 Then
			Run("C:\Program Files (x86)\Trend Micro\OfficeScan Client\PccNTMon.exe")
			Run("C:\Program Files\Trend Micro\OfficeScan Client\PccNTMon.exe")
			
			_FileCreate("IsOpen")
		ElseIf FileExists("IsDirect")==0 And (Not($x64_bool Or $x86_bool)) Then
			If FileExists("C:\Program Files (x86)\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x64_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient_x64.bat","",@SW_HIDE)
			ElseIf FileExists("C:\Program Files\Trend Micro\OfficeScan Client\ofcIMPDP.ini") And (Not $x86_bool) Then
				Run(@ComSpec & " /c" & "TransferOfficeClient.bat","",@SW_HIDE)
			EndIf
			
			_FileCreate("IsDirect")
		ElseIf FileExists("IsGUID")==0 Then
			Run("ImgSetup.exe","",@SW_MINIMIZE)
			;
			While 1
				Sleep(1)
				If WinExists("OfficeScan Image Setup Utility","system is restarted")Then
					WinActivate("OfficeScan Image Setup Utility","system is restarted")
					Send("{ENTER}")
					ExitLoop
				EndIf
			WEnd
			RunWait("ImgSetup.exe","",@SW_MINIMIZE)

			_FileCreate("IsGUID")
		EndIf
	EndIf
EndFunc