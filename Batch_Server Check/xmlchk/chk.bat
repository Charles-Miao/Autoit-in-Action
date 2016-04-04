@echo off
for %%i in (D:\XML\Source\*.xml) do call :CheckXML %%i D:\XML\PASS\%%~ni.xml D:\XML\FAIL\%%~ni.xml

goto end

echo ***************************************CheckXML Function************************************************
:CheckXML
set src=%1
set dst_pass=%2
set dst_fail=%3
echo %src%

xmlchk %src%
if errorlevel 1 goto CheckXMLfail
goto CheckXMLpass

:CheckXMLpass
move /y %src% %dst_pass%
goto CheckXMLend

:CheckXMLfail
move /y %src% %dst_fail%
goto CheckXMLend

:CheckXMLend

goto :EOF
echo ***************************************CheckXML Function************************************************

:end
