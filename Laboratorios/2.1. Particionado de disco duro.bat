  ::Lista los discos conectados
list disk
  
  ::Lista las particiones creadas en el sistema
list partition
  
  ::Lista los volúmenes creados en el sistema
list volume
  
  ::Selecciona el disco que contiene el volumen del sistema
select volume 2
  
  ::Reduce el volumend el disco en 1024
shrink desired=1024
  
  ::Crea una partición con el espacio liberado
select disk 0create partition primary
 
 ::Formatea la prtición creada en NTFS
select partition 3format fs=NTFS label="AD" quick
  
  ::Asigna la letra E: al volumen creado
select volume 3assign letter="E"

exit
