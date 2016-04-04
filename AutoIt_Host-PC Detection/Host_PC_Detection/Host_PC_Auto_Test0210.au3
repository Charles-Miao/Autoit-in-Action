


#include <Process.au3>
#include <GUIConstants.au3>
;=================Command list=====================
; Version=V20150210
;=================Command list=====================

Global $TestResult[6],$number,$input[6],$testfile[6],$width,$Btn[7],$testitemno,$number1,$number2,$number3,$inputwidth,$testitem[6]

;ini for copy file
$copypath="d:\Host_PC_Detection."
$targetpath=@DesktopDir& "\Host_PC_Detection."

;ini for build shortcut icon 
$short_cut_Tool=@DesktopDir & "\Host_PC_Detection\tool\SHORTCUT.EXE"
$short_tool='"'& @DesktopDir & "\Host_PC_Auto_Test.exe"&'"'
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

$testitem[1]="Scan_HDD_Test"
$testitem[2]="Furmark_Test"
$testitem[3]="AC_DC_Test"
$testitem[4]="Warm_Boot_Test"
$testitem[5]="Cold_Boot_Test"

$testitemno=5
$inputwidth=0
$number=1

;set frontsize
$frontsize=30
if @DesktopWidth=1920 Then
$frontsize=40
EndIf
if @DesktopWidth=1024 Then
	$frontsize=24
EndIf
if @DesktopWidth=1600 Then
	$frontsize=36
EndIf
	

;=================GUI Setup=====================
GUICreate("Wistron P5 Host_PC Auto_Test System v1.0", @DesktopWidth-50, @DesktopHeight-100,-1,-1); WS_EX_ACCEPTFILES	

GUICtrlCreateLabel("           Wistron P5 Host_PC Auto_Test System",(@DesktopWidth-20)/15,(@DesktopHeight-100)/17,(@DesktopWidth-20)-((@DesktopWidth-20)/15),100)
GUICtrlSetFont(-1, $frontsize, @DesktopWidth/2, "", "Arial Rounded MT Bold")

GuiCtrlCreateGroup("  Test Item  ", (@DesktopWidth-50)/6, (@DesktopHeight-100)/17*3+20, 300+@DesktopWidth/10,(@DesktopHeight-100)/17*10)
GUICtrlSetFont(-1, 30, 500, "", "Arial")

$Btn[1]= GuiCtrlCreateRadio("Scan_HDD_Test", (@DesktopWidth-50)/5, (@DesktopHeight-100)/17*5, 300,50)
GUICtrlSetFont(-1, 20, 500, "", "Arial")
;GuiCtrlSetState(-1, $GUI_CHECKED)

$Btn[2]= GuiCtrlCreateRadio("Furmark_Test", (@DesktopWidth-50)/5, (@DesktopHeight-100)/17*6.5, 300,50)
GUICtrlSetFont(-1, 20, 500, "", "Arial")


$Btn[3]= GuiCtrlCreateRadio("AC_DC_Test", (@DesktopWidth-50)/5, (@DesktopHeight-100)/17*8, 300,50)
GUICtrlSetFont(-1, 20, 500, "", "Arial")


$Btn[4]= GuiCtrlCreateRadio("Warm_Boot_Test", (@DesktopWidth-50)/5, (@DesktopHeight-100)/17*9.5, 300,50)
GUICtrlSetFont(-1, 20, 500, "", "Arial")


$Btn[5]= GuiCtrlCreateRadio("Cold_Boot_Test", (@DesktopWidth-50)/5, (@DesktopHeight-100)/17*11, 300,50)
GUICtrlSetFont(-1, 20, 500, "", "Arial")

$Btn6= GuiCtrlCreateGroup("  Test Result   ", (@DesktopWidth-50)/6*3, (@DesktopHeight-100)/17*3+20, 300+@DesktopWidth/10,(@DesktopHeight-100)/17*10)
;$Btn6= GuiCtrlCreateGroup("  Test Result   ", (@DesktopWidth-50)/5*3, (@DesktopHeight-100)/17*3, 500,(@DesktopHeight-100)/17*10)
GUICtrlSetFont(-1, 27, 500, "", "Arial")

$Btn7= GUICtrlCreateButton ("Start", (@DesktopWidth-50)/2-((@DesktopWidth-50)/13),  (@DesktopHeight-100)/17*14.5, 150, 60)
;GuiCtrlSetBkColor(-1, 0x00ff00)
GUICtrlSetFont(-1, 16, 500, "", "Tahoma")

