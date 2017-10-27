    #Lista los discos duros
Get-Disk

    #Muestra las particiones del disco 0
Get-Partition -DiskNumber 0

    <#
    Reduce el tamaño de la partición del S.O.
    Se debe indicar el tamaño total con que quedará!! No el de la partición que quiero crear
    #>
Resize-Partition -DiskNumber 0 -PartitionNumber 2 -Size (58.42GB)

    #Crea una nueva partición empleando el tamaño liberado
New-Partition -DiskNumber 0 -UseMaximumSize -DriveLetter E –MbrType IFS

    #Formatea la unidad creada en NTFS y la etiqueta como AD
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "AD"
