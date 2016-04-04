@echo off

set listfile=D:\ServerCheck\CheckSVN\list.txt
set headfile=D:\ServerCheck\CheckSVN\Head.txt
set tempfile=D:\ServerCheck\CheckSVN\CheckSVN.txt


if exist %listfile% del %listfile%
if exist %headfile% del %headfile%
if exist %tempfile% del %tempfile%
d:
cd D:\ServerCheck\CheckSVN

::Check ME372CG_FA_Preload
set modelfile=E:\MainServer\ME372CG_FA_Preload
svn list -v %modelfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CG_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372KGEND
svn log -r %k% -v %modelfile%>>%tempfile%
svn diff -r %j%:%k% %modelfile%>>%tempfile% 
echo %k%
echo %k% >ME372CG_Ver
:ME372KGEND
del %listfile%
del %headfile%

::Check ME372CG_PCBA
set ME372CG_PCBAfile=E:\MainServer\ME372CG_PCBA
svn list -v %ME372CG_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CG_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372CG_PCBA_END
svn log -r %k% -v %ME372CG_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME372CG_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME372CG_PCBA_Ver
:ME372CG_PCBA_END
del %listfile%
del %headfile%

::Check A86_FA_Preload
set A86_FA_Preloadfile=E:\MainServer\A86_FA_Preload
svn list -v %A86_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A86_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A86_FA_Preload_END
svn log -r %k% -v %A86_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A86_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A86_FA_Preload_Ver
:A86_FA_Preload_END
del %listfile%
del %headfile%

::Check A86_PCBA
set A86_PCBAfile=E:\MainServer\A86_PCBA
svn list -v %A86_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A86_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A86_PCBA_END
svn log -r %k% -v %A86_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A86_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A86_PCBA_Ver
:A86_PCBA_END
del %listfile%
del %headfile%

::Check ME102A_FA_Preload
set ME102A_FA_Preloadfile=E:\MainServer\ME102A_FA_Preload
svn list -v %ME102A_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME102A_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME102A_FA_Preload_END
svn log -r %k% -v %ME102A_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME102A_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME102A_FA_Preload_Ver
:ME102A_FA_Preload_END
del %listfile%
del %headfile%

::Check ME102A_PCBA
set ME102A_PCBAfile=E:\MainServer\ME102A_PCBA
svn list -v %ME102A_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME102A_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME102A_PCBA_END
svn log -r %k% -v %ME102A_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME102A_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME102A_PCBA_Ver
:ME102A_PCBA_END
del %listfile%
del %headfile%

::Check ME175KG_FA_Preload
set ME175KG_FA_Preloadfile=E:\MainServer\ME175KG_FA_Preload
svn list -v %ME175KG_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME175KG_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME175KG_FA_Preload_END
svn log -r %k% -v %ME175KG_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME175KG_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME175KG_FA_Preload_Ver
:ME175KG_FA_Preload_END
del %listfile%
del %headfile%

::Check ME175KG_PCBA
set ME175KG_PCBAfile=E:\MainServer\ME175KG_PCBA
svn list -v %ME175KG_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME175KG_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME175KG_PCBA_END
svn log -r %k% -v %ME175KG_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME175KG_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME175KG_PCBA_Ver
:ME175KG_PCBA_END
del %listfile%
del %headfile%

::Check ME180A_FA_Preload
set ME180A_FA_Preloadfile=E:\MainServer\ME180A_FA_Preload
svn list -v %ME180A_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME180A_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME180A_FA_Preload_END
svn log -r %k% -v %ME180A_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME180A_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME180A_FA_Preload_Ver
:ME180A_FA_Preload_END
del %listfile%
del %headfile%

::Check ME180A_PCBA
set ME180A_PCBAfile=E:\MainServer\ME180A_PCBA
svn list -v %ME180A_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME180A_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME180A_PCBA_END
svn log -r %k% -v %ME180A_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME180A_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME180A_PCBA_Ver
:ME180A_PCBA_END
del %listfile%
del %headfile%

