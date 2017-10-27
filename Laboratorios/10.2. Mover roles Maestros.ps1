  #Mueve los roles de Maestros
Move-ADDirectoryServerOperationMasterRole -Identity "SRVDOM12CDW01" `
-OperationMasterRole RIDMaster, InfraStructureMaster, PDCEmulator
