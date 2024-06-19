$MSTeams = "MicrosoftTeams"; 
$WinPackage = Get-AppxPackage | Where-Object { $_.Name -eq $MSTeams }; 
$ProvisionedPackage = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -eq $WinPackage }; 
if ($null -ne $WinPackage) 
    { 
        Remove-AppxPackage -Package $WinPackage.PackageFullName 
    }; 
if ($null -ne $ProvisionedPackage) 
    { 
        Remove-AppxProvisionedPackage -Online -Packagename $ProvisionedPackage.Packagename 
    }; 
$WinPackageCheck = Get-AppxPackage | Where-Object { $_.Name -eq $MSTeams }; 
$ProvisionedPackageCheck = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -eq $WinPackage }; 
if (($WinPackageCheck) -or ($ProvisionedPackageCheck)) { throw }