<#
    .SYNOPSIS
        A simple script intended to be used as an Intune remediation to harden, and achieve CIS Compliance on a Windows endpoint by disabling specified services.
    
    .NOTES
      Version:          1.0.0
      Author:           Matthew Drummond
      Published Date:   26 April 2025
#>
$Services = @(
    "BTAGService",     # Bluetooth Audio Gateway Service
    "bthserv",         # Bluetooth Support Service
    "MapsBroker",      # Downloaded Maps Manager
    "lfsvc",           # Geolocation Service
    "lltdsvc",         # Link-Layer Topology Discovery Mapper
    "MSiSCSI",         # Microsoft iSCSI Initiator Service
    "PNRPsvc",         # Peer Name Resolution Protocol
    "p2psvc",          # Peer Networking Grouping
    "p2pimsvc",        # Peer Networking Identity Manager
    "PNRPAutoReg",     # PNRP Machine Name Publication Service
    "Spooler",         # Print Spooler
    "wercplsupport",   # Problem Reports and Solutions Control Panel Support
    "RasAuto",         # Remote Access Auto Connection Manager
    "SessionEnv",      # Remote Desktop Configuration
    "TermService",     # Remote Desktop LocalServices
    "UmRdpService",    # Remote Desktop LocalServices UserMode Port Redirector
    "RemoteRegistry",  # Remote Registry
    "LanmanServer",    # Server
    "SNMP",            # SNMP Service
    "WerSvc",          # Windows Error Reporting Service
    "Wecsvc",          # Windows Event Collector
    "WpnService",      # Windows Push Notifications System Service
    "PushToInstall",   # Windows PushToInstall Service
    "WinRM"            # Windows Remote Management
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
