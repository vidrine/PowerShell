Connect-AzureAD

# Single user
Get-AzureADUser -ObjectId 'mario@bowser.io' | 
Select-Object @{N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}}

# All users
Get-AzureADUser -All $true | 
Select-Object UserPrincipalName, @{N="PasswordNeverExpires";E={$_.PasswordPolicies -contains "DisablePasswordExpiration"}}

Disconnect-AzureAD
