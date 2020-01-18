
#include <Process.au3>
#include <GUIConstants.au3>
;=================Command list=====================
; 
;=================Command list=====================

Global $TestResult[6],$number,$input[6],$testfile[6],$width,$Btn[7],$testitemno,$number1,$number2,$number3,$inputwidth

;ini for copy file

$copypath="d:\Host_PC_Detection."
$targetpath=@DesktopDir& "\Host_PC_Detection."

;ini for build shortcut icon 
$short_cut_Tool=@DesktopDir & "\Host_PC_Detection\tool\SHORTCUT.EXE"
$short_tool='"'& @DesktopDir & "\Host_PC_Auto_Test0209.exe"&'"'
$short_cut='"'& @StartupDir&"\Host_PC_Auto_Test.lnk"&'"'
;msgbox("","startmemu",@StartupDir)

;Test file
$testfile[1]=@DesktopDir& "\Host_PC_Detection\HDTunePro\HDTUNETEST.BAT"
$testfile[2]=@DesktopDir& "\Host_PC_Detection\FURMARK\VGAMARK.BAT"
$testfile[3]=@DesktopDir& "\Host_PC_Detection\Battery\AC_DC_Detect.BAT"
$testfile[4]=@DesktopDir& "\Host_PC_Detection\Reboot\Warmboot.BAT"
$testfile[5]=@DesktopDir& "\Host_PC_Detection\Reboot\Coldboot.BAT"

$TestResult[1]=@HomeDrive&"\HDD_Test_Result.txt"
$TestResult[2]=@HomeDrive&"\Furmark_Test_Result.txt"
$TestResult[3]=@HomeDrive&"\Battery_Test_Result.txt"
$TestResult[4]=@HomeDrive&"\Warmboot_Test_Result.txt"
$TestResult[5]=@HomeDrive&"\Coldboot_Test_Result.txt"
$testitemno=5
$inputwidth=0
$number=1

;=================GUI Setup=====================
GUICreate("Wistron P5 Host_PC Auto_Test System v1.0", 740,400, -1, -1, -1); WS_EX_ACCEPTFILES	

GUICtrlCreateLabel("    Wistron P5 Host_PC Auto_Test System",0,20,800,100)
GUICtrlSetFont(-1, 25, 600, "", "Arial Rounded MT Bold")

GuiCtrlCreateGroup("  Test Item  ", 50, 80, 300,260)
GUICtrlSetFont(-1, 27, 500, "", "Arial")

$Btn[1]= GuiCtrlCreateRadio("Scan_HDD_Test", 80, 130, 200,30)
GUICtrlSetFont(-1, 17, 500, "", "Arial")
;GuiCtrlSetState(-1, $GUI_CHECKED)

$Btn[2]= GuiCtrlCreateRadio("Furmark_Test", 80, 170, 200,30)
GUICtrlSetFont(-1, 17, 500, "", "Arial")


$Btn[3]= GuiCtrlCreateRadio("AC_DC_Test", 80, 210, 200,30)
GUICtrlSetFont(-1, 17, 500, "", "Arial")


$Btn[4]= GuiCtrlCreateRadio("Warm_Boot_Test", 80, 250, 200,30)
GUICtrlSetFont(-1, 17, 500, "", "Arial")


$Btn[5]= GuiCtrlCreateRadio("Cold_Boot_Test", 80, 290, 200,30)
GUICtrlSetFont(-1, 17, 500, "", "Arial")


$Btn6= GuiCtrlCreateGroup("  Test Result   ", 370, 80, 300,260)
GUICtrlSetFont(-1, 27, 500, "", "Arial")

$Btn7= GUICtrlCreateButton ("Start", 280,  350, 150, 40)
;GuiCtrlSetBkColor(-1, 0x00ff00)
GUICtrlSetFont(-1, 16, 500, "", "Tahoma")

$Input[1]=GuiCtrlCreateInput("", 400, 130, 200, 30)
$Input[2]=GuiCtrlCreateInput("", 400, 170, 200, 30)
$Input[3]=GuiCtrlCreateInput("", 400, 210, 200, 30)
$Input[4]=GuiCtrlCreateInput("", 400, 250, 200, 30)
$Input[5]=GuiCtrlCreateInput("", 400, 290, 200, 30)


GUISetBkColor(0x33ffaa)
GUISetState () 
;=================GUI Setup=====================
	
;=================GUI Message control=============
if fileexists(@HomeDrive&"\autostart.tag") Then
   WinWaitActive("Wistron P5 Host_PC Auto_Test System v1.0")
   ControlClick("Wistron P5 Host_PC Auto_Test System v1.0","", "Button8","left")
   FileDelete(@HomeDrive&"\autostart.tag")
  EndIf

