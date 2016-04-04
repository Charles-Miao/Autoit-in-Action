@echo off

set server_ip=91

set SecCopyreport=D:\ServerCheck\CheckSecCopy\%server_ip%_SecCopyreport.txt
set tempfile=d:\ServerCheck\CheckSecCopy\temp.txt

c:
cd \"Program Files (x86)"\SecCopy

find /i "errors" log.rtf
if not errorlevel 1 echo 192.168.168.%server_ip% has error>%tempfile%
if errorlevel 1 echo 192.168.168.%server_ip% is OK>>%tempfile%

::find /i "error" log-old.rtf
::if not errorlevel 1 echo 192.168.168.%server_ip% has error>>%tempfile%
::if errorlevel 1 echo 192.168.168.%server_ip% is OK>>%tempfile%

find /i "error" in %tempfile%
if not errorlevel 1 echo 192.168.168.%server_ip% SecCopy has error>%SecCopyreport%
if errorlevel 1 echo 192.168.168.%server_ip% SecCopy is OK>%SecCopyreport%

del %tempfile%

echo open 192.168.168.71 > putreport_ftp.txt
echo imagecrc>> putreport_ftp.txt
echo 5CTEconsole>> putreport_ftp.txt
echo put %SecCopyreport%>> putreport_ftp.txt
echo bye>> putreport_ftp.txt

ftp -s:putreport_ftp.txt