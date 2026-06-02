# Clase 10. Chi-cuadrado y V de Cramer.

# 1. Cargar paquetes. -----------------------------------------------------

# Instalar paquetes nuevos (solo la primera vez)
install.packages("vcd")

# Cargar paquetes cada vez que abrimos una sesión nueva
library(tidyverse)
library(readxl)
library(vcd)


# 2. Chi-cuadrado y V de Cramer. ------------------------------------------
# La prueba de chi-cuadrado (χ²) permite evaluar si existe una asociación estadísticamente significativa entre dos variables categóricas. A diferencia de los tests anteriores, aquí no comparamos medias sino frecuencias observadas versus frecuencias esperadas bajo la hipótesis nula de independencia entre las variables.
# La hipótesis nula (H0) asume que las dos variables son independientes, es decir, que no existe asociación entre ellas. Si el valor p es menor a 0.05, rechazamos la hipótesis nula y concluimos que sí existe una asociación significativa.
# Sin embargo, el chi-cuadrado solo nos dice si existe o no asociación, no qué tan fuerte es. Para medir la fuerza de la asociación usamos la V de Cramer, que toma valores entre 0 y 1:
#   0.1 – 0.3: asociación débil
#   0.3 – 0.5: asociación moderada
#   > 0.5: asociación fuerte

# Flujo de trabajo en R:
# 1. Crear la tabla de contingencia: tab <- table(datos$Variable1, datos$Variable2)
# 2. Correr el chi-cuadrado: chi <- chisq.test(tab, correct = FALSE)
# 3. Ver valores observados y esperados: chi$observed / chi$expected
# 4. Calcular la V de Cramer: assocstats(tab)


# 3. Ejercicio 1: Tipo de momificación y sitio. ---------------------------
# Queremos evaluar si existe una asociación entre el tipo de momificación y el sitio de procedencia. En el sitio Morro 1 hay 31 momias tipo Negra, 19 tipo Roja y 22 con Vendaje. En el sitio Playa Miller hay 5 tipo Negra, 40 tipo Roja y 7 con Vendaje.

# 3.1. Crear la matriz de datos.
# Como los datos están en el enunciado (no en un archivo Excel), los ingresamos directamente con la función matrix().

momias <- matrix(c(31, 19, 22, 5, 40, 7), nrow = 3, ncol = 2)

# Asignamos nombres a filas y columnas con dimnames()
dimnames(momias) <- list(
  c("Negra", "Roja", "Vendaje"),
  c("Morro 1", "Playa Miller")
)

# Verificamos la matriz
momias

# Suma por fila y por columna
rowSums(momias)
colSums(momias)

# 3.2. Correr el chi-cuadrado.

chi1 <- chisq.test(momias, correct = FALSE)
chi1

# Valores observados y esperados
chi1$observed
chi1$expected

# 3.3. Calcular la V de Cramer.

assocstats(momias)

# 3.4. Interpretación.
# Existe una asociación significativa entre el tipo de momificación y el sitio (χ²=31.607, p<0.05). La V de Cramer=0.5 indica que la fuerza de esta asociación es relativamente fuerte.


# 4. Ejercicio 2: Estilo de arte rupestre y sector en el Alto Loa. --------
# Evaluamos si existe una asociación entre el estilo de arte rupestre y el sector geográfico (Norte/Sur) en el que se encuentran los sitios del Alto Loa.

# 4.1. Importar y explorar los datos.

sector_estilo <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase10/Sector_y_estilo.xlsx")
sector_estilo

# Tabla de contingencia con las variables de interés
table(sector_estilo$Sector, sector_estilo$Estilo)

# 4.2. Correr el chi-cuadrado.

chi2 <- chisq.test(sector_estilo$Sector, sector_estilo$Estilo, correct = FALSE)
chi2

# Valores observados y esperados
chi2$observed
chi2$expected

# 4.3. Calcular la V de Cramer.

tab2 <- table(sector_estilo$Sector, sector_estilo$Estilo)
assocstats(tab2)

# 4.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Existe una asociación entre el sector y el estilo de arte rupestre en el Alto Loa? ¿Qué tan fuerte es esa asociación según la V de Cramer?


# 5. Ejercicio 3: Estilo de arte rupestre y período en el Alto Loa. -------
# Evaluamos si existe una asociación entre el estilo de arte rupestre y el período cronológico al que pertenecen los sitios del Alto Loa.

# 5.1. Importar y explorar los datos.

periodo_estilo <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase10/Periodo_y_estilo.xlsx")
periodo_estilo

table(periodo_estilo$Periodo, periodo_estilo$Estilo)

# 5.2. Correr el chi-cuadrado.

chi3 <- chisq.test(periodo_estilo$Periodo, periodo_estilo$Estilo, correct = FALSE)
chi3

chi3$observed
chi3$expected

# 5.3. Calcular la V de Cramer.

tab3 <- table(periodo_estilo$Periodo, periodo_estilo$Estilo)
assocstats(tab3)

# 5.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Existe una asociación entre el período y el estilo de arte rupestre en el Alto Loa? ¿Qué tan fuerte es esa asociación según la V de Cramer?


# 6. Trabajo en Clases 10. ------------------------------------------------

caries <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase10/caries.xlsx")
caries

# 1. Evalúa si existe una asociación entre la presencia/ausencia de caries y el sitio de procedencia en San Pedro de Atacama. Crea la tabla de contingencia, corre el chi-cuadrado y calcula la V de Cramer. ¿Podemos rechazar la hipótesis nula? ¿Qué tan fuerte es la asociación? ¿Qué podría indicar esto arqueológicamente?
