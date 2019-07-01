#powershell

# get all available resource we can interact with
PS > get-wmiobject -list

# query running processes
PS > Get-WmiObject -Query "select * from Win32_Process" | format-table

# query using filters and/or boolean expressions
PS > Get-WmiObject -Query "select * from Win32_Process where name like 'chrome%' " | format-table