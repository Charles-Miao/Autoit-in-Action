@echo on

start /min
set ramdrv=x:

:start
net use Y: "\\172.168.168.204\Document\06 Ghost" /user:admin btco
cd ghost115


:ongoing
cls
type ongoing.ans

@echo off
echo If you restore image ok, or cancel restore image, you can close this window.

call restore_image.exe
:pause
pause>nul
exit