if FileExists(@HomeDrive&"\Battery_Test_Result.txt") Then
  Check_Cold_Boot()
  Check_warm_Boot()
  if FileExists (@HomeDrive&"\Coldboot_Test_Result.txt") Then
	 Del_log_File()
	 msgbox(0,"Test_Result","Test finished")
	 EndIf
EndIf
$msg = 0
While 1
   ; recvMsg()
    $msg = GUIGetMsg()	
       Select
	   Case $msg = $btn7
		     Del_log_File()
			 Start_Test()
		    ;Del_log_File()
	 case $msg =$GUI_EVENT_CLOSE 
		  ExitLoop
      EndSelect
Wend

;=================GUI Message control=============
Func  Check_warm_Boot()
	
	 if FileExists(@HomeDrive&"\Warm_Start.txt") Then  
				   $check_itemno=$testitemno-2    ;$check_itemno=5-2
				   for $number2=1 to $check_itemno step 1 
			       GuiCtrlSetState($btn[$number2],$GUI_CHECKED)
			       check_result()
			   Next
			       GuiCtrlSetState($btn[$number2],$GUI_CHECKED)
				   $check_itemno=$check_itemno+1   ;$check_itemno=3+1=4
				   Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$check_itemno],"",@SW_MaxIMIZE)
			
				   if FileExists(@HomeDrive&"\Warm_End.txt") Then
	                      $number=$check_itemno   ;$number=4 for check result test
						  $inputwidth=40*($check_itemno-1)
			             check_result()
						 FileDelete(@HomeDrive&"\Warm_End.txt") 
						 msgbox(0,"Coldboot_test","start_coldboot_test")
					Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$testitemno],"",@SW_MaxIMIZE)   
				   EndIf
		  EndIf
		  
  EndFunc

func Check_Cold_Boot()
	
	 if FileExists(@HomeDrive&"\Warmboot_Test_Result.txt") Then  
				   $check_itemno=$testitemno-1
				   for $number4=1 to $check_itemno step 1 
			       GuiCtrlSetState($btn[$number4],$GUI_CHECKED)
			       check_result()
				   Next
				   Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$testitemno],"",@SW_MaxIMIZE)
                     
				  	if FileExists(@HomeDrive&"\Cold_End.txt") Then
						FileDelete(@HomeDrive&"\Cold_Start.txt")
						FileDelete(@HomeDrive&"\Cold_End.txt")
						 $number=$testitemno  ;$number=5 for check result test
						  $inputwidth=40*($testitemno-1)
						  
			             GuiCtrlSetState($btn[$testitemno],$GUI_CHECKED)
			             check_result()
				   EndIf
	 EndIf


EndFunc
	
	

func Start_Test()
	
	 Del_log_File()
	 
	 ;RunWait(@ComSpec & " /c " & "robocopy" &" " & $copypath& " "& $targetpath & " "& "/E /R:2 /W:0 /mir /TEE","",@SW_MAXIMIZE)  ;Ccopy files
	 
	 ;build testtool shutcut icon to start up memu
     runwait(@ComSpec & " /c "& @DesktopDir& "\Host_PC_Detection\tool\refreshicon.exe")
     runwait(@ComSpec & " /c "& $short_cut_Tool &" "&"-F"& " "& "-t" &" "& $short_tool & " "& "-n" & " " &$short_cut)
	 ;build testtool shutcut icon to start up memu
	 
	 for $number=1 to $testitemno step 1 
		 GuiCtrlSetState($btn[$number],$GUI_CHECKED)
	     Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$number],"",@SW_MaxIMIZE)
	     check_result()
     Next
EndFunc

func check_result()
	 $Testresultfile=$TestResult[$number]
	 $file=fileopen($testresultfile,0)
	 $result=fileread($file,2)
	 $width=$inputwidth+130
	 ;msgbox("","width",$width)
	
	 if $result="OK" or $result="ok" then 
		GUICtrlDelete($INPUT[$number])
		GuiCtrlCreateInput("PASS", 400, $width, 200, 30)
		GUICtrlSetFont(-1, 16, 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	 EndIf
	
	 if $result="NG" or $result="ng" then 
		GUICtrlDelete($INPUT[$number])
		GuiCtrlCreateInput("Fail", 400, $width, 200, 30)
		GUICtrlSetFont(-1, 16, 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	 EndIf
	
	 $number=$number+1
	 $inputwidth=$inputwidth+40
	  fileclose($file)
EndFunc
  
Func Del_log_File()
     FileDelete(@HomeDrive&"\*Test_Result.txt")
	 FileDelete(@HomeDrive&"\BootINI.bat")
	 Runwait(@ComSpec & " /c "& "del"&" "&$short_cut,"",@SW_MinIMIZE)
EndFunc