::Check QC888_FA_Preload
set QC888_FA_Preloadfile=E:\MainServer\QC888_FA_Preload
svn list -v %QC888_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type QC888_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto QC888_FA_Preload_END
svn log -r %k% -v %QC888_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %QC888_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >QC888_FA_Preload_Ver
:QC888_FA_Preload_END
del %listfile%
del %headfile%

::Check QC888_PCBA
set QC888_PCBAfile=E:\MainServer\QC888_PCBA
svn list -v %QC888_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type QC888_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto QC888_PCBA_END
svn log -r %k% -v %QC888_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %QC888_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >QC888_PCBA_Ver
:QC888_PCBA_END
del %listfile%
del %headfile%

::Check DORA_FA_Preload
set DORA_FA_Preloadfile=E:\MainServer\DORA_FA_Preload
svn list -v %DORA_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type DORA_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto DORA_FA_Preload_END
svn log -r %k% -v %DORA_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %DORA_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >DORA_FA_Preload_Ver
:DORA_FA_Preload_END
del %listfile%
del %headfile%

::Check DORA_PCBA
set DORA_PCBAfile=E:\MainServer\DORA_PCBA
svn list -v %DORA_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type DORA_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto DORA_PCBA_END
svn log -r %k% -v %DORA_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %DORA_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >DORA_PCBA_Ver
:DORA_PCBA_END
del %listfile%
del %headfile%

::Check KAREN_FA_Preload
set KAREN_FA_Preloadfile=E:\MainServer\KAREN_FA_Preload
svn list -v %KAREN_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type KAREN_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto KAREN_FA_Preload_END
svn log -r %k% -v %KAREN_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %KAREN_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >KAREN_FA_Preload_Ver
:KAREN_FA_Preload_END
del %listfile%
del %headfile%

::Check KAREN_PCBA
set KAREN_PCBAfile=E:\MainServer\KAREN_PCBA
svn list -v %KAREN_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type KAREN_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto KAREN_PCBA_END
svn log -r %k% -v %KAREN_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %KAREN_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >KAREN_PCBA_Ver
:KAREN_PCBA_END
del %listfile%
del %headfile%

::Check ME302C_FA_Preload
set ME302C_FA_Preloadfile=E:\MainServer\ME302C_FA_Preload
svn list -v %ME302C_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME302C_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME302C_FA_Preload_END
svn log -r %k% -v %ME302C_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME302C_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME302C_FA_Preload_Ver
:ME302C_FA_Preload_END
del %listfile%
del %headfile%

::Check ME302C_PCBA
set ME302C_PCBAfile=E:\MainServer\ME302C_PCBA
svn list -v %ME302C_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME302C_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME302C_PCBA_END
svn log -r %k% -v %ME302C_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME302C_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME302C_PCBA_Ver
:ME302C_PCBA_END
del %listfile%
del %headfile%

::Check ME302KL_FA_Preload
set ME302KL_FA_Preloadfile=E:\MainServer\ME302KL_FA_Preload
svn list -v %ME302KL_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME302KL_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME302KL_FA_Preload_END
svn log -r %k% -v %ME302KL_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME302KL_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME302KL_FA_Preload_Ver
:ME302KL_FA_Preload_END
del %listfile%
del %headfile%

::Check ME302KL_PCBA
set ME302KL_PCBAfile=E:\MainServer\ME302KL_PCBA
svn list -v %ME302KL_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME302KL_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME302KL_PCBA_END
svn log -r %k% -v %ME302KL_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME302KL_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME302KL_PCBA_Ver
:ME302KL_PCBA_END
del %listfile%
del %headfile%

::Check NEW_UI_FA_Preload
set NEW_UI_FA_Preloadfile=E:\MainServer\NEW_UI_FA_Preload
svn list -v %NEW_UI_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type NEW_UI_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto NEW_UI_FA_Preload_END
svn log -r %k% -v %NEW_UI_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %NEW_UI_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >NEW_UI_FA_Preload_Ver
:NEW_UI_FA_Preload_END
del %listfile%
del %headfile%

