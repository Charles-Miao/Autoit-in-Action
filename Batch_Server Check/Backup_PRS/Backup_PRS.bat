echo ***************************************Backup PRS files***************************************************
set PRS_File=E:\PRS
set PRS_Backup_File=\\192.168.123.45\d$\PRS_Backup
for /f "delims=" %%i in ('dir /ad /b /s %PRS_File%') do call :CopyFile %%i
echo ***************************************Backup PRS files***************************************************

echo ***************************************Delete 21 days ago files*******************************************
call :DeleteFile E:\PRS
echo ***************************************Delete 21 days ago files*******************************************

echo ***************************************Delete empty folders***********************************************
::Delete empty folders
set count=0
set count_max=10

:del_empty_dir
if %count% GTR %count_max% goto end_del_dir
for /f "delims=" %%i in ('dir /ad /b /s "E:\PRS"') do rd %%i 2>nul
set /a count=%count%+1
goto del_empty_dir 
:end_del_dir
echo ***************************************Delete empty folders***********************************************

goto :end

echo ***************************************DeleteFile Function************************************************
:DeleteFile
echo %1
forfiles /P %1 /S /M * /d -14 /c "cmd /c del /f /q /a @path"
goto :EOF
echo ***************************************DeleteFile Function************************************************


echo ***************************************CopyFile Function**************************************************
:CopyFile
set source=%1
set des=%PRS_Backup_File%%source:~6%

echo %1 | find /i "AA7A"
if errorlevel 1 goto CopyAA7A_TT_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA7A_TT_END

echo %1 | find /i "AA7B"
if errorlevel 1 goto CopyAA7B_TT_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA7B_TT_END

echo %1 | find /i "AA23"
if errorlevel 1 goto CopyAA23_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA23_END

echo %1 | find /i "AA28"
if errorlevel 1 goto CopyAA28_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA28_END

echo %1 | find /i "AA8A"
if errorlevel 1 goto CopyAA8A_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA8A_END

echo %1 | find /i "AA8B"
if errorlevel 1 goto CopyAA8B_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA8B_END

echo %1 | find /i "AA29"
if errorlevel 1 goto CopyAA29_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA29_END

echo %1 | find /i "AA32"
if errorlevel 1 goto CopyAA32_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA32_END

echo %1 | find /i "AA15"
if errorlevel 1 goto CopyAA15_TT_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA15_TT_END

echo %1 | find /i "AA15"
if errorlevel 1 goto CopyAA15_TV_END
echo %1 | find /i "TV"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA15_TV_END

echo %1 | find /i "AA31"
if errorlevel 1 goto CopyAA31_TT_END
echo %1 | find /i "TT"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA31_TT_END

echo %1 | find /i "AA31"
if errorlevel 1 goto CopyAA31_U6_END
echo %1 | find /i "U6"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)
:CopyAA31_U6_END

echo %1 | find /i "QF"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "QV"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "QR"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "TS"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "AF"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)

echo %1 | find /i "DK"
if not errorlevel 1 (
if not exist %des% md %des%
ROBOCOPY %1. %des%. /E /R:2 /W:0
)


goto :EOF
echo ***************************************CopyFile Function**************************************************

:end
