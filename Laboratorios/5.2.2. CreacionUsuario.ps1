Param ([Parameter(Mandatory=$true)] [string]$Nombre,
[Parameter(Mandatory=$true)] [string]$Apellido1,
[Parameter(Mandatory=$true)] [string]$Apellido2,
[Parameter(Mandatory=$true)] [string]$Logon)
$Dominio=(Get-ADDomain).DNSRoot
New-ADUser -DisplayName "$Nombre $Apellido1 $Apellido2" `
-GivenName "$Nombre" `
-Surname "$Apellidos" `
-Name "$Nombre $Apellido1 $Apellido2" `
-SamAccountName "$Logon" `
-UserPrincipalName:"$Logon@$Dominio" `
-ChangePasswordAtLogon $false `
-PasswordNeverExpires $true `
-AccountPassword (ConvertTo-SecureString ` -AsPlainText -String "Minisdef01" -Force) `
-Enabled $true
