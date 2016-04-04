net use \\192.168.168.74 /user:admin btco

net use \\192.168.168.76 /user:admin btco
net use \\192.168.168.77 /user:admin btco

net use \\192.168.168.91 /user:admin btco
net use \\192.168.168.88 /user:admin btco

net use \\192.168.123.81 /user:admin btco
net use \\192.168.123.82 /user:admin btco
net use \\192.168.123.84 /user:admin btco
net use \\192.168.123.97 /user:admin btco
net use \\192.168.123.98 /user:admin btco

setlocal enabledelayedexpansion

:start

TITLE "Simlock_A91_P92L"
for /f "tokens=2,3,4,5 delims=/ " %%i in ("%date%") do set dd=%%k-%%i-%%j

call :copyA91_P92LSimlock \\192.168.168.74\vol1\MESSAGE\SFCS\PCBA\Simlock_A91_P92L

call :copyA91_P92LSimlock \\192.168.168.91\vol1\MESSAGE\SFCS\FA\Simlock_A91_P92L
call :copyA91_P92LSimlock \\192.168.168.88\vol1\MESSAGE\SFCS\FA\Simlock_A91_P92L

call :copyA91_P92LSimlock \\192.168.123.84\vol1\MESSAGE\SFCS\PCBA\Simlock_A91_P92L

call :copyA91_P92LSimlock \\192.168.123.97\vol1\MESSAGE\SFCS\FA\Simlock_A91_P92L
call :copyA91_P92LSimlock \\192.168.123.98\vol1\MESSAGE\SFCS\FA\Simlock_A91_P92L

ping 127.0.0.1 -n 4

goto Start

:copyA91_P92LSimlock
echo %1
if not exist E:\Simlock\Simlock_A91_P92L\A91_P92L_Simlock%dd% mkdir E:\Simlock\Simlock_A91_P92L\A91_P92L_Simlock%dd%
for %%i in (%1\*.txt) do (
 copy %%i E:\Simlock\Simlock_A91_P92L\A91_P92L_Simlock%dd% /Y
 del %%i
)
goto :EOF
