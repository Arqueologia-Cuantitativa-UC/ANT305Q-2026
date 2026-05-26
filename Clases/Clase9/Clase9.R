# Clase 9. Tests no paramétricos.

# 1. Cargar paquetes. -----------------------------------------------------

# Instalar paquetes nuevos (solo la primera vez)
install.packages("dunn.test")
install.packages("palmerpenguins")

# Cargar paquetes cada vez que abrimos una sesión nueva
library(tidyverse)
library(readxl)
library(dunn.test)
library(palmerpenguins)


# 2. Tests paramétricos y no paramétricos. --------------------------------
# Hasta ahora hemos utilizado pruebas paramétricas (test t, ANOVA), que asumen que los datos siguen una distribución normal. Sin embargo, frecuentemente trabajamos con muestras pequeñas o datos que no cumplen este supuesto. En esos casos debemos recurrir a pruebas no paramétricas, que no asumen ninguna distribución particular.
# Para decidir qué test usar, primero evaluamos la normalidad con el test de Shapiro-Wilk (shapiro.test()). La lógica es:
#   Si p > 0.05 → los datos distribuyen normal → usamos test paramétrico (t test o ANOVA).
#   Si p < 0.05 → los datos NO distribuyen normal → usamos test no paramétrico.
# Los equivalentes no paramétricos son:
#   2 grupos → Mann-Whitney (wilcox.test)
#   3+ grupos → Kruskal-Wallis (kruskal.test) + post hoc Dunn (dunn.test)


# 3. Ejercicio 1: Dieta de camélidos en Tarapacá 40 y Caleta Vítor. -------
# Evaluamos si existen diferencias en los isótopos de nitrógeno (d15N) entre camélidos del sitio interior Tarapacá 40 (Tr40) y el sitio costero Caleta Vítor (CV).

# 3.1. Importar y explorar los datos.

camelidos_sitios <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase9/Comparacion_Tr40_CV.xlsx")
camelidos_sitios

ggplot(data = camelidos_sitios, aes(x = Sitio, y = d15N, fill = Sitio)) +
  geom_boxplot() +
  labs(x = "Sitio", y = "δ¹⁵N", title = "δ¹⁵N en camélidos de Tr40 y Caleta Vítor") +
  theme_classic()

# 3.2. Test de normalidad Shapiro-Wilk.
# El valor p es mayor a 0.05, por lo que los datos distribuyen normal. Procedemos con un test t.

shapiro.test(camelidos_sitios$d15N)

# 3.3. Test t.

t.test(d15N ~ Sitio, data = camelidos_sitios)

# 3.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Existen diferencias significativas en la dieta de los camélidos entre ambos sitios? ¿A qué podría deberse esto?


# 4. Ejercicio 2: Largo de maíces en Tarapacá. ----------------------------
# Evaluamos si existen diferencias en el largo de los maíces entre los sitios TR40 y TR49.

# 4.1. Importar y explorar los datos.

maices <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase9/Largo_maices.xlsx")
maices

ggplot(data = maices, aes(x = Sitio, y = Largo, fill = Sitio)) +
  geom_boxplot() +
  labs(x = "Sitio", y = "Largo (mm)", title = "Largo de maíces en TR40 y TR49") +
  theme_classic()

# 4.2. Test de normalidad Shapiro-Wilk.
# El valor p es menor a 0.05, por lo que los datos NO distribuyen normal. Usamos el test de Mann-Whitney.

shapiro.test(maices$Largo)

# 4.3. Test de Mann-Whitney.

wilcox.test(Largo ~ Sitio, data = maices)

# 4.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Existen diferencias significativas en el largo de los maíces entre ambos sitios? ¿A qué podría deberse esto?


# 5. Ejercicio 3: Dieta humana en la costa en tres períodos. --------------
# Evaluamos si existen diferencias en los isótopos de nitrógeno (d15N) en humanos costeros a lo largo de tres períodos: Formativo, Intermedio Tardío y Tardío.

