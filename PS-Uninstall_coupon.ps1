$Credential = Get-Credential
Invoke-Command -Credential $Credential -ComputerName (Get-Content c:\users\jaylesworth\downloads\CouponMachines.txt) -ScriptBlock {Get-CimInstance -ClassName Win32_Product -Filter "name like '%coupon%'" | Invoke-CimMethod -MethodName Uninstall}