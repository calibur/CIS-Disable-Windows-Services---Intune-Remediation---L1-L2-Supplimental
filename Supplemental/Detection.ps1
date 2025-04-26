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
    'lmhosts',  #TCP/IP NetBIOS Helps
    'PeerDistSvc',   #BranchCache
    'RetailDemo',   #Retail Demo Service
    'SNMPTRAP',     #SNMP Trap Service
    'FDResPub',     # function Discovery Resource Publication
    'fdPHost',      # function Discovery Provider Host
    'diagsvc',      # Diagnostic Execution Service
    'SSDPSRV',      # Geolocation Service
    'DiagTrack',        # Connected User Experiences and Telemetry
    'PcaSvc',           # Program Compatibility Assistant (PCA)
    'TapiSrv',          # Telephony API
    'CertPropsvc',      # Certificate Propagation Service
    'RegSrvc',          # Intel ProSet Wireless Registry
    'diagnosticshub.standardcollector.service',  #Microsoft (R) Diagnostics Hub Standard Collector Service
    'dmwapppushservice',    # WAP Push Message Routing Service
    'NetTcpPortSharing',    # Net.Tcp Port Sharing Service
    'RemoteAccess',     # Routing and Remote Access
    'SharedAccess',     # Internet Connection Sharing (ICS)
    'TrkWks',           # Distributed Link Tracking Client
#    'WBioSrvc',        # Windows Biometric Service (Required for Fingerprint reading / Facial Detection)
#    'WlanSvc',         # WLAN AutoConfig (Disabling this can cause issues with Wi-Fi connectivity)
    'WMPNetworkSvc'    # Windows Media Player Network Sharing Service
#    'wscsvc',           # Windows Security Center Service
#    'WSearch',          # Windows Search
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
