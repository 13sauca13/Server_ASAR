    #Importa el módulo de AD
ipmo ActiveDirectory

    #Busca información sobre el comando para crear usuarios
Get-Help New-ADUser
    #Busca ejemplos de uso
Get-Help New-ADUser -Examples

    #Crea un usuario
New-ADUser -DisplayName "Alumno Microsoft PowerShell" `
-GivenName "Alumno" `
-Surname "Microsoft PowerShell" `
-Name "Alumno Microsoft PowerShell" `
-SamAccountName "AMicroPower" `
-UserPrincipalName:"AMicroPower@PROFE.LOCAL" `
-ChangePasswordAtLogon $false `
-PasswordNeverExpires $true ` #Sólo a efectos de laboratorio, el campo debe ser false
-AccountPassword (ConvertTo-SecureString -AsPlainText -String "Minisdef01" -Force) `
-Enabled $true #Hay que forzar que el usuario esté habilitado, si no se creará deshabilitado por defecto

    #Accede a las propiedades del usuario creado
Get-ADUser AMicroPower