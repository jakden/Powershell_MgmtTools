#An example of text that could come before when trying to create numbered Image files for a markdown file ![alt text](https://github.com/jakden/Hyper-V_Core_Setup/blob/main/images/P0002_IMG
#An example of text that could come after when trying to create numbered Image files for a markdown file .png)
#Which should spit out ![alt text](https://github.com/jakden/Hyper-V_Core_Setup/blob/main/images/P0002_IMG05.png) or a local example ![alt text](/posts/images/P0001/P0001_IMG01.png) with incrementing IMG numbers
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

