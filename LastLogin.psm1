function Find-User {
    New-Item -ItemType Directory -Force -Path C:\Temp
    Get-ADUser -Filter 'Enabled -eq $true' -Properties Enabled, LastLogonDate | Select Name, Username, Enabled, LastLogonDate | Export-csv C:\Temp\LastLogonDate.csv
    }
    
function Find-Comp {
    New-Item -ItemType Directory -Force -Path C:\Temp
    Get-ADComputer -Filter 'Enabled -eq $true' -Properties Enabled, LastLogonDate | Select Name, Username, Enabled, LastLogonDate | Export-csv C:\Temp\LastLogonDate.csv
    }
function GetInfo{
    Get-WmiObject -ComputerName hostname -Class Win32_BIOS
    }
    GetInfo -ComputerName localhost
    