::Check NEW_UI_PCBA
set NEW_UI_PCBAfile=E:\MainServer\NEW_UI_PCBA
svn list -v %NEW_UI_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type NEW_UI_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto NEW_UI_PCBA_END
svn log -r %k% -v %NEW_UI_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %NEW_UI_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >NEW_UI_PCBA_Ver
:NEW_UI_PCBA_END
del %listfile%
del %headfile%

::Check ME560CG_FA_Preload
set ME560CG_FA_Preloadfile=E:\MainServer\ME560CG_FA_Preload
svn list -v %ME560CG_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME560CG_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME560CG_FA_Preload_END
svn log -r %k% -v %ME560CG_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME560CG_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME560CG_FA_Preload_Ver
:ME560CG_FA_Preload_END
del %listfile%
del %headfile%

::Check ME560CG_PCBA
set ME560CG_PCBAfile=E:\MainServer\ME560CG_PCBA
svn list -v %ME560CG_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME560CG_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME560CG_PCBA_END
svn log -r %k% -v %ME560CG_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME560CG_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME560CG_PCBA_Ver
:ME560CG_PCBA_END
del %listfile%
del %headfile%

::Check A80_FA_Preload
set A80_FA_Preloadfile=E:\MainServer\A80_FA_Preload
svn list -v %A80_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A80_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A80_FA_Preload_END
svn log -r %k% -v %A80_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A80_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A80_FA_Preload_Ver
:A80_FA_Preload_END
del %listfile%
del %headfile%

::Check A80_PCBA
set A80_PCBAfile=E:\MainServer\A80_PCBA
svn list -v %A80_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A80_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A80_PCBA_END
svn log -r %k% -v %A80_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A80_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A80_PCBA_Ver
:A80_PCBA_END
del %listfile%
del %headfile%

::Check P05_FA_Preload
set P05_FA_Preloadfile=E:\MainServer\P05_FA_Preload
svn list -v %P05_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P05_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P05_FA_Preload_END
svn log -r %k% -v %P05_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %P05_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >P05_FA_Preload_Ver
:P05_FA_Preload_END
del %listfile%
del %headfile%

::Check P05_PCBA
set P05_PCBAfile=E:\MainServer\P05_PCBA
svn list -v %P05_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P05_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P05_PCBA_END
svn log -r %k% -v %P05_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %P05_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >P05_PCBA_Ver
:P05_PCBA_END
del %listfile%
del %headfile%

::Check A11_FA_Preload
set A11_FA_Preloadfile=E:\MainServer\A11_FA_Preload
svn list -v %A11_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A11_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A11_FA_Preload_END
svn log -r %k% -v %A11_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A11_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A11_FA_Preload_Ver
:A11_FA_Preload_END
del %listfile%
del %headfile%

::Check A11_PCBA
set A11_PCBAfile=E:\MainServer\A11_PCBA
svn list -v %A11_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A11_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A11_PCBA_END
svn log -r %k% -v %A11_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A11_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A11_PCBA_Ver
:A11_PCBA_END
del %listfile%
del %headfile%

::Check A68M_FA_Preload
set A68M_FA_Preloadfile=E:\MainServer\A68M_FA_Preload
svn list -v %A68M_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A68M_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A68M_FA_Preload_END
svn log -r %k% -v %A68M_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A68M_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A68M_FA_Preload_Ver
:A68M_FA_Preload_END
del %listfile%
del %headfile%

::Check A68M_PCBA
set A68M_PCBAfile=E:\MainServer\A68M_PCBA
svn list -v %A68M_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A68M_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A68M_PCBA_END
svn log -r %k% -v %A68M_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A68M_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A68M_PCBA_Ver
:A68M_PCBA_END
del %listfile%
del %headfile%

::Check Bina_JR_FA_Preload
set Bina_JR_FA_Preloadfile=E:\MainServer\Bina_JR_FA_Preload
svn list -v %Bina_JR_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Bina_JR_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Bina_JR_FA_Preload_END
svn log -r %k% -v %Bina_JR_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Bina_JR_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Bina_JR_FA_Preload_Ver
:Bina_JR_FA_Preload_END
del %listfile%
del %headfile%

