# Clase 8. ANOVA y test post hoc de Tukey.

# 1. Cargar paquetes. -----------------------------------------------------

library(tidyverse)
library(readxl)
library(datasets)


# 2. ANOVA (Análisis de Varianza). ----------------------------------------
# El ANOVA es una prueba estadística que permite comparar las medias de tres o más grupos al mismo tiempo, determinando si al menos uno de ellos difiere significativamente de los demás. A diferencia del test t, que solo compara dos grupos, el ANOVA es útil cuando tenemos múltiples categorías.
# Al igual que el test t, parte de una hipótesis nula (H0) que asume que todos los grupos provienen de poblaciones con la misma media. Si el valor p es menor a 0.05, rechazamos la hipótesis nula y concluimos que existen diferencias significativas entre al menos dos grupos.
# Sin embargo, el ANOVA no nos dice cuáles grupos difieren entre sí. Para eso necesitamos un test post hoc, como el test de Tukey (TukeyHSD), que compara todos los pares de grupos posibles e indica cuáles tienen diferencias estadísticamente significativas.

# Flujo de trabajo en R:
# 1. Correr el ANOVA y guardar el resultado en un objeto
# resultado_anova <- aov(variable_cuantitativa ~ variable_cualitativa, data = nombre_datos)
# 2. Ver el resumen del ANOVA
# summary(resultado_anova)
# 3. Correr el test post hoc de Tukey
# TukeyHSD(resultado_anova)


# 3. Ejercicio 1: Largo de pétalo en tres especies de Iris. ---------------
# Utilizaremos la base de datos iris, incluida en R, que contiene medidas de pétalos y sépalos para tres especies del género Iris. Compararemos el largo de pétalo entre las tres especies.

# 3.1. Explorar los datos.
# La base de datos iris viene incluida en R.

iris

# Exploramos los datos con un boxplot.

ggplot(data = iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_manual(values = c("violet", "lightblue", "pink")) +
  labs(x = "Especie", y = "Largo de pétalo (cm)", title = "Largo de pétalo por especie de Iris") +
  theme_classic()

# 3.2. Correr el ANOVA.

anova_iris <- aov(Petal.Length ~ Species, data = iris)
summary(anova_iris)

# 3.3. Test post hoc de Tukey.

TukeyHSD(anova_iris)

# 3.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Qué nos indica el test de Tukey sobre cuáles especies tienen diferencias significativas entre sí?


# 4. Ejercicio 2: Isótopos de nitrógeno en cultivos a través del tiempo. --
# Compararemos los valores de d15N en cultivos arqueológicos de cuatro períodos distintos: Formativo, Período Intermedio Tardío, Período Tardío y Período Colonial.

# 4.1. Importar y explorar los datos.

cultivos <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase8/Nitrogeno_cultivos.xls")
cultivos

# Antes de graficar, ordenamos los períodos cronológicamente usando la función factor(). Sin esto, R los ordenaría alfabéticamente.

cultivos$Periodo <- factor(cultivos$Periodo, levels = c("Formativo", "Periodo Intermedio Tardio", "Periodo Tardio", "Periodo Colonial"))

# Hacemos el boxplot.

ggplot(data = cultivos, aes(x = Periodo, y = d15N, fill = Periodo)) +
  geom_boxplot() +
  scale_fill_manual(values = c("lightgreen", "aquamarine3", "darkolivegreen3", "darkgreen")) +
  scale_y_continuous(limits = c(-5, 35), breaks = seq(-5, 35, 5)) +
  labs(x = "Período", y = "δ15N", title = "δ15N en cultivos a lo largo del tiempo") +
  theme_bw()

# 4.2. Correr el ANOVA.

anova_cultivos <- aov(d15N ~ Periodo, data = cultivos)
summary(anova_cultivos)

# 4.3. Test post hoc de Tukey.

TukeyHSD(anova_cultivos)

# 4.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Entre qué períodos existen diferencias significativas según el test de Tukey? ¿Qué podría indicar esto sobre los cambios en las prácticas agrícolas a lo largo del tiempo?

# 5. Trabajo en Clases 8. -------------------------------------------------
# Utilizaremos la base de datos palmerpenguins, que contiene medidas morfológicas de tres especies de pingüinos de las Islas Palmer en la Antártida.

# Instalar el paquete (solo la primera vez)
install.packages("palmerpenguins")

library(palmerpenguins)
penguins

# 1. Compare el largo de aleta (flipper_length_mm) entre las tres especies de pingüinos usando ANOVA. Recuerde explorar los datos primero con un boxplot, luego corra el ANOVA y el test de Tukey. ¿Podemos rechazar la hipótesis nula? ¿Entre qué especies existen diferencias significativas?

# 2. Compare el peso corporal (body_mass_g) entre las tres especies usando ANOVA. Recuerde explorar los datos primero con un boxplot, luego corra el ANOVA y el test de Tukey. ¿Podemos rechazar la hipótesis nula? ¿Entre qué especies existen diferencias significativas?