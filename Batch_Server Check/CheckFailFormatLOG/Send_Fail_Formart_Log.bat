@echo off
set p1=E:\LOG\NG_LOG

del %p1%\*_T5-* /q
::PCBA RF
del %p1%\*_UC-* /q
del %p1%\*_UD-* /q
del %p1%\*_UE-* /q
del %p1%\*_UF-* /q
del %p1%\*_UA-* /q
del %p1%\*_TY-* /q
del %p1%\*_UB-* /q
del %p1%\*_UR-* /q
::FA RF
del %p1%\*_S3-* /q
del %p1%\*_S4-* /q
del %p1%\*_S7-* /q
del %p1%\*_T6-* /q
del %p1%\*_T7-* /q
del %p1%\*_U1-* /q
del %p1%\*_U2-* /q
del %p1%\*_U4-* /q
::OOB RF
del %p1%\*_Q1-* /q
del %p1%\*_Q2-* /q
del %p1%\*_Q4-* /q
del %p1%\*_Q5-* /q
del %p1%\*_Q6-* /q
del %p1%\*_Q7-* /q


dir /a /b e:\log\ng_log|findstr .* >nul||echo file is empty
if not errorlevel 1 goto notempty
if errorlevel 1 goto empty

:notempty
echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
7z.exe -tzip  a %P1%.zip %P1%
echo put %P1%.zip>>tmp_ftp.txt
echo bye>>tmp_ftp.txt
ftp -s:tmp_ftp.txt

del %P1%\*.* /q
del e:\log\*.zip /q

goto pass
:empty
echo file is empty>temp.txt
echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put temp.txt>>tmp_ftp.txt
echo bye>>tmp_ftp.txt
ftp -s:tmp_ftp.txt


goto pass

:pass