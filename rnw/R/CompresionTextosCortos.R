library(openssl)
library(ggplot2)

texto <- "Este es un texto de prueba hecho el 19 de septiembre del 2018 y usa muchos simbolos como: (estos) & estos #$<=>"

splitInParts <- function(string, size){
  pat <- paste0('(?<=.{',size,'})')
  strsplit(string, pat, perl=TRUE)[[1]]
}

# TRANSCODIFICACION *******************************************************************************
# *************************************************************************************************
# *************************************************************************************************

#  Regla 1
# No hace nada
# Reglas 2, 3 y 4 (se sustituyen los espacios por '/' y los símbolos +@$_!"#%&\'()*,-./:;<=>?□□□[\\]^{|}~ ' son
# sustituidos de acuerdo a la tabla de correspondencias)
# TABLA DE CORRESPONDECIA *******************************************************************************
simbolos <- '+@$_!"#%&\'()*,-./:;<=>?□□□[\\]^{|}~ '
metacaracteres <- splitInParts('^$()[{\\|.*+?', 1)
tablaCorrespondencias <- data.frame(simbolo = splitInParts(simbolos, 1), sustituto = c('+m', paste0('+', letters[c(1:12,14:26)]), paste0('+\\+', letters[1:8]), '/'))
tablaCorrespondencias$simbolo <- as.character(tablaCorrespondencias$simbolo)
tablaCorrespondencias$sustituto <- as.character(tablaCorrespondencias$sustituto)
metacaractersCorr <- which(tablaCorrespondencias$simbolo %in% metacaracteres)
tablaCorrespondencias$simbolo[metacaractersCorr] <- paste0('\\', tablaCorrespondencias$simbolo[metacaractersCorr])

m <- nchar(simbolos)
texto2 <- texto
for (i in 1:m) {
  texto2 <- gsub(tablaCorrespondencias$simbolo[i], tablaCorrespondencias$sustituto[i], texto2)
}
# Regla 5 (en caso de que hubiera un signo de puntuación seguido de un espacio, cambia su codificación '+minuscula' por '+MAYUSCULA')
porCambiar <- sapply(gregexpr('\\+[a-z]/', texto2)[[1]],function(x){substr(texto2, x, (x+2))})
n <- length(porCambiar)
texto3 <- texto2
for (i in 1:n) {
  texto3 <- gsub(paste0('\\', porCambiar[i]), substr(toupper(porCambiar[i]), 1, 2), texto3)
}
print(texto3)

# DESTRANSCODIFICACION ****************************************************************************
# *************************************************************************************************
# *************************************************************************************************

# Ahora del texto transcodificado se debe de recuperar el texto original, 
# siguiendo las mismas reglas pero en reversa
# Regla 5 (en caso de que hubiera un signo de puntuación seguido de un espacio, cambia su codificación '+minuscula' por '+MAYUSCULA')
porCambiar <- sapply(gregexpr('\\+[A-Z]', texto3)[[1]],function(x){substr(texto3, x, (x+1))})
n <- length(porCambiar)
texto2 <- texto3
for (i in 1:n) {
  texto2 <- gsub(paste0('\\', porCambiar[i]), paste0(substr(tolower(porCambiar[i]), 1, 2), "/"), texto2)
}

# Reglas 2, 3, y 4
m <- nchar(simbolos)
texto <- texto2
for (i in m:1) {
  texto <- gsub(paste0("\\", tablaCorrespondencias$sustituto[i]), tablaCorrespondencias$simbolo[i], texto)
}

print(texto)

# COMPRESION **************************************************************************************
# *************************************************************************************************
# *************************************************************************************************

print(base64_encode(base64_decode(texto3)))
print(base64_decode(texto3))

# EXPERIMENTOS ************************************************************************************
# *************************************************************************************************
# *************************************************************************************************

simbolos <- c(0:9, letters, LETTERS, ' ', '.')
m <- length(simbolos)-1
simbolos <- data.frame(simbolo = simbolos, codigo = 0:m)

texto <- "Este es un texto de pruebas con simbolos alfanumericos 20 de septiembre del 2018"
caracteres <- splitInParts(texto, 1)
m <- length(caracteres)
caracteresCodificados <- data.frame(n = 1:m, caracter = caracteres, codigo = sapply(caracteres, function(c){which(simbolos$simbolo == c)-1}))

# COMBINATORIA DE LOS MENSAJES POSIBLES ***********************************************************

n <- 32                      # numero de caracteres
k <- 0                       # bits necesarios para representar cada uno de los caracteres
while ((2^k) < n) {
  k <- k + 1
}
m <- 100                     # longitud del mensaje
mk <- m * k                  # bits necesarios para guardar el mensaje
mP <- n ^ m                  # numero de mensajes posibles

# Al reducir el número de caracteres, digamos quitando las mayúsculas, para codificar un mensaje que 
# originalmente tenía más caracteres (mayúsculas) será necesario representar de alguna manera a los
# caractees perdidos (símbolo + minúscula). Si en el mensaje no hay muchas mayúsculas puede valer la 
# pena el caracter extra a cambio de los bits ahorrados en cada caracter del mensaje

# DICCIONARIO *************************************************************************************

# diccionario <- data.frame(palabra = 'palabra', codigo = 0, numOcurrencias = 0)
# diccionario <- diccionario[order(diccionario$numOcurrencias), ]
# m <- nrow(diccionario)
# 
# palabras <- c("Sarmiento", "Navarro", "Pérez", "Arellano", "Medra", "Covarrubias", "Sánchez")
# codigos <- c()
# n <- length(palabras)
# for (i in 1:n) {
#   j <- 1
#   encontre <- FALSE
#   while (j <= m & encontre == FALSE) {
#     if (palabras[i] == diccionario$palabra[j]) {
#       encontre <- TRUE
#       diccionario$numOcurrencias[j] <- diccionario$numOcurrencias[j] + 1 
#     } else {
#       j <- j + 1
#     }
#   }
#   if (encontre == FALSE) {
#     nuevaLinea <- data.frame(palabra = palabras[i], codigo = j, numOcurrencias = 1)
#     diccionario <- rbind(diccionario, nuevaLinea)
#     m <- m + 1
#   }
#   codigos[i] <- j
# }

# EJEMPLO CON TEXTO TIPO **************************************************************************

# Resumir subcadenas ########## con #10#
cadena <- "d11C1NA62C01#####BAN####134948514772913027658402000000####################"
n <- nchar(cadena)
j <- 1
k <- 0
cadena2 <- ""
for ( i in 1:n) {
  if (substr(cadena, i, i) == "#") {
    k <- k + 1
  } else {
    if (k > 0) {
      cadena2 <- paste0(cadena2, "#", k, "#")
      k <- 0
    }
    cadena2 <- paste0(cadena2, substr(cadena, i, i))
  }
  if (i == n) {
    if (k > 0) {
      cadena2 <- paste0(cadena2, "#", k, "#")
      k <- 0
    }
  }
}
nchar(cadena) / nchar(cadena2)

print(base64_encode(base64_decode(cadena)))

c(0, 1, 10, 11, 100, 101, 111, 1000, 1001, 1010, 1011, 1100, 1101, 1110, 1111, 10000)

# CODIFICACION DE HUFFMAN *************************************************************************