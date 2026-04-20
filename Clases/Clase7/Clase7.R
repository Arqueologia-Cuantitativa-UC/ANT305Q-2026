# Clase 7. Prueba t de Student.

# 1. Cargar paquetes. -----------------------------------------------------

library(tidyverse)
library(readxl)


# 2. La prueba t de Student. ----------------------------------------------
# La prueba t de Student es un test estadístico que permite comparar las medias de dos grupos y determinar si las diferencias observadas entre ellas son estadísticamente significativas o si podrían deberse al azar.
# La lógica del test parte de una hipótesis nula (H0), que asume que las dos muestras provienen de poblaciones con la misma media, es decir, que no hay diferencias reales entre los grupos. Si el valor p obtenido es menor a 0.05, rechazamos la hipótesis nula y concluimos que sí existen diferencias estadísticamente significativas entre los grupos.
# En R, la prueba t se realiza con la función t.test(). La sintaxis usa el símbolo ~ para separar la variable cuantitativa de la variable cualitativa:
# t.test(variable_cuantitativa ~ variable_cualitativa, data = nombre_datos)


# 3. Ejercicio 1: Largo de cráneo en T. rex y T. bataar. ------------------
# Realice un test t para comparar las medias de largo de cráneo (m) de T. rex y T. bataar. Se asume como hipótesis nula que las dos muestras fueron tomadas de poblaciones con las mismas medias, por lo tanto no existen diferencias estadísticamente significativas entre ellas.

# 3.1. Importar y explorar los datos.

dinosaurio <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase7/Dinosaurio.xlsx")
dinosaurio

# Exploramos los datos con un boxplot antes de correr el test.

ggplot(data = dinosaurio, aes(x = Dinosaurio, y = Largo, fill = Dinosaurio)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0.40, 1.00)) +
  scale_fill_manual(values = c("lightblue", "purple")) +
  labs(x = "Especie", y = "Largo de cráneo (m)", title = "Largo cráneo T. rex y T. bataar") +
  theme_classic()

# 3.2. Correr el test t.

t.test(Largo ~ Dinosaurio, data = dinosaurio)

# 3.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Podemos rechazar la hipótesis nula? ¿Son dinosaurios del mismo tamaño o no? ¿Por qué?


# 4. Ejercicio 2: Isótopos de nitrógeno en Quillagua. ---------------------
# Realice un test t para comparar las medias de isótopos de nitrógeno en los sectores Alto y Bajo del Cementerio Oriente de Quillagua. Se asume que las dos muestras fueron tomadas de poblaciones que tienen las mismas medias para isótopos de nitrógeno, por lo tanto no existen diferencias estadísticamente significativas entre ellas.

# 4.1. Importar y explorar los datos.

quillagua <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase7/Nitrogeno_Quillagua.xlsx")
quillagua

ggplot(data = quillagua, aes(x = Sector, y = d15N, fill = Sector)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 30)) +
  scale_fill_manual(values = c("gold", "orange")) +
  labs(x = "Sector", y = "δ¹⁵N", title = "Isótopos de nitrógeno sectores Alto y Bajo Quillagua") +
  theme_classic()

# 4.2. Correr el test t.

t.test(d15N ~ Sector, data = quillagua)

# 4.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Podemos rechazar la hipótesis nula? ¿Qué ocurre con las dietas en Quillagua?


# 5. Ejercicio 3: Largo de fémur en Quillagua. ----------------------------
# Realice un test t para comparar las medias de largo de fémur (mm) de los sectores Alto y Bajo del Cementerio Oriente de Quillagua. Se asume que las dos muestras fueron tomadas de poblaciones que tienen las mismas medias para largo de fémur, por lo tanto no existen diferencias estadísticamente significativas entre ellas.

# 5.1. Importar y explorar los datos.

femur <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase7/Largo_femur_adultos.xlsx")
femur

ggplot(data = femur, aes(x = Sector, y = Largo, fill = Sector)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 500)) +
  scale_fill_manual(values = c("lightgreen", "green4")) +
  labs(x = "Sector", y = "Largo de fémur (mm)", title = "Largo fémur adultos sectores Alto y Bajo Quillagua") +
  theme_classic()

# 5.2. Correr el test t.

t.test(Largo ~ Sector, data = femur)

# 5.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Podemos rechazar la hipótesis nula? ¿Hay diferencias de estatura entre los cementerios? ¿A qué podría deberse esto?


# 6. Trabajo en Clases 7. -------------------------------------------------

area_sitio <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase7/Area_de_sitio.xlsx")
area_sitio

camelidos <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase2/Tabla camelida.xlsx")
camelidos

# 1. Realice un test t para comparar las áreas de sitios de dos ocupaciones arqueológicas, una de la Edad del Bronce Temprana (EBTE) y otra de la Edad del Bronce Tardía (EBTA). Recuerde explorar los datos primero mediante un boxplot. Se asume que las dos muestras fueron tomadas de poblaciones que poseen las mismas medias para área de sitio (ha), por lo tanto no deberían existir diferencias estadísticamente significativas entre ellas. Ponga a prueba esta hipótesis nula y entregue una interpretación arqueológica de sus resultados.

# 2. Utilice los datos de Tabla_camelida.xlsx y compare la variable Largo (mm) entre Llama y Guanaco. ¿Podríamos plantear que las muestras de largo de falange para llama y guanaco provienen de poblaciones con las mismas medias? ¿Cuál sería su hipótesis nula? Corrobórela mediante una prueba t de Student. Recuerde explorar los datos primero mediante un boxplot y entregue una interpretación arqueológica de sus resultados.

# 3. Continúe utilizando los datos de Tabla_camelida.xlsx, pero esta vez analice los datos de Ancho de falange comparando Llama y Guanaco. ¿Estas muestras provendrían de poblaciones con las mismas medias para ancho de falange? Plantee una hipótesis nula y evalúela mediante una prueba t de Student. Recuerde explorar los datos primero mediante un boxplot y entregue una interpretación arqueológica de sus resultados.