<#
    .SYNOPSIS
        A simple script intended to be used as an Intune remediation to harden, and achieve CIS Compliance on a Windows endpoint by disabling specified services.
    
    .NOTES
      Version:          1.0.0
      Author:           Matthew Drummond
      Published Date:   26 April 2025
#>
$Counter=0
$DisabledServices = @()

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

Foreach ($Service in $Services){
    if ($service.StartType -ne 'Disabled') {
        #$DisabledServices += $service.Name
        $Counter++
    }
}

if ($Counter -gt 0){
    Write-Output "A specified service to be disabled has been found."
    exit 1
}
else {
    Write-Output "All specified services are already disabled."
    exit 0
}
