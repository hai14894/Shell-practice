#count Large Files
$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large file' 
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object { $_.Length -gt 5MB }
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count

Write-Host "you have $largeFilesCount large file(s) in $path"
################################################################
# if else condition
$path = 'Downloads'
$testPath = Test-Path $path
if ($testPath -eq $true) {
    Write-Host "$path is VERIFIED "
}
else {
    Write-Host "$path is not VERIFIED "
}
########################################################################
# for each loop
$path = 'Downloads'
[int]$totalSize = ''
$fileInfo = Get-ChildItem $path -Recurse
foreach ($file in $fileInfo) {
    $totalSize += $file.Length
}
$roundedSize = [math]::Round($($totalSize / 1MB))
Write-Host " the toal space disk of $path is $roundedSize MB"

##################################
#do while loop 
$pathVerified = $false
do {
    $path =  Read-Host 'Please enter a path to verify'
    if ( Test-Path $path ) {
        Write-Host " Path is verified"
        $pathVerified = $true
    }
} while ($pathVerified -eq $false)

