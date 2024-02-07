# Get information about all devices
$devices = Get-WmiObject Win32_PnPEntity

# Display information for each device
foreach ($device in $devices) {
    Write-Host "Device Name: $($device.Name)"
    Write-Host "Device Description: $($device.Description)"
    Write-Host "Device Manufacturer: $($device.Manufacturer)"
    Write-Host "Device Status: $($device.Status)"
    Write-Host "---------------------------"
}

# Alternatively, you can use Get-PnpDevice to get more detailed information
$pnpDevices = Get-PnpDevice

# Display information for each PnP device
foreach ($pnpDevice in $pnpDevices) {
    Write-Host "Device ID: $($pnpDevice.DeviceId)"
    Write-Host "Device Description: $($pnpDevice.FriendlyName)"
    Write-Host "Device Status: $($pnpDevice.Status)"
    Write-Host "---------------------------"
}

# Display network interface information
$networkInterfaces = Get-NetAdapter

foreach ($interface in $networkInterfaces) {
    Write-Host "Interface Name: $($interface.Name)"
    Write-Host "Interface Description: $($interface.Description)"
    Write-Host "MAC Address: $($interface.MacAddress)"
    Write-Host "Status: $($interface.Status)"
    Write-Host "---------------------------"
}

# Display IP configuration for each network interface
foreach ($interface in $networkInterfaces) {
    $ipConfig = Get-NetIPConfiguration -InterfaceAlias $interface.Name
    Write-Host "Interface Name: $($interface.Name)"
    Write-Host "IPv4 Address: $($ipConfig.IPv4Address.IPAddress)"
    Write-Host "IPv4 Subnet Mask: $($ipConfig.IPv4Address.PrefixLength)"
    Write-Host "IPv4 Default Gateway: $($ipConfig.DefaultGateway.NextHop)"
    Write-Host "DNS Servers: $($ipConfig.DNSServer.ServerAddresses)"
    Write-Host "---------------------------"
}

# Display network routes
$routes = Get-NetRoute
foreach ($route in $routes) {
    Write-Host "Destination Prefix: $($route.DestinationPrefix)"
    Write-Host "Interface Index: $($route.InterfaceIndex)"
    Write-Host "Next Hop: $($route.NextHop)"
    Write-Host "Metric: $($route.Metric)"
    Write-Host "---------------------------"
}

# Display network firewall rules
$firewallRules = Get-NetFirewallRule
foreach ($rule in $firewallRules) {
    Write-Host "Rule Name: $($rule.Name)"
    Write-Host "Action: $($rule.Action)"
    Write-Host "Enabled: $($rule.Enabled)"
    Write-Host "Direction: $($rule.Direction)"
    Write-Host "Local Address: $($rule.LocalAddress)"
    Write-Host "Remote Address: $($rule.RemoteAddress)"
    Write-Host "Protocol: $($rule.Protocol)"
    Write-Host "---------------------------"
}
