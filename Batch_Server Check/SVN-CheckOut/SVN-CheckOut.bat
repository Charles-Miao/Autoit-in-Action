:start
@echo off
cd /d %~d0%~p0

  ::ShowConsole.exe MINIMIZED
  set dst=e:\MainServer
  path C:\Program Files\TortoiseSVN\bin;%path%
  setlocal ENABLEDELAYEDEXPANSION
  echo tf>tf.txt
:CheckOut
    for /f "tokens=1,2" %%I in (SVN-CheckOut.ini) do (
      echo [%date% %time%] %%I -- ^> %%J
      svn.exe revert %dst%\%%J --username charles --password 660824
      svn.exe checkout http://127.0.0.1:1900/cangku/%%I %dst%\%%J --username charles --password 660824 --force <tf.txt
      )
:End

::ping 127.0.0.1 -n 33
::goto :start


EXIT
pause
::find /i "SubversionNotify" d:\mfgtest\%%I\hooks\post-commit.cmd >nul || copy /y .\commit\*.* d:\mfgtest\%%I\hooks
    