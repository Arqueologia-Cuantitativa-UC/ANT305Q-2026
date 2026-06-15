# Clase 12. Correlaciones.

# 1. Cargar paquetes. -----------------------------------------------------

library(tidyverse)
library(readxl)
library(ggpubr)


# 2. Las correlaciones. ----------------------------------------------------
# Una correlación permite evaluar la relación entre dos variables, pero a diferencia de la regresión lineal, aquí NO existe una relación de causalidad o dependencia. No hay variable dependiente ni independiente: ambas variables se consideran dependientes la una de la otra si es que existe correlación.
# Las correlaciones miden cuánto dos variables co-varían, es decir, cuánto cambia una variable cuando cambia la otra.
# Existen dos tipos principales de correlación:
#   - Correlación de Pearson (r): para variables continuas con distribución normal.
#   - Correlación de Spearman (rs): para variables categóricas ordinales (rangos).
# Ambos coeficientes varían entre -1 y 1:
#   - Valores cercanos a 1 indican una correlación positiva fuerte (ambas variables aumentan juntas).
#   - Valores cercanos a -1 indican una correlación negativa fuerte (cuando una aumenta, la otra disminuye).
#   - Valores cercanos a 0 indican que no existe correlación lineal.
# En R, ambas correlaciones se calculan con la función cor.test(), indicando el método correspondiente ("pearson" o "spearman").
# cor.test(data$variable1, data$variable2, method = "pearson")


# 3. Correlación de Pearson. ------------------------------------------------

# 3.1. Ejercicio 1: Estatura y largo de húmero. -----------------------------
# ¿Existe una correlación entre la estatura (cm) y el largo de húmero (cm) en una muestra de individuos adultos? Ambas son variables continuas, por lo que utilizaremos la correlación de Pearson.

# 3.1.1. Importar y explorar los datos.

data <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase12/Estatura_humero.xlsx")
data

# Exploramos los datos con un gráfico de dispersión antes de correr el test.

ggplot(data = data, aes(x = Estatura, y = Largo)) +
  geom_point(shape = 22, color = "blue", fill = "blue", size = 3) +
  theme_bw() +
  scale_y_continuous(limits = c(30, 36), breaks = seq(30, 36, 1)) +
  scale_x_continuous(limits = c(150, 190), breaks = seq(150, 190, 10)) +
  xlab(expression("Estatura (cm)")) +
  ylab(expression("Largo de húmero (cm)"))

# 3.1.2. Correr el test de correlación de Pearson.

cor.test(data$Estatura, data$Largo, method = "pearson")

# 3.1.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Existe una correlación significativa entre estatura y largo de húmero? ¿Cómo se interpreta el valor de r obtenido?


# 3.2. Ejercicio 2: Masa corporal y largo de aleta en pingüinos Gentoo. -----
# ¿Existe una correlación entre la masa corporal (gr) y el largo de aleta (mm) en pingüinos de la especie Gentoo?

# 3.2.1. Cargar e importar los datos.

install.packages("palmerpenguins")
library(palmerpenguins)

penguins

# Revisamos las especies disponibles.

penguins %>%
  count(species)

# Filtramos solo la especie Gentoo.

penguins1 <- penguins %>% filter(species == "Gentoo")

# 3.2.2. Explorar los datos con un gráfico de dispersión.

ggplot(data = penguins1, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point(shape = 23, size = 3, color = "red", fill = "red") +
  theme_bw() +
  scale_y_continuous(limits = c(200, 230), breaks = seq(200, 230, 10)) +
  scale_x_continuous(limits = c(4000, 6600), breaks = seq(4000, 6600, 400)) +
  xlab(expression("Masa corporal (gr)")) +
  ylab(expression("Largo de aleta (mm)"))

# 3.2.3. Correr el test de correlación de Pearson.

cor.test(penguins1$body_mass_g, penguins1$flipper_length_mm, method = "pearson")

# 3.2.4. Interpretación.
# ¿Qué resultados entrega el test? ¿Existe una correlación significativa entre masa corporal y largo de aleta en pingüinos Gentoo? ¿Cómo se interpreta el valor de r obtenido?


# 4. Correlación de Spearman. ------------------------------------------------

# 4.1. Ejercicio 3: Productividad de suelo y número de aldeas por km². -----
# ¿Existe una correlación entre la productividad de suelo (escala ordinal de 1 a 8) y el número de aldeas por km²? Dado que la productividad de suelo es una variable categórica ordinal, debemos utilizar la correlación de Spearman.

# 4.1.1. Importar y explorar los datos.

data2 <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase12/Suelo_y_aldeas.xlsx")
data2

# Exploramos los datos con un gráfico de dispersión.

ggplot(data = data2, aes(x = Productividad, y = Aldeas)) +
  geom_point(shape = 21, color = "violet", fill = "violet", size = 3) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 2.4), breaks = seq(0, 2.4, 0.2)) +
  scale_x_continuous(limits = c(1, 10), breaks = seq(1, 10, 1)) +
  xlab(expression("Productividad de suelo")) +
  ylab(expression("Nº de aldeas por km²"))

