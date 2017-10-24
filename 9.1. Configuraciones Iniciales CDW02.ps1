   <#
    Este debe ser introducido en CMD para eliminar caducidad de contraseña de Administrador. SOLO para laboratorio
    wmic useraccount where Name='Administrador' set PasswordExpires=false
    #>
    
    #Elimina la interfaz gráfica
Uninstall-WindowsFeature Server-Gui-Mgmt-Infra 

    #Direccionamiento IP
New-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet -IPAddress 172.16.12.253 -PrefixLength 24 -DefaultGateway 172.16.12.1

Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 172.16.12.254

    #Deshabilitado de IPv6
reg add "HKLM\System\CurrentControlSet\Services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 0x000000FF
reg add "HKLM\System\CurrentControlSet\Services\TCPIP6\Parameters" /v " DisableIPSourceRouting" /t REG_DWORD /d 0x0000002

    #Habilitado de escritorio remoto
Enable-NetFirewallRule -DisplayGroup "Escritorio Remoto"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1

    #Formateo de disco
Resize-Partition -DiskNumber 0 -PartitionNumber 2 -Size (58.42GB)
New-Partition -DiskNumber 0 -UseMaximumSize -DriveLetter E –MbrType IFS
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "AD"

    #Renombrado de equipo
Rename-Computer 'SRVDOM12CDW02'
Restart-Computer