::Check Bina_JR_PCBA
set Bina_JR_PCBAfile=E:\MainServer\Bina_JR_PCBA
svn list -v %Bina_JR_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Bina_JR_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Bina_JR_PCBA_END
svn log -r %k% -v %Bina_JR_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Bina_JR_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Bina_JR_PCBA_Ver
:Bina_JR_PCBA_END
del %listfile%
del %headfile%

::Check ME175CG_FA_Preload
set ME175CG_FA_Preloadfile=E:\MainServer\ME175CG_FA_Preload
svn list -v %ME175CG_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME175CG_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME175CG_FA_Preload_END
svn log -r %k% -v %ME175CG_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME175CG_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME175CG_FA_Preload_Ver
:ME175CG_FA_Preload_END
del %listfile%
del %headfile%

::Check ME175CG_PCBA
set ME175CG_PCBAfile=E:\MainServer\ME175CG_PCBA
svn list -v %ME175CG_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME175CG_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME175CG_PCBA_END
svn log -r %k% -v %ME175CG_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME175CG_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME175CG_PCBA_Ver
:ME175CG_PCBA_END
del %listfile%
del %headfile%

::Check ME301T_FA_Preload
set ME301T_FA_Preloadfile=E:\MainServer\ME301T_FA_Preload
svn list -v %ME301T_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME301T_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME301T_FA_Preload_END
svn log -r %k% -v %ME301T_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME301T_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME301T_FA_Preload_Ver
:ME301T_FA_Preload_END
del %listfile%
del %headfile%

::Check ME301T_PCBA
set ME301T_PCBAfile=E:\MainServer\ME301T_PCBA
svn list -v %ME301T_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME301T_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME301T_PCBA_END
svn log -r %k% -v %ME301T_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME301T_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME301T_PCBA_Ver
:ME301T_PCBA_END
del %listfile%
del %headfile%

::Check ME372CG_CR_FA_Preload
set ME372CG_CR_FA_Preloadfile=E:\MainServer\ME372CG_CR_FA_Preload
svn list -v %ME372CG_CR_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CG_CR_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372CG_CR_FA_Preload_END
svn log -r %k% -v %ME372CG_CR_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME372CG_CR_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME372CG_CR_FA_Preload_Ver
:ME372CG_CR_FA_Preload_END
del %listfile%
del %headfile%

::Check ME372CG_CR_PCBA
set ME372CG_CR_PCBAfile=E:\MainServer\ME372CG_CR_PCBA
svn list -v %ME372CG_CR_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CG_CR_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372CG_CR_PCBA_END
svn log -r %k% -v %ME372CG_CR_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME372CG_CR_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME372CG_CR_PCBA_Ver
:ME372CG_CR_PCBA_END
del %listfile%
del %headfile%

::Check ME372CL_FA_Preload
set ME372CL_FA_Preloadfile=E:\MainServer\ME372CL_FA_Preload
svn list -v %ME372CL_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CL_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372CL_FA_Preload_END
svn log -r %k% -v %ME372CL_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %ME372CL_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >ME372CL_FA_Preload_Ver
:ME372CL_FA_Preload_END
del %listfile%
del %headfile%

::Check ME372CL_PCBA
set ME372CL_PCBAfile=E:\MainServer\ME372CL_PCBA
svn list -v %ME372CL_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type ME372CL_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto ME372CL_PCBA_END
svn log -r %k% -v %ME372CL_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %ME372CL_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >ME372CL_PCBA_Ver
:ME372CL_PCBA_END
del %listfile%
del %headfile%

::Check P71L_FA_Preload
set P71L_FA_Preloadfile=E:\MainServer\P71L_FA_Preload
svn list -v %P71L_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P71L_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P71L_FA_Preload_END
svn log -r %k% -v %P71L_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %P71L_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >P71L_FA_Preload_Ver
:P71L_FA_Preload_END
del %listfile%
del %headfile%

