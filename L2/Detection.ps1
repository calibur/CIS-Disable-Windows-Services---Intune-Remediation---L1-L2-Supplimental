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
