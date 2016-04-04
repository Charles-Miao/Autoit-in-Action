@echo off

set server_ip=230

set servertime=D:\ServerCheck\GetTime\%server_ip%_time.txt

time /t >%servertime%

d:
cd \ServerCheck\GetTime

echo open 192.168.168.71 > putreport_ftp.txt
echo imagecrc>> putreport_ftp.txt
echo 5CTEconsole>> putreport_ftp.txt
echo put %servertime%>> putreport_ftp.txt
echo bye>> putreport_ftp.txt

ftp -s:putreport_ftp.txt