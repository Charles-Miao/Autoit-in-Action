$_SYSTEM_POWER_STATUS=DllStructCreate('byte[4];dword[2]')

DllCall('Kernel32.dll','bool','GetSystemPowerStatus','ptr',DllStructGetPtr($_SYSTEM_POWER_STATUS))

$DC_Status=DllStructGetData($_SYSTEM_POWER_STATUS,1,2)
$AC_Status=DllStructGetData($_SYSTEM_POWER_STATUS,1,1)
$BATT_CAP=DllStructGetData($_SYSTEM_POWER_STATUS,1,3)


fileopen("battery.bat",2)
filewrite("battery.bat", "set DC_Status="& $DC_Status & @CRLF)
filewrite("battery.bat", "set AC_Status="& $AC_Status & @CRLF)
filewrite("battery.bat", "set BATT_CAP="& $BATT_CAP & @CRLF)

FILECLOSE("Battery.bat")


;MsgBox(32,"battery status",DllStructGetData($_SYSTEM_POWER_STATUS,1,2))

;MsgBox(32,"adapt status",DllStructGetData($_SYSTEM_POWER_STATUS,1,1))

;MsgBox(32,"battery percetage",DllStructGetData($_SYSTEM_POWER_STATUS,1,3))

;MsgBox(32,"Battery remain time(DWORD)",DllStructGetData($_SYSTEM_POWER_STATUS,2,1))

;MsgBox(32,"Battery total time(DWORD)",DllStructGetData($_SYSTEM_POWER_STATUS,2,2))

