@echo off
del /F /Q ..\flag\OK
start /B drive.exe
devcon install android.inf "USB\Vid_0b05&Pid_4c81&MI_01" "USB\Vid_0b05&Pid_4c81&Rev_9999&MI_01"
::devcon update android.inf "USB\Vid_0b05&Pid_4c81&MI_01" "USB\Vid_0b05&Pid_4c81&Rev_9999&MI_01"
Devcon remove  "USB\Vid_0b05&Pid_4c81&MI_01" "USB\Vid_0b05&Pid_4c81&Rev_9999&MI_01"
devcon rescan
::cd /d C:\TF201\tool\installdrive\flag
echo >..\flag\OK
::pause
