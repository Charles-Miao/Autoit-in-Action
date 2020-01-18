@echo off&setlocal enabledelayedexpansion

for /f "tokens=1 delims=:" %%i in ('findstr /n .* ..\set.txt') do set line=%%i
set n=1

for /f "delims=" %%i in (var.txt) do (
for /f "tokens=2 delims=:" %%j in (..\set.txt) do set %%i=%%j&goto contiune)

:contiune
for /f "skip=%n% delims=" %%i in (var.txt) do (
for /f "skip=%n% tokens=2 delims=:" %%j in (..\set.txt) do set %%i=%%j&goto plus
)

:plus
set /a n+=1
if %n%==%line% goto end

goto contiune

:end

:GetStart
::for /f "delims=" %%i in ('dir /b /a-h-s-a-r /s /O:E ".."') do @echo %%~fi & set Updatedirectory=%%~fi
cd ..
attrib +h setdir.bat
call setdir.bat
::echo %Updatedirectory%
::pause
::FOR /f "tokens=1 delims=@" %%i IN ('dir /b @start.bat') DO @echo %%~fi & set Updatedirectory=%%~fi
::FOR /f %%i IN ('dir /b @start.bat') DO @echo %%~fi & set Updatestart=%%~fi
::copy Update.txt Updatebak.txt /y
cd /d .\software
::echo %Updatestart%>Getdir.txt
::for /f "tokens=1 delims=@" %i in (Getdir.txt) do set Updatedirectory=%%i
::for /f "tokens=1 delims=:" %%i in ('findstr /i /n start.bat update.txt') do set /a m=%%i-1
::for /f "skip=%m% delims=" %%i in (Update.txt) do (

::pause
:Change

::if %station%==TM 
::if %station%==TN
::if %station%==T1
::del /f /q "%USERPROFILE%\DESKTOP\quit.lnk"


::refreshicon.exe
cd ..
::.\software\SHORTCUT.EXE -F -t "quit.bat" -n "%USERPROFILE%\DESKTOP\quit.lnk" 
.\software\BeeNotice.exe /m:"%message%" /x:%X position% /y:%Y position% /xb:1 /yb:1 /t:%display time% /f:"%font name%" /fh:%font height% /fw:0 /a:1 /o:255 /ftc:"%font text color%" /tc:"%transparency color%" /fbc:"%font background color%" /wc:"%window color%"
exit


