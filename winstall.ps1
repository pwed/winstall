
wsl --install
wsl --install -d ubuntu

foreach($line in Get-Content .\list-default.txt) {
    winget install $line
}

if ((gwmi win32_VideoController).Name | Select-String -Pattern "NVIDIA" -Quiet) {
    foreach($line in Get-Content .\list-nvidia.txt) {
        winget install $line
    }
}