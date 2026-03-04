# Clase 2. Estadística Descriptiva. Medidas de Tendencia Central y dispersión.

# 1. Instalar paquetes. ---------------------------------------------------
# R viene con funciones básicas instaladas ("base R"), pero la verdadera potencia reside en los paquetes externos. Para usarlos, seguimos dos pasos: instalarlos (una sola vez en tu computadora, mediante la función install.packages("nombre_del_paquete")) y cargarlos (cada vez que abras un nuevo script, mediante la función library("nombre_del_paquete")).

# Instalar paquete por única vez. Estos son algunos que usaremos esta y la siguientes clases. Quítale el "#" a las siguientes líneas si necesitas instalarlos por primera vez:
# install.packages("tidyverse") 
# install.packages("readxl")
# install.packages("dplyr")

# Cargar paquete cada vez que abras una sesión nueva de RStudio. 
library(readxl) 
library(tidyverse)
library(dplyr)


# 2. Preparación de datos. ------------------------------------------------
# Importamos nuestros datos mediante el botón import o bien mediante la función read_excel() del paquete readxl. En este caso trabajaremos con la base de datos Tabla_camelida.xlsx.
# Para utilizar las función read_excel debes escribir la ruta exacta del archivo que quieres cargar. en mi caso es:

# camelidos <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase2/Tabla camelida.xlsx") #edita este campo y borra el # al inicio para cargar la tabla
camelidos


# 3. Filtrado de datos. ---------------------------------------------------
# A menudo necesitamos aislar datos específicos. Para esto, usaremos la función filter() junto al operador pipe (%>%) disponibles en el paquete tidyverse, que funciona como un "entonces": "toma los datos, y luego fíltralos". En este caso haremos el ejercicio de filtrar solo los datos provenientes del Taxón llamas. Tanto las variables como los datos a seleccionar deben ser escritos tal cual como están en la base de datos original.

# Creamos un nuevo dataframe solo con los datos de LLAMA
llama <- camelidos %>% filter(Taxon == "LLAMA")

# Verificamos el resultado
llama


# 4. Estadísticas Descriptivas. -------------------------------------------
# Para conocer las medidas de tendencia central y dispersión de nuestra muestra, R nos ofrece múltiples funciones. Podemos usar summary() para obtener un resumen general rápido de una variable específica. Para indicarle a R exactamente qué columna queremos analizar dentro de nuestro dataframe, usamos el signo $.

# Resumen estadístico general (Mínimo, Cuartiles, Mediana, Media, Máximo)
summary(llama$Ancho)

# Si necesitamos extraer un valor específico para reportarlo o usarlo en otra fórmula, podemos calcular cada parámetro de forma independiente usando sus funciones específicas:

# Medidas de Tendencia Central
mean(llama$Ancho)   # Media o Promedio
median(llama$Ancho) # Mediana

# Medidas de Posición y Dispersión
quantile(llama$Ancho) # Cuartiles
IQR(llama$Ancho)      # Rango Intercuartil
sd(llama$Ancho)       # Desviación Estándar (Standard Deviation)
var(llama$Ancho)      # Varianza


# 5. Visualización de datos: Histograma. ----------------------------------
# Para explorar visualmente cómo se distribuyen nuestros datos, crearemos un histograma. Para esto usaremos ggplot2, un paquete especializado en gráficos que ya viene incluido y cargado dentro de tidyverse. 

# Usaremos la función ggplot(). Primero definimos nuestros datos (data = llama), luego en aes() (aesthetics) definimos qué variable irá en el eje X (en este caso, el Ancho). Finalmente, le indicamos el tipo de gráfico con geom_histogram(), donde podemos personalizar el grosor de las barras (