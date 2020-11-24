
$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large file' 
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object { $_.Length -gt 5MB }
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count

Write-Host "you have $largeFilesCount large file(s) in $path"
################################################################
$path = 'Downloads'
$testPath = Test-Path $path
if ($testPath -eq $true) {
    Write-Host "$path is VERIFIED "
}
else {
    Write-Host "$path is not VERIFIED "
}
########################################################################

$path = 'Downloads'
[int]$totalSize = ''
$fileInfo = Get-ChildItem $path -Recurse
foreach ($file in $fileInfo) {
    $totalSize += $file.Length
}
$roundedSize = [math]::Round($($totalSize / 1MB))
Write-Host " the toal space disk of this directory is $roundedSize MB"