::Check P71L_PCBA
set P71L_PCBAfile=E:\MainServer\P71L_PCBA
svn list -v %P71L_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P71L_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P71L_PCBA_END
svn log -r %k% -v %P71L_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %P71L_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >P71L_PCBA_Ver
:P71L_PCBA_END
del %listfile%
del %headfile%

::Check P101G_FA_Preload
set P101G_FA_Preloadfile=E:\MainServer\P101G_FA_Preload
svn list -v %P101G_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P101G_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P101G_FA_Preload_END
svn log -r %k% -v %P101G_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %P101G_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >P101G_FA_Preload_Ver
:P101G_FA_Preload_END
del %listfile%
del %headfile%

::Check P101G_PCBA
set P101G_PCBAfile=E:\MainServer\P101G_PCBA
svn list -v %P101G_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P101G_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P101G_PCBA_END
svn log -r %k% -v %P101G_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %P101G_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >P101G_PCBA_Ver
:P101G_PCBA_END
del %listfile%
del %headfile%

::Check Padfone_FA_Preload
set Padfone_FA_Preloadfile=E:\MainServer\Padfone_FA_Preload
svn list -v %Padfone_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Padfone_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Padfone_FA_Preload_END
svn log -r %k% -v %Padfone_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Padfone_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Padfone_FA_Preload_Ver
:Padfone_FA_Preload_END
del %listfile%
del %headfile%

::Check Padfone_PCBA
set Padfone_PCBAfile=E:\MainServer\Padfone_PCBA
svn list -v %Padfone_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Padfone_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Padfone_PCBA_END
svn log -r %k% -v %Padfone_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Padfone_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Padfone_PCBA_Ver
:Padfone_PCBA_END
del %listfile%
del %headfile%

::Check T7450_FA_Preload
set T7450_FA_Preloadfile=E:\MainServer\T7450_FA_Preload
svn list -v %T7450_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type T7450_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto T7450_FA_Preload_END
svn log -r %k% -v %T7450_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %T7450_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >T7450_FA_Preload_Ver
:T7450_FA_Preload_END
del %listfile%
del %headfile%

::Check T7450_PCBA
set T7450_PCBAfile=E:\MainServer\T7450_PCBA
svn list -v %T7450_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type T7450_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto T7450_PCBA_END
svn log -r %k% -v %T7450_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %T7450_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >T7450_PCBA_Ver
:T7450_PCBA_END
del %listfile%
del %headfile%

::Check T9600_FA_Preload
set T9600_FA_Preloadfile=E:\MainServer\T9600_FA_Preload
svn list -v %T9600_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type T9600_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto T9600_FA_Preload_END
svn log -r %k% -v %T9600_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %T9600_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >T9600_FA_Preload_Ver
:T9600_FA_Preload_END
del %listfile%
del %headfile%

::Check T9600_PCBA
set T9600_PCBAfile=E:\MainServer\T9600_PCBA
svn list -v %T9600_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type T9600_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto T9600_PCBA_END
svn log -r %k% -v %T9600_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %T9600_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >T9600_PCBA_Ver
:T9600_PCBA_END
del %listfile%
del %headfile%

::Check TBU_NEW_UI_FA_Preload
set TBU_NEW_UI_FA_Preloadfile=E:\MainServer\TBU_NEW_UI_FA_Preload
svn list -v %TBU_NEW_UI_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TBU_NEW_UI_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TBU_NEW_UI_FA_Preload_END
svn log -r %k% -v %TBU_NEW_UI_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %TBU_NEW_UI_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >TBU_NEW_UI_FA_Preload_Ver
:TBU_NEW_UI_FA_Preload_END
del %listfile%
del %headfile%

::Check TBU_NEW_UI_PCBA
set TBU_NEW_UI_PCBAfile=E:\MainServer\TBU_NEW_UI_PCBA
svn list -v %TBU_NEW_UI_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TBU_NEW_UI_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TBU_NEW_UI_PCBA_END
svn log -r %k% -v %TBU_NEW_UI_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %TBU_NEW_UI_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >TBU_NEW_UI_PCBA_Ver
:TBU_NEW_UI_PCBA_END
del %listfile%
del %headfile%

