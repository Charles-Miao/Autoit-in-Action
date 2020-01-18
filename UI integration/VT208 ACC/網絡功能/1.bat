for /f "tokens=1,2" %%i in (1.txt) do (

set mac_%%i=%%j)

if @%mac_192.168.0.2%==@%mac_192.168.0.3% goto fail
if @%mac_192.168.0.2%==@%mac_192.168.0.4% goto fail
if @%mac_192.168.0.2%==@%mac_192.168.0.5% goto fail
if @%mac_192.168.0.2%==@%mac_192.168.0.6% goto fail

if @%mac_192.168.0.3%==@%mac_192.168.0.4% goto fail
if @%mac_192.168.0.3%==@%mac_192.168.0.5% goto fail
if @%mac_192.168.0.3%==@%mac_192.168.0.6% goto fail

if @%mac_192.168.0.4%==@%mac_192.168.0.5% goto fail
if @%mac_192.168.0.4%==@%mac_192.168.0.6% goto fail

if @%mac_192.168.0.5%==@%mac_192.168.0.6% goto fail



goto pass

:fail
echo fail
pause
goto end

:pass
echo pass
pause
goto end

:end