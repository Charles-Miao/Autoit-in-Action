@echo off
taskkill /F /IM BeeNotice.exe >nul
cd /d .\software
del "%USERPROFILE%\DESKTOP\quit.lnk" 2>nul
refreshicon.exe
exit