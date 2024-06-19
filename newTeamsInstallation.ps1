# Get the current directory
$currentDirectory = Split-Path -Parent $PSCommandPath

# Build the path to the exe file
$exePath = Join-Path -Path $currentDirectory -ChildPath "teamsbootstrapper.exe"

# Start the exe process
Start-Process -FilePath $exePath -ArgumentList "-p" -NoNewWindow -Wait