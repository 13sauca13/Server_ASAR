    #Instala caracteristicas necesarias para que actue de DC
Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
  #Carga las características que faltan
Add-WindowsFeature RSAT-ADDS -includeAllSubFeature
  #Aquí debe reiniciarse el equipo
    
    #Configuración del dominio
Import-Module ADDSDeployement
Install-ADDSDomainController `
-DomainName 'dom12.local' `
-SiteName 'DOM12-SITE' `
-InstallDns `
-DatabasePath "E:\AD\NTDS" `
-LogPath "E:\AD\NTDS" `
-SysvolPath "E:\AD\SYSVOL" `
-Credential (Get-Credential) `
-Force
