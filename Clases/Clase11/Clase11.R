# Clase 11. Regresión Lineal.

# 1. Cargar paquetes. -----------------------------------------------------

library(tidyverse)
library(readxl)


# 2. La regresión lineal. -------------------------------------------------
# La regresión lineal es un análisis estadístico que permite examinar si existe una relación entre dos variables continuas, donde se asume que una variable influencia los valores de la otra, es decir, evalúa causalidad.
# La variable independiente (X) es aquella cuyos valores no dependen de ninguna otra variable del modelo. La variable dependiente (Y) es aquella cuyos valores están en algún grado determinados por X.
# La ecuación de regresión lineal tiene la forma: Y = bX + a
# Donde b es el coeficiente de X (pendiente de la recta) y a es el intercepto (valor de Y cuando X = 0).
# Para evaluar el modelo se utilizan:
#   - El estadístico F y su valor p (significancia de la relación).
#   - El coeficiente de determinación r² (proporción de la variación en Y explicada por X).
# En R, la regresión lineal se realiza con la función lm():
# regresion <- lm(formula = variable_dependiente ~ variable_independiente, data = nombre_datos)
# Los resultados detallados se obtienen con summary(regresion).


# 3. Ejercicio 1: Azadas por área de sitio. -------------------------------
# Se desea evaluar si existe una relación lineal significativa entre el área de sitio (ha) (variable independiente) y el número de azadas recuperadas por cada 100 artefactos recolectados (variable dependiente).

# 3.1. Importar y explorar los datos.

data <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase11/Ejemplo_azadas.xlsx")
data

# Exploramos la distribución de los datos mediante un gráfico de dispersión.

ggplot(data = data, aes(x = Area, y = Azadas)) +
  geom_point() +
  labs(x = "Área de sitio (ha)", y = "Número de azadas", title = "Azadas por área de sitio") +
  theme_classic()

# 3.2. Ajustar el modelo de regresión lineal.

regresion <- lm(formula = Azadas ~ Area, data = data)
regresion

# 3.3. Ver los resultados del modelo.

summary(regresion)

# 3.4. Escribir la ecuación de regresión.
# En base a los resultados de summary(regresion), la ecuación de regresión es:

# Y = -1.958 * X + 47.802

# 3.5. Realizar predicciones.
# ¿Cuántas azadas se esperan en un sitio con un área de 14.5 ha?

-1.958 * 14.5 + 47.802

# 3.6. Graficar la línea de regresión.

