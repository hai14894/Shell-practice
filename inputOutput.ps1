$webResult = Invoke-WebRequest -Uri 'http://reddit.com/r/powershell.json'
$rawJSON = $webResult.Content
$objData = $rawJSON | ConvertFrom-Json
$posts = $objData.data.children.data
$posts | Select-Object Title,Score | Sort-Object Score -Descending