    #Lista las características que pueden ser instaladas
Get-WindowsFeature
    #Lista las características que contengan AD
Get-WindowsFeature *AD*

    #Instala el servicio de AD-Domain-Services
Add-WindowsFeature -Name AD-Domain-Services
    #Carga las características que faltan
Add-WindowsFeature RSAT-ADDS -includeAllSubFeature

    #Finaliza la configuración del dominio
Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "E:\AD\NTDS" `
-DomainMode "Win2008R2" `
-DomainName "DOM12.LOCAL" `
-DomainNetbiosName "DOM12" `
-ForestMode "Win2008R2" `
-InstallDns:$true `
-LogPath "E:\AD\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "E:\AD\SYSVOL" `
-Force:$true

    #Al acabar el servidor se debe reiniciar
