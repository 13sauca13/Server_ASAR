    #Habilita la ejcución de scripts no firmados
Set-ExecutionPolicy RemoteSigned
    
    #Crea todos los usuarios del CSV con el .ps1 de CreecionUsuario
Import-Csv .\Desktop\UsuariosDominio.csv | ForEach-Object {
    .\Documents\CreacionUsuario.ps1 -Nombre $_.Nombre -Apellido1 $_.Apellido1 -Apellido2 $_.Apellido2 -Logon $_.Login}