ggplot(data = data, aes(x = Area, y = Azadas)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  labs(x = "Área de sitio (ha)", y = "Número de azadas", title = "Azadas por área de sitio") +
  theme_classic()

# 3.7. Interpretación.
# El análisis de regresión lineal indica que existe una relación lineal negativa y estadísticamente significativa entre el área del sitio y el número de azadas (F = 13.81, p = 0.003). La ecuación de regresión obtenida es Y = -1.958X + 47.802, lo que indica que a medida que aumenta el área del sitio, el número de azadas disminuye. El coeficiente de determinación r² = 0.535 indica que el 53.5% de la variación en el número de azadas se explica por el área del sitio. Arqueológicamente, esto puede interpretarse como una mayor diversidad de actividades o una menor especialización en la producción agrícola en los sitios de mayor tamaño.


# 4. Ejercicio 2: Peso de puntas de proyectil por largo. ------------------
# Se desea evaluar si existe una relación lineal significativa entre el largo de puntas de proyectil (cm) (variable independiente) y su peso (gr) (variable dependiente).

# 4.1. Importar y explorar los datos.

data1 <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase11/Puntas_proyectil.xlsx")
data1

# Exploramos la distribución de los datos mediante un gráfico de dispersión.

ggplot(data = data1, aes(x = Largo, y = Peso)) +
  geom_point() +
  labs(x = "Largo (cm)", y = "Peso (gr)", title = "Peso de puntas de proyectil por largo") +
  theme_classic()

# 4.2. Ajustar el modelo de regresión lineal.

regresion1 <- lm(formula = Peso ~ Largo, data = data1)
regresion1

# 4.3. Ver los resultados del modelo.

summary(regresion1)

# 4.4. Escribir la ecuación de regresión.
# Nótese que el intercepto es negativo, por lo tanto la ecuación es:

# Y = 1.631 * X - 2.190

# 4.5. Realizar predicciones.
# ¿Cuánto pesará una punta de proyectil con un largo de 3 cm?

1.631 * 3 - 2.190

# 4.6. Graficar la línea de regresión.

ggplot(data = data1, aes(x = Largo, y = Peso)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  labs(x = "Largo (cm)", y = "Peso (gr)", title = "Peso de puntas de proyectil por largo") +
  theme_classic()

# 4.7. Interpretación.
# El análisis de regresión lineal muestra que existe una relación lineal positiva y estadísticamente significativa entre el largo y el peso de las puntas de proyectil (F = 16.20, p = 0.003). La ecuación de regresión obtenida es Y = 1.631X - 2.190, lo que indica que a mayor largo, mayor será el peso de la punta. El coeficiente de determinación r² = 0.669 indica que el 66.9% de la variación en el peso de las puntas se explica por su largo. Arqueológicamente, esta relación morfométrica sugiere una proporcionalidad consistente en la manufactura de estas piezas, lo que podría indicar estandarización tecnológica en su producción.


# 5. Ejercicio 3: Grosor de jarro cerámico por altura. --------------------
# Se desea evaluar si existe una relación lineal significativa entre la altura de jarros cerámicos (cm) (variable independiente) y su grosor de paredes (cm) (variable dependiente).

# 5.1. Importar y explorar los datos.

data2 <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase11/Jarro_ceramico.xlsx")
data2

# Exploramos la distribución de los datos mediante un gráfico de dispersión.

ggplot(data = data2, aes(x = Altura, y = Grosor)) +
  geom_point() +
  labs(x = "Altura (cm)", y = "Grosor (cm)", title = "Grosor de jarro cerámico por altura") +
  theme_classic()

# 5.2. Ajustar el modelo de regresión lineal.

regresion2 <- lm(formula = Grosor ~ Altura, data = data2)
regresion2

# 5.3. Ver los resultados del modelo.

summary(regresion2)

# 5.4. Escribir la ecuación de regresión.
# Nótese que el intercepto es negativo, por lo tanto la ecuación es:

# Y = 0.161 * X - 0.632

# 5.5. Realizar predicciones.
# ¿Cuál será el grosor de un jarro con una altura de 20 cm?

0.161 * 20 - 0.632

# 5.6. Graficar la línea de regresión.

ggplot(data = data2, aes(x = Altura, y = Grosor)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  labs(x = "Altura (cm)", y = "Grosor (cm)", title = "Grosor de jarro cerámico por altura") +
  theme_classic()

# 5.7. Interpretación.
# El análisis de regresión lineal muestra que existe una relación lineal positiva y altamente significativa entre la altura y el grosor de los jarros cerámicos (F = 53.03, p < 0.001). La ecuación de regresión obtenida es Y = 0.161X - 0.632, lo que indica que a mayor altura del jarro, mayor es el grosor de sus paredes. El coeficiente de determinación r² = 0.869 indica que el 86.9% de la variación en el grosor se explica por la altura del jarro. Arqueológicamente, este resultado sugiere que existía un patrón tecnológico consistente en la producción alfarera: a medida que se elaboraban piezas más altas, los alfareros aumentaban proporcionalmente el grosor de las paredes, probablemente para garantizar la estabilidad estructural del recipiente.

# 6. Trabajo en Clases.

#Para esta actividad utilizaremos las bases de datos Lascas_Atacama.xlsx, Densidad_artefactual_Mapocho.xlsx y Puntas_NISP_Patagonia.xlsx. Puedes encontrarlas en el repositorio del curso.

#1. Durante prospecciones en el desierto de Atacama se registraron 14 sitios con evidencia de talla lítica. Para cada sitio se midió la distancia (km) a la fuente de materia prima más cercana y se contabilizó el número total de lascas de talla recuperadas. Se hipotetiza que a mayor distancia a la fuente de materia prima, mayor es la inversión en reducción del núcleo y, por lo tanto, mayor el número de lascas producidas en el sitio. Importe los datos desde Lascas_Atacama.xlsx y evalúe si existe una relación lineal significativa entre la Distancia a la fuente de materia prima y el número de Lascas. ¿Cuántas lascas se esperaría encontrar en un sitio ubicado a 20 km de la fuente de materia prima? 
  
#2. En el marco de un estudio sobre patrones de asentamiento prehispánico en el valle del río Mapocho, se midió la distancia al cauce del río (km) de 14 sitios arqueológicos y se calculó la densidad artefactual superficial (artefactos/m²) en cada uno de ellos. Se hipotetiza que los sitios más cercanos al río presentan una mayor concentración de material, producto de una mayor intensidad de ocupación en torno al río. Importe los datos desde Densidad_artefactual_Mapocho.xlsx y evalúe si existe una relación lineal significativa entre la Distancia al río y la Densidad artefactual.

#3. En 15 sitios cazadores-recolectores de la Patagonia chilena se registró el número de puntas de proyectil recuperadas y la abundancia relativa de fauna expresada como NISP (Number of Identified Specimens). Se hipotetiza que una mayor cantidad de puntas de proyectil debería asociarse a una mayor representación faunística en el registro arqueológico, como reflejo de una mayor intensidad de actividades de caza. Importe los datos desde Puntas_NISP_Patagonia.xlsx y evalúe si existe una relación lineal significativa entre el número de Puntas y el NISP. 