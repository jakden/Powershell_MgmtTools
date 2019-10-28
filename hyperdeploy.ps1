# Windows Server 2019 VHD https://software-download.microsoft.com/download/sg/17763.379.amd64fre.rs5_release_svc_refresh.190312-0539_server_serverdatacentereval_en-us.vhd
# Windows Server 2019 ISO https://software-download.microsoft.com/download/sg/17763.379.190312-0539.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso
# Windows Server 2019 Essentials ISO https://software-download.microsoft.com/download/sg/17763.379.190312-0539.rs5_release_svc_refresh_SERVERESSENTIALS_OEM_x64FRE_en-us.iso
# Windows Server 2016 ISO https://software-download.microsoft.com/download/pr/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO
# Windows Server 2016 Essentials ISO http://download.microsoft.com/download/6/9/5/6957BB28-1FAD-4E62-B161-F873196130BD/14393.0.161119-1705.RS1_REFRESH_SERVERESSENTIALS_OEM_X64FRE_EN-US.ISO
# Windows Server 2012 R2 ISO x64 http://download.microsoft.com/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO
# Windows Server 2012 R2 ISO x32 http://download.microsoft.com/download/D/6/7/D675380B-0028-46B3-B47F-A0646E859F76/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_ZH-CN-IR3_SSS_X64FREE_ZH-CN_DV9.ISO
# Windows Server 2012 R2 VHD http://download.microsoft.com/download/5/8/1/58147EF7-5E3C-4107-B7FE-F296B05F435F/9600.16415.amd64fre.winblue_refresh.130928-2229_server_serverdatacentereval_en-us.vhd
# Windows Server 2012 R2 Essentials ISO http://download.microsoft.com/download/8/F/7/8F7024D2-AB2A-4BE2-8406-1E3AC49C5C1F/9600.16384.WINBLUE_RTM.130821-1623_X64FRE_SERVER_SOLUTION_EN-US-IRM_SSSO_X64FRE_EN-US_DV5.ISO
# Windows Server 2012 ISO http://download.microsoft.com/download/6/D/A/6DAB58BA-F939-451D-9101-7DE07DC09C03/9200.16384.WIN8_RTM.120725-1247_X64FRE_SERVER_EVAL_EN-US-HRM_SSS_X64FREE_EN-US_DV5.ISO

$drivepath = Read-Host -Prompt 'Set the drive you want to create the install folders on (just the letter ex. C)'
# Loop through an array of paths (strings)
$paths = @("${drivepath}:\HyperV", "${drivepath}:\ISO")
# Check if a folder already exists - if not create it
foreach ($path in $paths) {
    If(!(test-path $path))
    {
          New-Item -ItemType Directory -Force -Path $path
    }
}

# Check if a folder already exists - if not create it


# Create Internal LAB-SW01
New-VMSwitch -name LAB-SW01 -SwitchType Internal

# Create LAB-SRV01
New-VM -Name LAB-SVR01 -MemoryStartupBytes 2GB -Generation 2 
#-Path .\VMData -BootDevice VHD  |||-Switch LAB-SW01 ||-NewVHDPath Z:\HyperV\LAB-DC01\LAB-SVR01.vhdx -Path .\VMData -NewVHDSizeBytes 20GB

# Create new drive 
New-VHD -Path "${drivepath}:\HyperV\LAB-SVR01\LAB-SVR01.vhdx" -SizeBytes 20GB -Dynamic
# Test if file already exists and download Windows Server 2019 ISO if it does not
$isopath = @("${drivepath}:\ISO\Win_Server_2019.iso")
If(!(test-path $isopath))
{
      Start-BitsTransfer -Source https://software-download.microsoft.com/download/sg/17763.379.190312-0539.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso `
      -Destination $isopath
}
# Confirms ISO download completed
Write-Host "bits transfer complete"

# Adds DVD drive and mount ISO
Add-VMDvdDrive -VMName LAB-SVR01 -Path "${drivepath}:\ISO\Win_Server_2019.iso"