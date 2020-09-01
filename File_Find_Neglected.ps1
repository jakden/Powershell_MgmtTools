Function Get-NeglectedFiles{

    $KBsize = @{label="Size(KB)";expression={$_.length/1KB}}
    $MBsize = @{label="Size(MB)";expression={$_.length/1MB}}
    $GBsize = @{label="Size(GB)";expression={$_.length/1GB}}
    Get-ChildItem C:\ -Recurse | Where-Object {$_.LastAccessTime -lt (Get-Date).AddDays(-2555)} | select-object name, *time, fullname, $KBsize, $MBsize, $GBsize | export-csv C:\Temp\file_access.csv -Force

}
Get-NeglectedFiles
