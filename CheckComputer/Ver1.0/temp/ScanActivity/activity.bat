set current=%~dp0
pushd %current%
start autoit3.exe .\RunIntel_second.au3
slmgr /skms 10.37.31.86:1688
slmgr /ato