# 4.1.2. Correr el test de correlación de Spearman.

cor.test(data2$Productividad, data2$Aldeas, method = "spearman")

# 4.1.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Existe una correlación significativa entre productividad de suelo y número de aldeas por km²? ¿Cómo se interpreta el valor de rs obtenido?


# 4.2. Ejercicio 4: Status social y número de infantes por familia. --------
# ¿Existe una correlación entre el status social (jerarquía, escala ordinal de 1 a 11) y el número de infantes por familia en un contexto funerario arqueológico? Dado que el status social es una variable categórica ordinal, utilizaremos la correlación de Spearman.

# 4.2.1. Importar y explorar los datos.

data3 <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase12/Status_e_infantes.xlsx")
data3

# Exploramos los datos con un gráfico de dispersión.

ggplot(data = data3, aes(x = Status, y = Infantes)) +
  geom_point(shape = 24, color = "green3", fill = "green3", size = 3) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 15), breaks = seq(0, 15, 1)) +
  scale_x_continuous(limits = c(1, 11), breaks = seq(1, 11, 1)) +
  xlab(expression("Status-Jerarquía")) +
  ylab(expression("Nº de infantes"))

# 4.2.2. Correr el test de correlación de Spearman.

cor.test(data3$Status, data3$Infantes, method = "spearman")

# 4.2.3. Interpretación.
# ¿Qué resultados entrega el test? ¿Existe una correlación significativa entre status social y número de infantes? ¿Cómo se interpreta el valor de rs obtenido? ¿Qué implicancias arqueológicas podría tener este resultado?


# 5. Trabajo en Clases

#Para esta actividad utilizaremos las bases de datos `Puntas_diametro_peso.xlsx`, `Jerarquia_camelidos.xlsx` y `Pesca_distancia_costa.xlsx`. Puedes encontrarlas en el repositorio del curso.

#1. En una colección de 12 puntas de proyectil líticas recuperadas en distintos sitios arqueológicos, se midió el diámetro del astil (mm) y el peso de cada punta (gr). Ambas son variables continuas, por lo que se debe utilizar la correlación de Pearson. Importe los datos desde `Puntas_diametro_peso.xlsx` y evalúe si existe una correlación significativa entre el `Diametro` y el `Peso` de las puntas. Explore los datos primero mediante un gráfico de dispersión, ejecute el test de correlación correspondiente con `cor.test()` y entregue una interpretación arqueológica de los resultados, reportando el valor de r y el p-valor.

#2. En 15 entierros de distintos cementerios arqueológicos, se registró la jerarquía social del individuo según la riqueza de su ajuar funerario (escala ordinal de 1 a 5, donde 1 corresponde a la menor riqueza y 5 a la mayor) y el número de camélidos sacrificados asociados al entierro. Dado que la jerarquía corresponde a una variable categórica ordinal, se debe utilizar la correlación de Spearman. Importe los datos desde `Jerarquia_camelidos.xlsx` y evalúe si existe una correlación significativa entre la `Jerarquia` y el número de `Camelidos` sacrificados. Explore los datos primero mediante un gráfico de dispersión, ejecute el test de correlación correspondiente con `cor.test()` y entregue una interpretación arqueológica de los resultados, reportando el valor de rs y el p-valor.

#3. En 14 sitios arqueológicos costeros se registró el número de instrumentos de pesca recuperados y la distancia actual del sitio a la línea de costa (m). Se hipotetiza que los sitios más cercanos al mar deberían presentar un mayor número de instrumentos de pesca, dado el acceso más directo a recursos marinos. Ambas variables son continuas, por lo que se debe utilizar la correlación de Pearson. Importe los datos desde `Pesca_distancia_costa.xlsx` y evalúe si existe una correlación significativa entre el número de `Instrumentos` de pesca y la `Distancia` a la costa. Explore los datos primero mediante un gráfico de dispersión, ejecute el test de correlación correspondiente con `cor.test()` y evalúe los resultados: ¿es la correlación significativa? ¿Se cumple la hipótesis planteada? Entregue una interpretación arqueológica de los resultados, reportando el valor de r y el p-valor, y discuta a qué podría deberse este resultado.