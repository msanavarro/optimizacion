k <- 9
mensajes <- c()
for (i in 0:k) {
  mensajes <- c(mensajes, paste0('mensaje', i))
}

k <- length(mensajes)
lonM <- nchar(mensajes[1])

for (i in 1:k){
  for (j in 1:lonM) {
    m <- lonM
    contadorViejo <- -1
    continua <- TRUE
    while (m >= (j+1) & continua) {
      subm <- substr(mensajes[i], j, m)
      contador <- sum(grepl(subm, mensajes))
      continua <- (contador > contadorViejo)
      if (continua) {
        print(paste(substr(mensajes[i], 1, (j-1)), subm, substr(mensajes[i], (m+1), lonM), '--', contador))
      }
      contadorViejo <- contador
      m <- m - 1
    }
  }
}
