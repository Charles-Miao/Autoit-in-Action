
echo ***************************************Backup TRS files***************************************************
set TRS_File=E:\AVI
set TRS_Backup_File=\\192.168.123.52\d$\OOB_TRS_Backup
ROBOCOPY %TRS_File%. %TRS_Backup_File%. /E /R:2 /W:0
echo ***************************************Backup TRS files***************************************************

echo ***************************************Delete 21 days ago files*******************************************
call :DeleteFile E:\AVI
echo ***************************************Delete 21 days ago files*******************************************

echo ***************************************Delete empty folders***********************************************
::Delete empty folders
set count=0
set count_max=10

:del_empty_dir
if %count% GTR %count_max% goto end_del_dir
for /f "delims=" %%i in ('dir /ad /b /s "E:\AVI"') do rd %%i 2>nul
set /a count=%count%+1
goto del_empty_dir 
:end_del_dir
echo ***************************************Delete empty folders***********************************************

goto :end

echo ***************************************DeleteFile Function************************************************
:DeleteFile
echo %1
forfiles /P %1 /S /M * /d -21 /c "cmd /c del /f /q /a @path"
goto :EOF
echo ***************************************DeleteFile Function************************************************

:end
