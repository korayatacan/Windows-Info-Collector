Write-Host "=== Windows Info Collector ==="
Write-Host ""

Write-Host "Date: $(Get-Date -Format 'dd MMMM yyyy dddd HH:mm:ss')"
Write-Host "Computer Name: $(hostname)"
Write-Host "Current User: $(whoami)"
Write-Host ""
Write-Host "Windows Version: $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Host "RAM: $([math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,1)) GB"
Write-Host ""

$lastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $lastBoot
Write-Host "Last Boot: $($lastBoot.ToString("dd MMMM yyyy HH:mm:ss")) ($($uptime.Days) days ago)"
Write-Host ""

