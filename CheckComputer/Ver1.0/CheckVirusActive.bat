@echo off

:delete the task
schtasks /delete /TN "activity" /F
schtasks /delete /TN "antivirus" /F

:check_UI
tasklist | find "CheckVirusActive_UI.exe"
if errorlevel 1 (
start CheckVirusActive_UI.exe
)

:check_Tool
tasklist | find "CheckVirusActive.exe"
if errorlevel 1 (
start CheckVirusActive.exe
)

:check_end

cd C:\
::if windows is activation and the virus pattern is right, then close the ui.
if not exist IsActivation goto Next
if exist IsVirusPattern taskkill /F /IM CheckVirusActive_UI.exe
:Next

exit