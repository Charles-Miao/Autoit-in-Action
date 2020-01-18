chcp 437

:start


::ghost

ghost32 -clone,mode=load,src=Y:\AD268\ACC_AD268_All_In_One.GHO,dst=1 -fdsp -ib -fnf -fx -auto -sure
if not errorlevel 1 goto end

:ghostng
echo ghost ng
pause>nul
goto start

:end