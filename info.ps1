Write-Host "=== Windows Info Collector ==="
Write-Host ""

Write-Host "Date: $(Get-Date -Format 'dd MMMM yyyy dddd HH:mm:ss')"
Write-Host "Computer Name: $(hostname)"
Write-Host "Current User: $(whoami)"
Write-Host ""


write-Host "Hardware Information:"
write-Host "----------------------"
Write-Host "RAM: $([math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,1)) GB"
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$FreeSpace = $([math]::Round((Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB, 1))
$TotalSize = $([math]::Round((Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").Size / 1GB, 1))
Write-Host "Disk C: $($FreeSpace) GB Free / $($TotalSize) GB Total "
Write-Host ""

write-Host "Operating System Information:"
write-Host "-----------------------------"
$lastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $lastBoot
Write-Host "Last Boot: $($lastBoot.ToString("dd MMMM yyyy HH:mm:ss")) ($($uptime.Days) days ago)"
Write-Host "Windows Version: $((Get-CimInstance Win32_OperatingSystem).Caption)"