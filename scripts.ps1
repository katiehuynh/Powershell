# Testing writing to a host
Write-Host "Hello World"

# ——————————————-
# Function Name: p
# Test if a computer is online (quick ping replacement)
# ——————————————-
function p {
    param($computername)
    return (test-connection $computername -count 1 -quiet)
}

# ——————————————-
# Function Name: Get-Uptime
# Calculate and display system uptime on a local machine or remote machine.
# TODO: Fix multiple computer name / convertdate errors when providing more
# than one computer name.
# ——————————————-
function Get-Uptime {
    [CmdletBinding()]
    param (
    [string]$ComputerName = ‘localhost’
    )
    
    foreach ($Computer in $ComputerName){
    $pc = $computername
    $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computername
    $diff = $os.ConvertToDateTime($os.LocalDateTime) – $os.ConvertToDateTime($os.LastBootUpTime)
    
    $properties=@{
    ‘ComputerName’=$pc;
    ‘UptimeDays’=$diff.Days;
    ‘UptimeHours’=$diff.Hours;
    ‘UptimeMinutes’=$diff.Minutes
    ‘UptimeSeconds’=$diff.Seconds
    }
    $obj = New-Object -TypeName PSObject -Property $properties
    
    Write-Output $obj
    }
    
    }

