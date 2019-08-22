<#
NAME: Template-Powershell.ps1
VERSION: v1.0
AUTHOR: Jimmi Aylesworth
DATE: 20190821
LEGAL: Public domain, no rights reserved.

DESCRIPTION:
This script will attempt to pull as much data as possible for CER.

Data Gathering:
[ ] Accounts (Local Admins & Groups)
[ ] Persistence Mechanisms
[ ] Installed Programs
[ ] Installed Patches
[ ] Shadow Copies
[ ] Processes
[ ] Network Statistics
[ ] Log (evtx) files - Events, Security, Application, & Powershell
[ ] Registry Hives
[ ] Prefetch data
[ ] User Folders & Content
    _ Browsers
    _ Jump Lists
    _ Link Files
[ ] Full File Listing

.LINK
http://b1nary0mega.github.io
http://www.github.com/b1nary0mega
#>

Function Get-MoreCoffee {
<#
.DESCRIPTION
assistance with caffeinating

.EXAMPLE
PS > Get-MoreCoffee -Cubicle  $env:COMPUTERNAME -CupSize Large 

Use above to execute the function.

#>
  [Cmdletbinding()] 

  Param (
    [Parameter(ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [String[]]$Cubicle =  $Env:COMPUTERNAME,
    [parameter()]
    [string[]]$CupSize
  )

  Begin {

    Function  Get-FunctionOne {
      Write-Verbose "This is a message from Function #1"
    }
  
    Function  Get-FunctionTwo {
      Write-Verbose "This is a message from Function #2"
    }
  }

  Process  {

    ForEach  ($Computer in  $Cubicle) {
      Try {
        Write-Verbose  "Connecting to $($Computer)"
        $UserName  = [ADSI]"WinNT://$Computer"

        If  ($PSBoundParameters.ContainsKey('CupSize')) {
          Write-Verbose  "Scanning for CupSize..."
        } Else {
          Write-Verbose  "Can't find CupSize"
        }

        If  ($CupSize) {
          $CupSize  | ForEach {
            [pscustomobject] @{
              Computername = $Computer
              UserName = $_.Name[0]
              CupSize = (Get-FunctionOne)
              Additives = (Get-FunctionTwo)
            }
          }
        } Else {
          Throw  "No CupSize found!"
        }
      } Catch {
        Write-Warning  "$($Computer): $_"
      }
    }
  }
}
