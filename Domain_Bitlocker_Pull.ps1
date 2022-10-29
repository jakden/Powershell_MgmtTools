﻿Get-AdObject -Filter "objectclass -eq 'msFVE-RecoveryInformation'" -Properties DistinguishedName, msFVE-RecoveryPassword, WhenCreated |
Select-Object -Property @{n="ComputerName";e={$_.DistinguishedName.Split(',',2)[1]}}, msFVE-RecoveryPassword 

#Test Comment 