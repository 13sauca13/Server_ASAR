﻿    #Importa el modulo de AD
Import-Module ActiveDirectory

    #Crea grupo local y global para los administradores delegados y anida
$grp="ADM-DELEGADOS" #Aqui definimos la variable $grp para agilizar mas adelante
New-ADGroup -Name "_GAR-DOM12-$grp" `
-SamAccountName _GAR-DOM12-$grp `
-GroupCategory Security `
-GroupScope Global `
-DisplayName _GAR-DOM12-$grp
New-ADGroup -Name "_LAR-DOM12-$grp" `
-SamAccountName _LAR-DOM12-$grp `
-GroupCategory Security `
-GroupScope DomainLocal `
-DisplayName _GAR-DOM12-$grp
Add-ADGroupMember -Identity _LAR-DOM12-$grp -Members _GAR-DOM12-$grp

    #Añade dos usuarios al grupo global de ADM-DELEGADOS
Add-ADGroupMember -Identity _GAR-DOM12-$grp -Members ccorigl,acanmor

    #Crea la OU de usuarios delegados
New-ADOrganizationalUnit -Name PARA_DELEGAR -Path "OU=USUARIOS,DC=DOM12,DC=LOCAL"

    #Mueve usuarios a la OU PARA_DELEGAR
Get-ADUser amuñjim | Move-ADObject -TargetPath "OU=PARA_DELEGAR,OU=USUARIOS,DC=DOM12,DC=LOCAL"
Get-ADUser aromgom | Move-ADObject -TargetPath "OU=PARA_DELEGAR,OU=USUARIOS,DC=DOM12,DC=LOCAL"

    #Crea grupo local y global para la OU "PARA_DELEGAR" y anida
$grp2="PRUEBA-PARA_DELEGAR" #Aqui definimos la variable $grp2 para agilizar mas adelante
New-ADGroup -Name "_GAR-DOM12-$grp2" `
-SamAccountName _GAR-DOM12-$grp2 `
-GroupCategory Security `
-GroupScope Global `
-DisplayName _GAR-DOM12-$grp2
New-ADGroup -Name "_LAR-DOM12-$grp2" `
-SamAccountName _LAR-DOM12-$grp2 `
-GroupCategory Security `
-GroupScope DomainLocal `
-DisplayName _LAR-DOM12-$grp2
Add-ADGroupMember -Identity _LAR-DOM12-$grp2 -Members _GAR-DOM12-$grp2
