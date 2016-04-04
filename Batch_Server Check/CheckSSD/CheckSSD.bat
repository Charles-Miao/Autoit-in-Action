@echo off

set server_ip=210

set SSDreport=D:\ServerCheck\CheckSSD\%server_ip%_SSDreport.txt
set tempfile=d:\ServerCheck\CheckSSD\temp.txt

c:
cd \"Program Files (x86)\MegaRAID Storage Manager"\MegaMonitor

find /i "to popup via framework" MonitorDbg.log
if not errorlevel 1 echo 192.168.168.%server_ip% has error>%tempfile%
if errorlevel 1 echo 192.168.168.%server_ip% is OK>>%tempfile%

find /i "to popup via framework" MonitorDbg.log.1
if not errorlevel 1 echo 192.168.168.%server_ip% has error>>%tempfile%
if errorlevel 1 echo 192.168.168.%server_ip% is OK>>%tempfile%

find /i "error" in %tempfile%
if not errorlevel 1 echo 192.168.168.%server_ip% SSD has error>%SSDreport%
if errorlevel 1 echo 192.168.168.%server_ip% SSD is OK>%SSDreport%

del %tempfile%

echo open 192.168.168.71 > putreport_ftp.txt
echo imagecrc>> putreport_ftp.txt
echo 5CTEconsole>> putreport_ftp.txt
echo put %SSDreport%>> putreport_ftp.txt
echo bye>> putreport_ftp.txt

ftp -s:putreport_ftp.txt