    #Accede al módulo Active Directory
ipmo activedirectory

    #Comprueba el nombre del sitio configurado actualmente
Get-AdObject -SearchBase (Get-ADRootDSE).ConfigurationNamingContext -Filter {Objectclass -eq 'site'} | fl –Property Name

    <#
    Cambia el nombre del SITE.
    El nombre es %NetBIOS%-SITE (ej. DOM12-SITE)
    #>
Get-AdObject -SearchBase (Get-ADRootDSE).ConfigurationNamingContext -Filter {Objectclass -eq 'site'} | Rename-ADObject -NewName "DOM12-SITE"

    #Crea la subred necesaria para el sitio de AD que se ha creado
New-ADObject -Name "172.16.12.0/24" -Type Subnet -Path “CN=SubNets,CN=Sites,CN=Configuration,DC=DOM12,DC=local" -OtherAttributes @{SiteObject="CN=DOM12-SITE,CN=Sites,CN=Configuration,DC=DOM12,dc=local"}
