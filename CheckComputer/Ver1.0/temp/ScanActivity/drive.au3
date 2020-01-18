;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Opens Notepad, types in some text and then quits.
;   The text typed shows two ways of Sending special
;   characters
;


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
;WinWaitActive("[CLASS:Notepad]")
while 1
	Sleep(1)
	If FileExists("..\flag\OK")Then
	ExitLoop
	EndIf
	If WinExists("Windows 安全性","&I")Then
	WinActivate("Windows 安全性","&I")
	Send("!I")
	ExitLoop
EndIf
WEnd
; Now that the Notepad window is active type some special characters
;Send("{TAB}")
;Send("{TAB}L")
;Send("{TAB}1")
;Send("{ENTER}")
; Do it the first way
;Send("First way: ")
;Send("{!}{^}{+}{#}")
;Send("{ENTER}")

; Do it the second way (RAW mode, notice the second parameter is 1)
;Send("Second way: ")
;Send("!^+#", 1)

;Send("{ENTER}{ENTER}Finished")

; Finished!
