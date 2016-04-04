setlocal 

set REPOS=%1
set TXN=%2

REM Make sure that the log message contains some text.
FOR /F "usebackq delims==" %%g IN (`"%VISUALSVN_SERVER%\bin\svnlook.exe" log -t %TXN% %REPOS% ^| FINDSTR /R /C:......`) DO goto NORMAL_EXIT


:ERROR_TOO_SHORT
echo "Commit note must be at least 6 letters" >&2
goto ERROR_EXIT

:ERROR_EXIT
exit /b 1

REM All checks passed, so allow the commit.
:NORMAL_EXIT
exit 0