::Check TF300T_FA_Preload
set TF300T_FA_Preloadfile=E:\MainServer\TF300T_FA_Preload
svn list -v %TF300T_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300T_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300T_FA_Preload_END
svn log -r %k% -v %TF300T_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %TF300T_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >TF300T_FA_Preload_Ver
:TF300T_FA_Preload_END
del %listfile%
del %headfile%

::Check TF300T_PCBA
set TF300T_PCBAfile=E:\MainServer\TF300T_PCBA
svn list -v %TF300T_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300T_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300T_PCBA_END
svn log -r %k% -v %TF300T_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %TF300T_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >TF300T_PCBA_Ver
:TF300T_PCBA_END
del %listfile%
del %headfile%

::Check TF300TG_FA_Preload
set TF300TG_FA_Preloadfile=E:\MainServer\TF300TG_FA_Preload
svn list -v %TF300TG_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300TG_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300TG_FA_Preload_END
svn log -r %k% -v %TF300TG_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %TF300TG_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >TF300TG_FA_Preload_Ver
:TF300TG_FA_Preload_END
del %listfile%
del %headfile%

::Check TF300TG_PCBA
set TF300TG_PCBAfile=E:\MainServer\TF300TG_PCBA
svn list -v %TF300TG_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300TG_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300TG_PCBA_END
svn log -r %k% -v %TF300TG_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %TF300TG_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >TF300TG_PCBA_Ver
:TF300TG_PCBA_END
del %listfile%
del %headfile%

::Check TF300TL_FA_Preload
set TF300TL_FA_Preloadfile=E:\MainServer\TF300TL_FA_Preload
svn list -v %TF300TL_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300TL_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300TL_FA_Preload_END
svn log -r %k% -v %TF300TL_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %TF300TL_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >TF300TL_FA_Preload_Ver
:TF300TL_FA_Preload_END
del %listfile%
del %headfile%

::Check TF300TL_PCBA
set TF300TL_PCBAfile=E:\MainServer\TF300TL_PCBA
svn list -v %TF300TL_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF300TL_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF300TL_PCBA_END
svn log -r %k% -v %TF300TL_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %TF300TL_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >TF300TL_PCBA_Ver
:TF300TL_PCBA_END
del %listfile%
del %headfile%

::Check Bina2_FA_Preload
set Bina2_FA_Preloadfile=E:\MainServer\Bina2_FA_Preload
svn list -v %Bina2_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Bina2_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Bina2_FA_Preload_END
svn log -r %k% -v %Bina2_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Bina2_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Bina2_FA_Preload_Ver
:Bina2_FA_Preload_END
del %listfile%
del %headfile%

::Check Bina2_PCBA
set Bina2_PCBAfile=E:\MainServer\Bina2_PCBA
svn list -v %Bina2_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Bina2_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Bina2_PCBA_END
svn log -r %k% -v %Bina2_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Bina2_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Bina2_PCBA_Ver
:Bina2_PCBA_END
del %listfile%
del %headfile%

::Check A91_FA_Preload
set A91_FA_Preloadfile=E:\MainServer\A91_FA_Preload
svn list -v %A91_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A91_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A91_FA_Preload_END
svn log -r %k% -v %A91_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A91_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A91_FA_Preload_Ver
:A91_FA_Preload_END
del %listfile%
del %headfile%

::Check A91_PCBA
set A91_PCBAfile=E:\MainServer\A91_PCBA
svn list -v %A91_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A91_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A91_PCBA_END
svn log -r %k% -v %A91_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A91_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A91_PCBA_Ver
:A91_PCBA_END
del %listfile%
del %headfile%

::Check P92L_FA_Preload
set P92L_FA_Preloadfile=E:\MainServer\P92L_FA_Preload
svn list -v %P92L_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P92L_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P92L_FA_Preload_END
svn log -r %k% -v %P92L_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %P92L_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >P92L_FA_Preload_Ver
:P92L_FA_Preload_END
del %listfile%
del %headfile%

