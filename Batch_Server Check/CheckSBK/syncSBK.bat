@echo off

echo ===========================================================================
echo Check Server SBK Files, please don't close this Windows, thanks! Charles
echo ===========================================================================

set Server_ip=91
set LOGFile=D:\ServerCheck\CheckSBK\%server_ip%_CheckSBK.log
set Templogfile=d:\servercheck\checksbk\%server_ip%_tempchecksbk.log
set year=
set month=
set day=
set nowdate=


for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set month=%%a
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set day=%%b
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do set year=%%c
set nowdate=%year%%month%%day%

if exist D:\ServerCheck\CheckSBK\%server_ip%_CheckSBK.log del D:\ServerCheck\CheckSBK\%server_ip%_CheckSBK.log
if exist d:\servercheck\checksbk\%server_ip%_tempchecksbk.log del d:\servercheck\checksbk\%server_ip%_tempchecksbk.log


echo ***************************************SBK*******************************************
ROBOCOPY \\192.168.168.237\e$\SBK. D:\SBK. /E /R:2 /W:0 /mir /LOG:D:\ServerCheck\CheckSBK\robocopy_all.log /TEE
if errorlevel 10 goto Allfail10
if errorlevel 8 goto Allfail8
if errorlevel 4 goto Allfail4
if errorlevel 2 goto Allpass2
if errorlevel 1 goto Allpass1
if errorlevel 0 goto Allpass0
:Allfail10
echo  When check the SBK files, the error code is "serious error. Robocopy did not copy any files".>>%tempLOGFile%
goto Allend
:Allfail8
echo  When check the SBK files, the error code is "some files or directories could not be copied".>>%tempLOGFile%
goto Allend
:Allfail4
echo  When check the SBK files, the error code is "some mismatched files or directoried were detected".>>%tempLOGFile%
goto Allend
:Allpass2
echo  When check the SBK files, the pass code is "some extra files or directories were detected".>>%tempLOGFile%
goto Allend
:Allpass1
echo  When check the SBK files, the pass code is "one or more files were copied successfully".>>%tempLOGFile%
goto Allend
:Allpass0
echo  When check the SBK files, the pass code is "no errors, no copying was done".>>%tempLOGFile%
goto Allend
:Allend

find /i "error code" %templogfile%
if not errorlevel 1 echo 192.168.168.%server_ip% Check SBK has error>%logfile%
if errorlevel 1 echo 192.168.168.%server_ip% Check SBK is OK>%logfile%

d:
cd \ServerCheck\CheckSBK

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %LOGFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt

if not exist D:\ServerCheck\CheckSBK\%nowdate%\NUL MD D:\ServerCheck\CheckSBK\%nowdate%
Move /y *.log D:\ServerCheck\CheckSBK\%nowdate%
Move /y *.txt D:\ServerCheck\CheckSBK\%nowdate%