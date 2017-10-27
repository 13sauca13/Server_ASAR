    #Importa el módulo de AD
ipmo ActiveDirectory

    #Accede a la información del comando para crear grupos
Get-Help New-ADGroup
    #Busca ejemplos de uso del comando
Get-Help New-ADGroup -Examples

    #Crea un grupo global
New-ADGroup -Name "_GAR-DOM12-POWERSHELL" `
-SamAccountName "_GAR-DOM12-POWERSHELL" `
-GroupCategory Security `
-GroupScope Global `
-DisplayName "_GAR-DOM12-POWERSHELL"

    #Crea un grupo local
New-ADGroup -Name "_LAR-DOM12-POWERSHELL" `
-SamAccountName "_LAR-DOM12-POWERSHELL" `
-GroupCategory Security `
-GroupScope DomainLocal `
-DisplayName "_LAR-DOM12-POWERSHELL"
