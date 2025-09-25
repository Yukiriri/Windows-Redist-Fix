
$dl_ver = $args[0]
$dl_arch = $args[1]

Write-Output "dl_ver=$dl_ver"
Write-Output "dl_arch=$dl_arch"

$main_page_url = "https://dotnet.microsoft.com/download/dotnet/" + $dl_ver
$main_page_content = Invoke-WebRequest -URI $main_page_url | Select-Object -ExpandProperty Content
Write-Output main_page_url=$main_page_url

$dl_page_pattern = "/download/.*/runtime-desktop-.*-windows-" + $dl_arch + "-installer"
$dl_page_url = "https://dotnet.microsoft.com" + [regex]::Matches($main_page_content, $dl_page_pattern)[0].Value
$dl_page_content = Invoke-WebRequest -URI $dl_page_url | Select-Object -ExpandProperty Content
Write-Output dl_page_url=$dl_page_url

$dl_uri_pattern = "https://.*?\.exe"
$dl_uri = [regex]::Matches($dl_page_content, $dl_uri_pattern)[0].Value
$dl_outfile = [regex]::Matches($dl_uri, "(?!/)windowsdesktop-runtime.*exe")[0].Value
Write-Output dl_uri=$dl_uri
Write-Output dl_outfile=$dl_outfile

Invoke-WebRequest -URI $dl_uri -OutFile $dl_outfile
