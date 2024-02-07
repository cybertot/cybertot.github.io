# Get the list of processes
$processList = Get-Process

# Specify the file path in the user's profile directory
$filePath = Join-Path $env:USERPROFILE "ProcessInfo.txt"

# Display process information and write to a file
foreach ($process in $processList) {
    $processInfo = @"
Process Name: $($process.ProcessName)
PID: $($process.Id)
CPU Time: $($process.TotalProcessorTime)
Memory (Working Set): $($process.WorkingSet)
---------------------------
"@
    $processInfo | Out-File -Append -FilePath $filePath
}

Write-Host "Process information written to $filePath"

