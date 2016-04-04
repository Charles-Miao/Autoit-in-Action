chcp 437

:start


::ghost

ghost32 -clone,mode=load,src="Y:\VT208\VT306&VT208_ALL_IN_ONE_XP.GHO",dst=1 -fdsp -ib -fnf -fx -auto -sure
if not errorlevel 1 goto end

:ghostng
echo ghost ng
pause>nul
goto start

:end