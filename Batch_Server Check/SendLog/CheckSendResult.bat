@echo off

set tempfile=e:\sendlog\tempfile.txt
set Sendlogreport=e:\sendlog\Sendlogreport.txt
if exist e:\sendlog\Sendlogreport.txt del e:\sendlog\Sendlogreport.txt
if exist e:\sendlog\tempfile.txt del e:\sendlog\tempfile.txt

e:
cd \sendlog
dir >temp.log

find /i "sendNG.log" temp.log
if not errorlevel 1 echo Send A80 Log has error>>%tempfile%
if errorlevel 1 echo Send A80 Log is OK>>%tempfile%

find /i "sendP05NG.log" temp.log
if not errorlevel 1 echo Send P05 Log has error>>%tempfile%
if errorlevel 1 echo Send P05 Log is OK>>%tempfile%

find /i "sendME302KLNG.log" temp.log
if not errorlevel 1 echo Send ME302KL Log has error>>%tempfile%
if errorlevel 1 echo Send ME302KL Log is OK>>%tempfile%

find /i "error" in %tempfile%
if not errorlevel 1 echo Send log has error>%Sendlogreport%
if errorlevel 1 echo Send log is OK>%Sendlogreport%

echo open 192.168.168.71 > putreport_ftp.txt
echo imagecrc>> putreport_ftp.txt
echo 5CTEconsole>> putreport_ftp.txt
echo put %Sendlogreport%>> putreport_ftp.txt
echo bye>> putreport_ftp.txt

ftp -s:putreport_ftp.txt