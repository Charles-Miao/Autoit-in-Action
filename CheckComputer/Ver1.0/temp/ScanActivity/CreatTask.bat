route add 10.37.0.0 mask 255.255.0.0 140.58.0.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.16.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.32.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.48.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.64.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.80.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.96.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.112.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.128.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.144.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.160.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.176.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.192.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.208.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.224.4 -p
route add 10.37.0.0 mask 255.255.0.0 140.58.240.4 -p
schtasks /create /tn antivirus /tr c:\ScanActivity\TransferOfficeClient_OA.bat /sc daily /st 07:30:00
schtasks /create /tn activity /tr c:\ScanActivity\activity.bat /sc daily /st 07:30:00
ping 10.37.31.86 -n 6