Local $L=$CmdLine[1]
Local $message_file
;Local $L=6
Local $Error_Level=MsgBox(262144+1+32+4096,"��ʾ�x��","��ȷ����"&$L&"�����ξ��Ƿ�ź�")
If $Error_level=1 Then
	$message_file = FileOpen("message.txt",2)
	FileWrite($message_file,"OK")
	FileClose($message_file)
Else
	$message_file = FileOpen("message.txt",2)
	FileWrite($message_file,"CANCEL")
	FileClose($message_file)
EndIf