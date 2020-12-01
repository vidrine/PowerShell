# Import the AD module to the session

Import-Module ActiveDirectory

# Stage variables
$exportPath = "$env:USERPROFILE\Documents\rx-output\"
$exportName = "$(Get-Date -Format yyyyMMdd_HHmm)-pwd-never-ad.csv"

# NO CHANGES BELOW -----------------------------------------------------------

# Create export file path object
$exportFile = Join-Path -Path $exportPath -ChildPath $exportName

# Search for the users and export report
$results = Get-ADUser -filter * -properties Name,PasswordNeverExpires,Mail | 
Where-Object {
    $_.passwordNeverExpires -eq "true" 
} |  Select-Object Name,sAMAccountName,Mail,Enabled,PasswordNeverExpires,DistinguishedName

$results | Export-csv -NoTypeInformation -Path $exportFile
