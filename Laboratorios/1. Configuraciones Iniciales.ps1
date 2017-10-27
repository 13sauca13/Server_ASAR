    #Consulta el direccionamiento IPv4
Get-NetIPAddress -AddressFamily IPv4

    #Modificam el direccionaminento del interfaz Ethernet con su IP, prefijo de subred y puerta de acceso
New-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet -IPAddress 172.16.12.254 -PrefixLength 24 -DefaultGateway 172.16.12.1

    #El primer servidor debe apuntar a si mismo como DNS para resolver su propio nombre
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 172.16.12.254

    #Deshabilita los componentes de IPv6
reg add "HKLM\System\CurrentControlSet\Services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 0x000000FF
    #Deshabilita el propio enrutamiento IPv6
reg add "HKLM\System\CurrentControlSet\Services\TCPIP6\Parameters" /v " DisableIPSourceRouting" /t REG_DWORD /d 0x0000002

    <#
    Permite el escritorio remoto en el firewall
    De estar en inglés el SO debería decir "Remote Desktop" en lugar de "Escritorio Remoto"
    #>
Enable-NetFirewallRule -DisplayGroup "Escritorio Remoto"
    #Modifica los valores de registro para habilitar el escritorio remoto
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1

    #Modifica el nombre del equipo
Rename-Computer SRVDOM12CDW01

    #Reinicia el equipo
Restart-Computer
