    #Importa el módulo de AD
ipmo ActiveDirectory

    #Accede a información sobre el comando para añadir miembros a grupos
Get-Help Add-ADGroupMember
    #Busca ejemplos de uso
Get-Help Add-ADGroupMember -Examples

    #Agrega el grupo global al local
Add-ADGroupMember -Identity _LAR-DOM12-POWERSHELL -Members _GAR-DOM12-POWERSHELL

    #Añade un usuario al gropo global
Add-ADGroupMember -Identity _GAR-DOM12-POWERSHELL -Members AMicroPower
