$tempProfile = Join-Path $env:TEMP "chrome_test_$(Get-Random)"
New-Item -ItemType Directory -Path $tempProfile | Out-Null

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$extensionPath = "C:\path\to\your\extension"

Start-Process -FilePath $chromePath `
  -ArgumentList "--user-data-dir=`"$tempProfile`"", "--no-first-run", "--load-extension=`"$extensionPath`"" `
  -Wait

Remove-Item -Recurse -Force $tempProfile