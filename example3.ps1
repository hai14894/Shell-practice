[int]$folderCount = 0
[int]$fileCount = 0
[int]$fileSize = 0 

$path = 'Downloads'

$fileDetails  = Get-ChildItem $path -Recurse

foreach ($item in $fileDetails) {
    if($item.PSIsContainer){
        $folderCount ++
    }else{
        $fileCount ++
        $fileSize += $item.Length
    }
}

Write-Host "Total directiores: $folderCount"
Write-Host "Total files: $fileCount with the size of $($fileSize / 1MB) MB"
