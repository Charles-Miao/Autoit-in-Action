@echo off

set server_ip=71

set serverspace=D:\ServerCheck\ServerSpace\%server_ip%_space.txt

d:
cd \ServerCheck\ServerSpace
dir d: | find /i "bytes free" >freespace.txt
for /f "tokens=3" %%i in (freespace.txt) do set space=%%i
echo %space% >%Serverspace%


echo open 192.168.168.71 > putreport_ftp.txt
echo imagecrc>> putreport_ftp.txt
echo 5CTEconsole>> putreport_ftp.txt
echo put %serverspace%>> putreport_ftp.txt
echo bye>> putreport_ftp.txt

ftp -s:putreport_ftp.txt