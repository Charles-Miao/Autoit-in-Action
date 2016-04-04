@echo on
path | find /i "\tool;" >nul || path=%path%;..\..\tool;..\tool;.\tool
call Log.bat start %0 %1
call c:\info.bat

REM ----------------------- Main Program -----------------------------
:Init
Set USL=OK
Set LSL=OK
set Msg=%~n0 return:

set mac_[1]=
set mac_[2]=
set mac_[3]=
set mac_[4]=
set mac_[5]=

:Four_Slot_Ethernet_Cradle

::check mac_address
find /n "dynamic" mac_address.txt > mac.txt
for /f "tokens=1,3" %%i in (mac.txt) do set mac_%%i=%%j
if @%mac_[1]%==@%mac_[2]% goto fail
if @%mac_[1]%==@%mac_[3]% goto fail
if @%mac_[1]%==@%mac_[4]% goto fail
if @%mac_[1]%==@%mac_[5]% goto fail

if @%mac_[2]%==@%mac_[3]% goto fail
if @%mac_[2]%==@%mac_[4]% goto fail
if @%mac_[2]%==@%mac_[5]% goto fail

if @%mac_[3]%==@%mac_[4]% goto fail
if @%mac_[3]%==@%mac_[5]% goto fail

if @%mac_[4]%==@%mac_[5]% goto fail

if @%mac_[1]%==@ goto Fail
if @%mac_[2]%==@ goto Fail
if @%mac_[3]%==@ goto Fail
if @%mac_[4]%==@ goto Fail
if @%mac_[5]%==@ goto Fail

if @%mac_[1]%==@dynamic goto Fail
if @%mac_[2]%==@dynamic goto Fail
if @%mac_[3]%==@dynamic goto Fail
if @%mac_[4]%==@dynamic goto Fail
if @%mac_[5]%==@dynamic goto Fail

goto pass

:Fail

:Copy_LOG
set PATH_2SFCS=\\172.168.168.203\Test_LOG
net use   %Path_2SFCS% /user:admin btco
for /f %%i in ('datex -f yyyy_mm_dd') do set Date_Now=%%i
if not exist %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE% mkdir %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE%
COPY /b C:\VT208@ACC\Station\ZB_Function\mac_address.txt %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE%\%STAGE%-%USN%.log /Y

call log.bat Fail
goto End


:Pass

:Copy_LOG
set PATH_2SFCS=\\172.168.168.203\Test_LOG
net use   %Path_2SFCS% /user:admin btco
for /f %%i in ('datex -f yyyy_mm_dd') do set Date_Now=%%i
if not exist %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE% mkdir %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE%
COPY /b C:\VT208@ACC\Station\ZB_Function\mac_address.txt %Path_2SFCS%\%ModelID%\%Date_Now%\%STAGE%\%STAGE%-%USN%.log /Y

call log.bat Pass
goto End

:End

