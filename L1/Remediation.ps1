<#
    .SYNOPSIS
        A simple script intended to be used as an Intune remediation to harden, and achieve CIS Compliance on a Windows endpoint by disabling specified services.
    
    .NOTES
      Version:          1.0.0
      Author:           Matthew Drummond
      Published Date:   26 April 2025
#>
$Services = @(
    "Browser",          # Computer Browser
    "IISADMIN",         # IIS Admin Service
    "irmon",            # Infrared monitor service
    "SharedAccess",     # Internet Connection Sharing
    "LxssManager",      # LxssManager 
    "FTPSVC",           # Microsoft FTP Service
    "sshd",             # OpenSSH SSH Server
    "RpcLocator",       # Remote Procedure Call (RPC) Locator
    "RemoteAccess",     # Routing and Remote Access
    "simptcp",          # Simple TCP/IP Services
    "sacsvr",           # Special Administration Console Helper
    "SSDPSRV",          # SSDP Discovery
    "upnphost",         # UPnP Device Host 
    "WMSvc",            # Web Management Service
    "WMPNetworkSvc",    # Windows Media Player Network Sharing Service
    "icssvc",           # Windows Mobile Hotspot Service
    "W3SVC",            # World Wide Web Publishing Service
    "XboxGipSvc",       # Xbox Accessory Management Service
    "XblAuthManager",   # Xbox Live Auth Manager
    "XblGameSave",      # Xbox Live Game Save
    "XboxNetApiSvc"     # Xbox Live Networking Service
)
$LocalServices = Get-Service -Name $Services -ErrorAction SilentlyContinue


$DisabledCount = 0
$AlreadyDisabledCount = 0
$NotInstalledCount = 0

foreach ($service in $Services) {
    $FoundService = $LocalServices | Where-Object { $_.Name -eq $service }

    if ($FoundService) {
        if ($FoundService.StartType -ne 'Disabled') {
            Set-Service $FoundService.Name -StartupType Disabled -Verbose
            Write-Host "Service $($FoundService.DisplayName) has been disabled." -ForegroundColor Yellow
            $DisabledCount++
        } else {
            Write-Host "Service $($FoundService.DisplayName) is already disabled." -ForegroundColor Green
            $AlreadyDisabledCount++
        }   
    } else {
        Write-Host "Service $service not installed." -ForegroundColor Green
        $NotInstalledCount++
    }
}


Write-Host "`nThis script configured $DisabledCount services as 'Disabled'."
Write-Host "$AlreadyDisabledCount services were already disabled and $NotInstalledCount are not installed."
