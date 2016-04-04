@echo off
echo ***************************************Delete 60 days ago files*******************************************
::Delete TRS Backup files, 60 days ago files will be delete in this server
call :DeleteFile D:\TRS_Backup
call :DeleteFile D:\PRS_Backup

echo ***************************************Delete 60 days ago files*******************************************

echo ***************************************Delete empty folders***********************************************
::Delete empty folders
set count=0
set count_max=10

:del_empty_dir
if %count% GTR %count_max% goto end_del_dir
for /f "delims=" %%i in ('dir /ad /b /s "D:\TRS_Backup"') do rd %%i 2>nul
set /a count=%count%+1
goto del_empty_dir 
:end_del_dir
echo ***************************************Delete empty folders***********************************************

goto :end

echo ***************************************DeleteFile Function************************************************
:DeleteFile
echo %1
forfiles /P %1 /S /M * /d -33 /c "cmd /c del /f /q /a @path"
goto :EOF
echo ***************************************DeleteFile Function************************************************

:end