Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment
Install-ADDSDomainController -DomainName 'dom12.local' `
-SiteName 'AR-DOM12-SITE' `
-InstallDns `
-DatabasePath "E:\AD\NTDS" `
-LogPath "E:\AD\NTDS" `
-SysvolPath "E:\AD\SYSVOL" `
-Credential (Get-Credential) `
-Force
