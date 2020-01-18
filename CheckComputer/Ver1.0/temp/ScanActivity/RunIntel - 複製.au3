;Run("IntelAndroidDrvSetup1.2.0.exe")
;  WinWaitActive("Intel Android Device USB driver 1.2.0 Setup")
  ;Send("!N")
  While 1
	 Sleep(1)
	 	If FileExists(".\flag\OK")Then
	ExitLoop
	EndIf
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