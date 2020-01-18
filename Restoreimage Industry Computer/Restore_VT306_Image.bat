chcp 437

:start


::ghost

ghost32 -clone,mode=load,src=Y:\VT306\VT306_Series_All_In_One.GHO,dst=1 -fdsp -ib -fnf -fx -auto -sure
if not errorlevel 1 goto end

:ghostng
echo ghost ng
pause>nul
goto start

:end