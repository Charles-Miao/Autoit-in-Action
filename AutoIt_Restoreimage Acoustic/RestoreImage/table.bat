chcp 437

:start
::get mac address
del mac_address.txt /f /q
ipconfig /all | find /i "Physical Address" >mac_address.txt
for /f "tokens=12" %%i in (mac_address.txt) do set mac_address=%%i
echo %mac_address%

::get imagename
set imagename=NA
if @%mac_address%==@2C-41-38-5D-03-18 set imagename=san_virus_pc.gho

if @%mac_address%==@90-2B-34-7E-F3-37 set imagename=VT306_DP1_1218.gho
if @%mac_address%==@50-E5-49-A5-3D-36 set imagename=VT306_DP2_1027.gho

if @%mac_address%==@44-8A-5B-64-30-C5 set imagename=QP200_GA_DP1_1029.gho

if @%mac_address%==@94-DE-80-AC-D0-3E set imagename=QA100_DP1_1027.GHO

if @%mac_address%==@94-DE-80-A7-5D-79 set imagename=QP200_DP1_1028.GHO
if @%mac_address%==@44-8A-5B-64-2F-CB set imagename=QP200_DP2_1028.GHO
if @%imagename%==@NA goto start

::ghost
echo imagename=%imagename%
ghost32 -clone,mode=load,src=%ivol%\%imagename%,dst=1 -fdsp -ib -fnf -fx -auto -sure
if not errorlevel 1 goto end

:ghostng
echo ghost ng
pause>nul
goto start

:end