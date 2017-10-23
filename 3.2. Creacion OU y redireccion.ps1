    #Crea la unidad organizativa "ESTACIONES" para los equipos del dominio
New-ADOrganizationalUnit ESTACIONES
    #Crea la unidad organizativa "USUARIOS" para los usuarios del dominio
New-ADOrganizationalUnit USUARIOS

    #Elimina la OU "USUARIOS"
Get-ADOrganizationalUnit -Filter {name -eq 'USUARIOS'} | Remove-ADObject

    #Por defecto al crear las OU están protegidas contra eliminación accidental
Get-ADOrganizationalUnit -Filter {name -eq 'USUARIOS'} –Properties *
    #Pasa la propiedad "ProtectedFromAccidentalDeletion" a False
Get-ADOrganizationalUnit -Filter {name -eq 'USUARIOS'} | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false

    #Modifica la OU por defecto para usuarios
Redirusr "OU=USUARIOS,DC=DOM12,DC=local"
    #Modifica la OU por defecto para equipos
Redircmp "OU=ESTACIONES,DC=DOM12,DC=local”