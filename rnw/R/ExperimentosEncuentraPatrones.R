mensajes <- c("d427CHOI3g#######BAN####K37213484152313284973786####10####################", 
"d327CCxrCW0190113BAN####J873553141523131607405720000######################", 
"d527CDCpFY0190113BAN####B128137341523132316175440000######################", 
"d5277G0x76##########################################00####################", 
"d11C1NA62C01#####BAN####134948514772913027658402000000#####################")
patrones <- c("")
q <- length(mensajes)
p <- min(nchar(mensajes))
for (i in 1:q) {  # RECORRE LOS q MENSAJES PARA CONTAR NUMERO DE APARICIONES DE UNA SUBCADENA
  msj <- mensajes[i]
  for (j in 1:p) {  # SUPONIENDO QUE TODOS LOS MENSAJES TIENEN p CARACTERES
    continuarPatron <- TRUE
    subm <- ""
    for (lon in 0:(p-j)) {
      subm <- substr(msj, j, j + lon)
      contador <- sum(grepl(subm, mensajes))
      print(paste(substr(msj, 1, (j-1)), subm, substr(msj, (j+lon+1), p), "-", subm, contador))
      commandArgs(trailingOnly = TRUE)
    }
    if (nchar(subm) >= 2 & contador >= 2 & !(sum(grepl(subm, patrones)))) {
      print(subm)
      patrones <- c(patrones, subm)
    }
  }
}