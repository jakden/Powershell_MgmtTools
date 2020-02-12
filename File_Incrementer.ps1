$int = 0
$intfor = [int]$int.ToString("00")
foreach ($_ in 1..98){
    $intfor++
    Write-Host ("![alt text] (/posts/images/P0001/P0001_IMG$intfor.png)")
}
##Write-Host ("![alt text] (/posts/images/P0001/P0001_IMG$intfor.png)")



#Write filename increaser
$ObjectCount = Read-Host -Prompt "How many images do you want to tag with"
$ObjectCount = [int]$ObjectCount
$FrontText = Read-Host -Prompt "What text do you want to appear before the count"
$BackText = Read-Host -Prompt "What text do you want to appear after the count"
$int = 0
$intfor = [int]$int.ToString("00")

foreach ($_ in 1..$ObjectCount){
    $intfor++
    Write-Host ($FrontText + $intfor.ToString("00") + $BackText)
}




Write-Host ($FrontText + $intfor + $BackText)


New-Item -ItemType Directory -Force -Path $ScanLocation





$int = 0
$intfor = $int.ToString("00")

foreach ($_ in $1..100){
    [int]$intfor++
}
Write-Host ("![alt text] (/posts/images/P0001/P0001_IMG$intfor.png)")