::Check P92L_PCBA
set P92L_PCBAfile=E:\MainServer\P92L_PCBA
svn list -v %P92L_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type P92L_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto P92L_PCBA_END
svn log -r %k% -v %P92L_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %P92L_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >P92L_PCBA_Ver
:P92L_PCBA_END
del %listfile%
del %headfile%

::Check TF500T_FA_Preload
set TF500T_FA_Preloadfile=E:\MainServer\TF500T_FA_Preload
svn list -v %TF500T_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF500T_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF500T_FA_Preload_END
svn log -r %k% -v %TF500T_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %TF500T_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >TF500T_FA_Preload_Ver
:TF500T_FA_Preload_END
del %listfile%
del %headfile%

::Check TF500T_PCBA
set TF500T_PCBAfile=E:\MainServer\TF500T_PCBA
svn list -v %TF500T_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type TF500T_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto TF500T_PCBA_END
svn log -r %k% -v %TF500T_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %TF500T_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >TF500T_PCBA_Ver
:TF500T_PCBA_END
del %listfile%
del %headfile%

::Check A91_P92L_FA_Preload
set A91_P92L_FA_Preloadfile=E:\MainServer\A91_P92L_FA_Preload
svn list -v %A91_P92L_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A91_P92L_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A91_P92L_FA_Preload_END
svn log -r %k% -v %A91_P92L_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %A91_P92L_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >A91_P92L_FA_Preload_Ver
:A91_P92L_FA_Preload_END
del %listfile%
del %headfile%

::Check A91_P92L_PCBA
set A91_P92L_PCBAfile=E:\MainServer\A91_P92L_PCBA
svn list -v %A91_P92L_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type A91_P92L_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto A91_P92L_PCBA_END
svn log -r %k% -v %A91_P92L_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %A91_P92L_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >A91_P92L_PCBA_Ver
:A91_P92L_PCBA_END
del %listfile%
del %headfile%

::Check Dream_FA_Preload
set Dream_FA_Preloadfile=E:\MainServer\Dream_FA_Preload
svn list -v %Dream_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Dream_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Dream_FA_Preload_END
svn log -r %k% -v %Dream_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Dream_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Dream_FA_Preload_Ver
:Dream_FA_Preload_END
del %listfile%
del %headfile%

::Check Dream_PCBA
set Dream_PCBAfile=E:\MainServer\Dream_PCBA
svn list -v %Dream_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Dream_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Dream_PCBA_END
svn log -r %k% -v %Dream_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Dream_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Dream_PCBA_Ver
:Dream_PCBA_END
del %listfile%
del %headfile%

::Check BINA_JRC_FA_Preload
set BINA_JRC_FA_Preloadfile=E:\MainServer\BINA_JRC_FA_Preload
svn list -v %BINA_JRC_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type BINA_JRC_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto BINA_JRC_FA_Preload_END
svn log -r %k% -v %BINA_JRC_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %BINA_JRC_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >BINA_JRC_FA_Preload_Ver
:BINA_JRC_FA_Preload_END
del %listfile%
del %headfile%

::Check BINA_JRC_PCBA
set BINA_JRC_PCBAfile=E:\MainServer\BINA_JRC_PCBA
svn list -v %BINA_JRC_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type BINA_JRC_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto BINA_JRC_PCBA_END
svn log -r %k% -v %BINA_JRC_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %BINA_JRC_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >BINA_JRC_PCBA_Ver
:BINA_JRC_PCBA_END
del %listfile%
del %headfile%

::Check Chameleon_FA_Preload
set Chameleon_FA_Preloadfile=E:\MainServer\Chameleon_FA_Preload
svn list -v %Chameleon_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Chameleon_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Chameleon_FA_Preload_END
svn log -r %k% -v %Chameleon_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Chameleon_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Chameleon_FA_Preload_Ver
:Chameleon_FA_Preload_END
del %listfile%
del %headfile%