$Input[1]=GuiCtrlCreateInput("", (@DesktopWidth-50)/5*2.68, (@DesktopHeight-100)/17*5, 300, 50)
$Input[2]=GuiCtrlCreateInput("", (@DesktopWidth-50)/5*2.68, (@DesktopHeight-100)/17*6.5, 300, 50)
$Input[3]=GuiCtrlCreateInput("", (@DesktopWidth-50)/5*2.68, (@DesktopHeight-100)/17*8, 300, 50)
$Input[4]=GuiCtrlCreateInput("", (@DesktopWidth-50)/5*2.68, (@DesktopHeight-100)/17*9.5, 300, 50)
$Input[5]=GuiCtrlCreateInput("", (@DesktopWidth-50)/5*2.68, (@DesktopHeight-100)/17*11, 300, 50)

GUISetBkColor(0x00AAAA)
;GUISetBkColor(0x33ffaa)
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
		   GuiCtrlSetState($btn7,$GUI_DISABLE)   ;disable start button
		   
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
						  $inputwidth=((@DesktopHeight-100)/17*6.5 -(@DesktopHeight-100)/17*5)*($check_itemno-1)   
						  check_result()
						 FileDelete(@HomeDrive&"\Warm_End.txt") 
						 msgbox(0,"Coldboot_test","start_coldboot_test")
					Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$testitemno],"",@SW_MaxIMIZE)   
				   EndIf
		  EndIf
		  
  EndFunc

func Check_Cold_Boot()
	
	 if FileExists(@HomeDrive&"\Warmboot_Test_Result.txt") Then  
		    
			  GuiCtrlSetState($btn7,$GUI_DISABLE)   ;disable start button
			  
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
						  $inputwidth=((@DesktopHeight-100)/17*6.5 -(@DesktopHeight-100)/17*5)*($testitemno-1)
						  
			             GuiCtrlSetState($btn[$testitemno],$GUI_CHECKED)
			             check_result()
				   EndIf
	 EndIf


EndFunc
	
	

func Start_Test()
	
	 Del_log_File()
	 
	 ;RunWait(@ComSpec & " /c " & "robocopy" &" " & $copypath& " "& $targetpath & " "& "/E /R:2 /W:0 /mir /TEE","",@SW_MAXIMIZE)  ;Ccopy files
	 
	 ;build testtool shutcut icon to start up memu
     ;runwait(@ComSpec & " /c "& @DesktopDir& "\Host_PC_Detection\tool\refreshicon.exe")
     runwait(@ComSpec & " /c "& $short_cut_Tool &" "&"-F"& " "& "-t" &" "& $short_tool & " "& "-n" & " " &$short_cut)   ;create testtool shutcut icon to start up memu
	 GuiCtrlSetState($btn7,$GUI_DISABLE)     ;disable start button
	 
	 ;build testtool shutcut icon to start up memu
	 
	 for $number=1 to $testitemno step 1 
		 GuiCtrlSetState($btn[$number],$GUI_CHECKED)
	     Runwait(@ComSpec & " /c " & "call"& " "& $testfile[$number],"",@SW_MaxIMIZE)
	     check_result()
     Next
EndFunc

func check_result()
	
	 $Testresultfile=$TestResult[$number]
	 
	 if FileExists($Testresultfile) Then
	 $file=fileopen($testresultfile,0)
	 $result=fileread($file,2)
	 $width=$inputwidth+(@DesktopHeight-100)/17*5
	 ;msgbox("","width",$width)
	
	 if $result="OK" or $result="ok" then 
		GUICtrlDelete($INPUT[$number])
		GuiCtrlCreateInput("PASS", (@DesktopWidth-50)/5*2.68, $width, 300, 50)
		GUICtrlSetFont(-1, 19, 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0x00ff00)
	 EndIf
	
	 if $result="NG" or $result="ng" then 
		GUICtrlDelete($INPUT[$number])
		GuiCtrlCreateInput("Fail", (@DesktopWidth-50)/5*2.68, $width, 300, 50)
		GUICtrlSetFont(-1, 19, 500, "", "Arial")
		GuiCtrlSetBkColor(-1, 0xff0000)
	 EndIf
	
	 $number=$number+1
	 $inputwidth=$inputwidth+((@DesktopHeight-100)/17*6.5 -(@DesktopHeight-100)/17*5)
	  fileclose($file)
	  
  Else
	  msgbox("","Test message",$testitem[$number])
	  Exit
	  EndIf
EndFunc
  
Func Del_log_File()
     FileDelete(@HomeDrive&"\*Test_Result.txt")
	 FileDelete(@HomeDrive&"\BootINI.bat")
	 Runwait(@ComSpec & " /c "& "del"&" "&$short_cut,"",@SW_MinIMIZE)
EndFunc


