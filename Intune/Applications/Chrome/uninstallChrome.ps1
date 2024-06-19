# Get the uninstall string from the registry
$UninstallString = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome' -Name UninstallString -ErrorAction SilentlyContinue

# Check if Google Chrome is installed
if ($UninstallString) {
    # Execute the uninstall command
    Start-Process -FilePath "$env:ComSpec" -ArgumentList "/c $($UninstallString.UninstallString)" -Wait -PassThru
    Write-Output "Google Chrome has been uninstalled."
} else {
    Write-Output "Google Chrome is not installed on this machine."
}