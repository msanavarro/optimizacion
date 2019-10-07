mensajes <- c("d427CHOI3g#######BAN####K37213484152313284973786####10####################", 
              "d327CCxrCW0190113BAN####J873553141523131607405720000######################", 
              "d527CDCpFY0190113BAN####B128137341523132316175440000######################", 
              "d5277G0x76##########################################00####################", 
              "d11C1NA62C01#####BAN####134948514772913027658402000000#####################")
patrones <- data.frame(patron = '', numOcur = 0)
patrones <- patrones[-1,]
q <- length(mensajes)
p <- min(nchar(mensajes))
for (i in 1:1) {  # RECORRE LOS q MENSAJES PARA CONTAR NUMERO DE APARICIONES DE UNA SUBCADENA
  msj <- mensajes[i]
  for (j in 1:1) {  # SUPONIENDO QUE TODOS LOS MENSAJES TIENEN p CARACTERES
    continuarPatron <- TRUE
    subm <- ""
    lon <- (p-j)
    contadorNuevo <- 0
    contadorViejo <- 0
    while (lon >= 0 & contadorNuevo >= contadorViejo) {
      contadorViejo <- contadorNuevo
      subm <- substr(msj, j, j + lon)
      contadorNuevo <- sum(grepl(subm, mensajes))
      print(paste(j, lon, substr(msj, 1, (j-1)), subm, substr(msj, (j+lon+1), p), "-", subm, contadorNuevo))
      lon <- lon - 1
    }
    if (nchar(subm) >= 2 & contadorViejo >= 2 & !(sum(grepl(subm, patrones$patron))) & !(subm %in% patrones$patron)) {
      print(subm)
      nuevoPatron <- data.frame(patron = substr(subm, 1, (lon-1)), numOcur = contadorViejo)
      patrones <- rbind(patrones, nuevoPatron)
    }
  }
}