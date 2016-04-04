for %%I in (%cd%\*.bat) do set cmd=%%~nxI
schtasks /create /tn "%cmd%" /sc minute /mo 1 /tr "%cd%\%cmd%"