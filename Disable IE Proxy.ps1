$regKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

Write-Host "Retrieve the proxy settings..."
$val = (Get-ItemProperty "$regKey\Connections" DefaultConnectionSettings).DefaultConnectionSettings
#Write-Host $val

# Disable "Automatically Detect Settings"
if ($val[8] -gt 8)
{
    Write-Host "Disabling ""Automatically Detect Settings""..."
    $val[8] = $val[8] -bxor 8
    #Write-Host $val
    Set-ItemProperty "$regKey\Connections" -name DefaultConnectionSettings -value $val
    Set-ItemProperty -path $regKey ProxyEnable -value 0
}
else
{
    Write-Host """Automatically Detect Settings"" already disabled."
}

Write-Host "Done!"
Write-Host ""
