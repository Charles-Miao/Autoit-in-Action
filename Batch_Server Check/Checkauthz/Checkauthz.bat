@echo off


set ConfigFile=E:\svn_config\authz.conf

d:
cd \ServerCheck\Checkauthz

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %ConfigFile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt
