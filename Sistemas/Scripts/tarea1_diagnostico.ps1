Write-Host "Maquina:"
Write-Host $env:COMPUTERNAME

$ip = Get-NetIPAddress -AddressFamily IPV4 |
Where-Object {
        $_.IPAddress -notlike "127.*"-and
        $_.InterfaceAlias -like "Ethernet1*"
} |
Select-Object First 1 -ExpandProperty IPAddress
Write-Host "Dirección IP: $ip"
$sd = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
Write-Host ("G libres de C: {0} GB" -f ([math]::Round($sd.FreeSpace / 1GB, 0)))