# 5.1. Importar y explorar los datos.

dieta_costa <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase9/Dieta_humanos_costa.xlsx")
dieta_costa

ggplot(data = dieta_costa, aes(x = Periodo, y = d15N, fill = Periodo)) +
  geom_boxplot() +
  labs(x = "Período", y = "δ¹⁵N", title = "δ¹⁵N en humanos costeros por período") +
  theme_classic()

# 5.2. Test de normalidad Shapiro-Wilk.
# Los datos distribuyen normal (al límite). Tenemos tres grupos, por lo que procedemos con ANOVA.

shapiro.test(dieta_costa$d15N)

# 5.3. ANOVA y test post hoc de Tukey.

anova_dieta <- aov(d15N ~ Periodo, data = dieta_costa)
summary(anova_dieta)

TukeyHSD(anova_dieta)

# 5.4. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Existen diferencias significativas entre los períodos? ¿Qué nos indica esto sobre las dietas costeras a lo largo del tiempo?


# 6. Ejercicio 4: Largo de aleta en Palmer Penguins. ----------------------
# Evaluamos si existen diferencias en el largo de aleta entre las tres especies de pingüinos.

# 6.1. Explorar los datos.

penguins

ggplot(data = penguins, aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_boxplot() +
  labs(x = "Especie", y = "Largo de aleta (mm)", title = "Largo de aleta por especie de pingüino") +
  theme_classic()

# 6.2. Test de normalidad Shapiro-Wilk.
# El valor p es menor a 0.05, por lo que los datos NO distribuyen normal. Tenemos tres grupos, por lo que usamos Kruskal-Wallis.

shapiro.test(penguins$flipper_length_mm)

# 6.3. Test de Kruskal-Wallis.

kruskal.test(flipper_length_mm ~ species, data = penguins)

# 6.4. Test post hoc de Dunn.
# Al igual que ANOVA necesita Tukey, Kruskal-Wallis necesita un post hoc para saber específicamente entre qué grupos existen diferencias. Usamos el test de Dunn.

dunn.test(penguins$flipper_length_mm, penguins$species)

# 6.5. Interpretación.
# ¿Podemos rechazar la hipótesis nula? ¿Entre qué especies existen diferencias significativas en el largo de aleta?


# 7. Trabajo en Clases 9. -------------------------------------------------
# Recuerde que siempre debe explorar sus datos con un boxplot antes de realizar cualquier análisis, y evaluar la normalidad con Shapiro-Wilk antes de elegir el test.

vertebras <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase9/Diametro_vertebra_pescado.xlsx")
vertebras

triangulo <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase9/Triangulo.xlsx")
triangulo

# 1. Analice la base de datos de diámetro de vértebras de pescado. ¿Cuántas variables hay? ¿Cuál sería su hipótesis nula? Evalúe la normalidad y elija el test correspondiente. ¿Qué puede inferir a partir de los resultados?

# 2. Analice la base de datos del área de triángulo mastoides. El cálculo de esta área en el cráneo humano ofrece una oportunidad para estimar el sexo en individuos prehispánicos. ¿Es posible ver una diferencia entre las áreas de triángulo mastoides entre estimaciones de sexo hombre y mujer? ¿Cuántas variables hay? ¿Cuál sería su hipótesis nula? Evalúe la normalidad y elija el test correspondiente. ¿Qué puede inferir a partir de los resultados?

# 3. Compare los datos de peso corporal (body_mass_g) de los Palmer Penguins. ¿Cuántas variables hay? ¿Cuál sería su hipótesis nula? Evalúe la normalidad y elija el test correspondiente. ¿Qué puede inferir a partir de los resultados?

# 4. Compare los datos de ancho de sépalo (Sepal.Width) de la base de datos iris. ¿Cuántas variables hay? ¿Cuál sería su hipótesis nula? Evalúe la normalidad y elija el test correspondiente. ¿Qué puede inferir a partir de los resultados?