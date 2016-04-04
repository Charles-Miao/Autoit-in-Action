
echo ***************************************Backup TRS files***************************************************
::Backup Verifone T9&U6 TRS file (120 days ago files will be delete in backup server)
::Backup Zara U6 TRS file (120 days ago files will be delete in backup server)
::Backup NonZara U6 TRS file (120 days ago files will be delete in backup server)
::Backup Helsinki TV TRS file (120 days ago files will be delete in backup server)
set TRS_File=E:\FA
set TRS_Backup_File=\\192.168.123.45\d$\TRS_Backup
for /f "delims=" %%i in ('dir /ad /b /s %TRS_File%') do call :CopyFile %%i
echo ***************************************Backup TRS files***************************************************

echo ***************************************Delete 40 days ago files*******************************************
::Delete other files(None Backup files), 40 days ago files will be delete in this server
call :DeleteFile E:\AVI
call :DeleteFile E:\FA
call :DeleteFile E:\OOB
call :DeleteFile E:\PCBA
call :DeleteFile E:\Temp
echo ***************************************Delete 40 days ago files*******************************************

echo ***************************************Delete empty folders***********************************************
::Delete empty folders
set count=0
set count_max=10

:del_empty_dir
if %count% GTR %count_max% goto end_del_dir
for /f "delims=" %%i in ('dir /ad /b /s "E:\FA"') do rd %%i 2>nul
for /f "delims=" %%i in ('dir /ad /b /s "E:\PCBA"') do rd %%i 2>nul
set /a count=%count%+1
goto del_empty_dir 
:end_del_dir
echo ***************************************Delete empty folders***********************************************

goto :end

echo ***************************************CopyFile Function**************************************************
:CopyFile
set source=%1
set des=%TRS_Backup_File%%source:~5%

echo %1 | find /i "U6"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "E355"
if errorlevel 1 goto CopyE355_END
echo %1 | find /i "T9"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyE355_END

echo %1 | find /i "E265"
if errorlevel 1 goto CopyE265_END
echo %1 | find /i "T9"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyE265_END

echo %1 | find /i "Helsinki"
if errorlevel 1 goto CopyHelsinki_END
echo %1 | find /i "TV"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyHelsinki_END
goto :EOF
echo ***************************************CopyFile Function**************************************************

echo ***************************************DeleteFile Function************************************************
:DeleteFile
echo %1
forfiles /P %1 /S /M * /d -30 /c "cmd /c del /f /q /a @path"
goto :EOF
echo ***************************************DeleteFile Function************************************************

:end
