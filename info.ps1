Write-Host "=== Windows Info Collector ==="
Write-Host ""

Write-Host "Computer Name:"
hostname

Write-Host ""
Write-Host "Current User:"
whoami

Write-Host ""
Write-Host "Date:"
Get-Date
Write-Host ""
Write-Host "Windows Version:"

(Get-CimInstance Win32_OperatingSystem).Caption