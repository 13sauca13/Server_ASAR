  #Lista los discos duros
Get-Disk

  #Pone online el nuevo disco de no estarlo
Set-Disk  1 -IsOffline $False
  #Inicializa el disco y monta como GPT
Initialize-Disk -Number 1 -PartitionStyle GPT
  #Crea una nueva partición
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter G
  #Formatea la unidad creada en NTFS y la etiqueta como COMUSER
Format-Volume -DriveLetter G -FileSystem NTFS -NewFileSystemLabel "COMUSER"
