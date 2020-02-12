Function Get-NeglectedFiles
{

 Param([string[]]$path,

       [int]$numberDays)

 $cutOffDate = (Get-Date).AddDays(-$numberDays)

 Get-ChildItem C:\ -Recurse

 Where-Object {$_.LastAccessTime -le $cutOffDate}

}

Get-NeglectedFiles -numberDays 10000 | select-object name, *time

#$files = @(Get-ChildItem C:\ -Recurse | select-object -expandproperty name)

    #foreach ($f in $files){
    #Get-ChildItem -path $files -ErrorAction SilentlyContinue | select-object fullname, name, *time | export-csv C:\Users\JakeDennis\Documents\file_access.csv
#}


#Get-ChildItem C:\ -Recurse | select-object name, *time, fullname | export-csv C:\Users\JakeDennis\Documents\file_access.csv

Start-BitsTransfer -Source https://download.msappproxy.net/Subscription/d3c8b69d-6bf7-42be-a529-3fe9c2e70c90/Connector/DownloadConnectorInstaller `
-Destination C:\DownloadConnectorInstaller.msi
Param([string[]]$path,

[int]$green)


$red = 123

if ($red = 123){
    [int]$red
}
'what is the color' -green 133 