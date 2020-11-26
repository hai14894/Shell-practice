$webResult = Invoke-WebRequest -Uri 'http://reddit.com/r/powershell.json'
$rawJSON = $webResult.Content
$objData = $rawJSON |    ConvertFrom-Json
$posts = $objData.data.children.data
$posts | Select-Object Title,Score | Sort-Object Score -Descending

################################################################
[int]$numPosts = Read-Host -Prompt "Enter the number of post you want to read"
$posts | Select-Object Title,url | Sort-Object Score -Descending | Select-Object -First $numPosts