::Check Chameleon_PCBA
set Chameleon_PCBAfile=E:\MainServer\Chameleon_PCBA
svn list -v %Chameleon_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Chameleon_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Chameleon_PCBA_END
svn log -r %k% -v %Chameleon_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Chameleon_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Chameleon_PCBA_Ver
:Chameleon_PCBA_END
del %listfile%
del %headfile%

::Check Panda_FA_Preload
set Panda_FA_Preloadfile=E:\MainServer\Panda_FA_Preload
svn list -v %Panda_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Panda_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Panda_FA_Preload_END
svn log -r %k% -v %Panda_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Panda_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Panda_FA_Preload_Ver
:Panda_FA_Preload_END
del %listfile%
del %headfile%

::Check Panda_PCBA
set Panda_PCBAfile=E:\MainServer\Panda_PCBA
svn list -v %Panda_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Panda_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Panda_PCBA_END
svn log -r %k% -v %Panda_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Panda_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Panda_PCBA_Ver
:Panda_PCBA_END
del %listfile%
del %headfile%

::Check Sausalito_FA_Preload
set Sausalito_FA_Preloadfile=E:\MainServer\Sausalito_FA_Preload
svn list -v %Sausalito_FA_Preloadfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Sausalito_FA_Preload_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Sausalito_FA_Preload_END
svn log -r %k% -v %Sausalito_FA_Preloadfile%>>%tempfile%
svn diff -r %j%:%k% %Sausalito_FA_Preloadfile%>>%tempfile% 
echo %k%
echo %k% >Sausalito_FA_Preload_Ver
:Sausalito_FA_Preload_END
del %listfile%
del %headfile%

::Check Sausalito_PCBA
set Sausalito_PCBAfile=E:\MainServer\Sausalito_PCBA
svn list -v %Sausalito_PCBAfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type Sausalito_PCBA_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto Sausalito_PCBA_END
svn log -r %k% -v %Sausalito_PCBAfile%>>%tempfile%
svn diff -r %j%:%k% %Sausalito_PCBAfile%>>%tempfile% 
echo %k%
echo %k% >Sausalito_PCBA_Ver
:Sausalito_PCBA_END
del %listfile%
del %headfile%

::Check LCR_WDL
set LCR_WDLfile=E:\MainServer\LCR_WDL
svn list -v %LCR_WDLfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type LCR_WDL_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto LCR_WDL_END
svn log -r %k% -v %LCR_WDLfile%>>%tempfile%
svn diff -r %j%:%k% %LCR_WDLfile%>>%tempfile% 
echo %k%
echo %k% >LCR_WDL_Ver
:LCR_WDL_END
del %listfile%
del %headfile%

::Check LPN_WDL
set LPN_WDLfile=E:\MainServer\LPN_WDL
svn list -v %LPN_WDLfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type LPN_WDL_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto LPN_WDL_END
svn log -r %k% -v %LPN_WDLfile%>>%tempfile%
svn diff -r %j%:%k% %LPN_WDLfile%>>%tempfile% 
echo %k%
echo %k% >LPN_WDL_Ver
:LPN_WDL_END
del %listfile%
del %headfile%

::Check LTK11_WDL
set LTK11_WDLfile=E:\MainServer\LTK11_WDL
svn list -v %LTK11_WDLfile% >%listfile%
type %listfile% | linex -l 1 >%headfile%
for /f "tokens=1 delims= " %%i in (%Headfile%) do (
set /a j=%%i-1
set /a k=%%i)
for /f %%i in ('type LTK11_WDL_Ver') do set lastver=%%i
if "%k%"=="%lastver%" goto LTK11_WDL_END
svn log -r %k% -v %LTK11_WDLfile%>>%tempfile%
svn diff -r %j%:%k% %LTK11_WDLfile%>>%tempfile% 
echo %k%
echo %k% >LTK11_WDL_Ver
:LTK11_WDL_END
del %listfile%
del %headfile%

echo open 192.168.168.71>tmp_ftp.txt
echo imagecrc>>tmp_ftp.txt
echo 5CTEconsole>>tmp_ftp.txt
echo put %tempfile%>>tmp_ftp.txt
echo bye>>tmp_ftp.txt

ftp -s:tmp_ftp.txt