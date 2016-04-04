net use \\192.168.168.74 /user:admin btco
net use \\192.168.168.88 /user:admin btco
net use \\192.168.168.91 /user:admin btco

net use \\192.168.123.84 /user:admin btco
net use \\192.168.123.97 /user:admin btco
net use \\192.168.123.98 /user:admin btco

setlocal enabledelayedexpansion

:start

TITLE "ME102A_Efuse"
for /f "tokens=2,3,4,5 delims=/ " %%i in ("%date%") do set dd=%%k-%%i-%%j
for /f "tokens=1,2,3 delims=-" %%i in ('dateadd.exe -1') do set deld=%%j/%%k/%%i
call :copyME102AEfuse \\192.168.168.74\vol1\MESSAGE\SFCS\PCBA\Efuse_ME102A

call :copyME102AEfuse \\192.168.168.91\vol1\MESSAGE\SFCS\FA\Efuse_ME102A
call :copyME102AEfuse \\192.168.168.88\vol1\MESSAGE\SFCS\FA\Efuse_ME102A

call :copyME102AEfuse \\192.168.123.84\vol1\MESSAGE\SFCS\PCBA\Efuse_ME102A
call :copyME102AEfuse \\192.168.123.97\vol1\MESSAGE\SFCS\FA\Efuse_ME102A
call :copyME102AEfuse \\192.168.123.98\vol1\MESSAGE\SFCS\FA\Efuse_ME102A

::pause
::ping 127.0.0.1 -n 4

::goto Start
exit

:copyME102AEfuse
echo %1
if not exist E:\Efuse\Efuse_ME102A\ME102A_Efuse%dd% mkdir E:\Efuse\Efuse_ME102A\ME102A_Efuse%dd%
::for %%i in (%1\*.txt) do (
::  copy %%i E:\Efuse\Efuse_ME102A\ME102A_Efuse%dd%\ /Y

::del %%i
::)

pushd "%1"
xcopy "%1" E:\Efuse\Efuse_ME102A\ME102A_Efuse%dd% /e /d /y
for /f "delims==" %%i in ('dir /b') do if "%%~ti" lss "%deld% 01:00 AM" rd "%%i" /s /q
::pause
popd

goto :EOF
