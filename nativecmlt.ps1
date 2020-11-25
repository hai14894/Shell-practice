#where-object
# 1st method using native command
$largeProcesses1 = Get-Process |where-object {$_.WorkingSet64 -gt 50MB} 


# 2nd method using loop
$largeProcesses2 = @()
$processes = Get-Process
foreach ($process in $processes){
    if ($process.WorkingSet64 -gt 50MB){
        $largeProcesses2 += $process
    }
}

################################
#ForEach-Object

$path = 'Downloads'
$folderCount = 0
Get-ChildItem $path | ForEach-Object -Process { if ($_.PSIsContainer) { $folderCount ++ } }
Write-Host " $folderCount folder(s) in $path directory"