# Clase 3. Visualización de datos.

# 1. Cargar paquetes. -----------------------------------------------------
# Recordemos que los paquetes solo se instalan una vez, pero deben cargarse cada vez que abrimos una nueva sesión de RStudio.

# Instalar paquetes nuevos (solo la primera vez)
install.packages("wesanderson")
install.packages("ggbeeswarm")
install.packages("ggdist")
install.packages("gghalves")

# Cargar paquetes cada vez que abrimos una sesión nueva
library(tidyverse)
library(readxl)
library(wesanderson) # Paletas de colores inspiradas en Wes Anderson
library(ggbeeswarm)  # Para graficar puntos individuales
library(ggdist)      # Para gráficos de distribución tipo "halfeye"


# 2. Importar datos. ------------------------------------------------------
# Trabajaremos con la base de datos Tabla_camelida.xlsx. Puedes encontrarla en el repositorio del curso o descargarla directamente desde el link disponible en el RMarkdown de esta clase.

camelidos <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ANT305Q-2026/Clases/Clase2/Tabla camelida.xlsx")
camelidos


# 3. Personalización de histogramas. --------------------------------------

# 3.1. Colorear por grupo con fill y color.
# Podemos indicarle a ggplot2 que asigne colores automáticamente según una variable categórica (como Taxon). Para esto, incluimos fill = Taxon dentro de aes(). Luego, si queremos elegir nuestros propios colores, agregamos scale_fill_manual().

ggplot(data = camelidos, aes(x = Ancho, fill = Taxon)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_fill_manual(values = c("red", "blue"))

# 3.2. Controlar los valores de los ejes con scale_x_continuous() y scale_y_continuous().
# Podemos definir exactamente qué números aparecen en los ejes usando la función seq(inicio, fin, cada cuántos números). Por ejemplo, seq(0, 10, 2) generará la secuencia 0, 2, 4, 6, 8, 10.

ggplot(data = camelidos, aes(x = Ancho, fill = Taxon, color = Taxon)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_fill_manual(values = c("red", "blue")) +
  scale_y_continuous(breaks = seq(0, 10, 2)) +
  scale_x_continuous(breaks = seq(14, 36, 2))

# 3.3. Editar etiquetas de ejes y agregar título con labs().
# La función labs() nos permite cambiar los nombres que aparecen en los ejes y agregar un título al gráfico. Es buena práctica incluir las unidades de medida en las etiquetas de los ejes.

ggplot(data = camelidos, aes(x = Ancho, fill = Taxon, color = Taxon)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_fill_manual(values = c("red", "blue")) +
  scale_y_continuous(breaks = seq(0, 10, 2)) +
  scale_x_continuous(breaks = seq(14, 36, 2)) +
  labs(x = "Ancho (cm)", y = "Frecuencia", title = "Ancho falange camélidos")

# 3.4. Cambiar el fondo del gráfico con theme_*().
# ggplot2 incluye varios temas predefinidos que cambian la apariencia general del gráfico, especialmente el color del fondo. Algunos ejemplos son: theme_bw(), theme_classic(), theme_dark(), theme_gray(), theme_light(), theme_void().

ggplot(data = camelidos, aes(x = Ancho, fill = Taxon, color = Taxon)) +
  geom_histogram(binwidth = 1) +
  scale_fill_manual(values = c("red", "blue")) +
  scale_color_manual(values = c("black", "black")) +
  scale_y_continuous(breaks = seq(0, 10, 2)) +
  scale_x_continuous(breaks = seq(14, 36, 2)) +
  labs(x = "Ancho (cm)", y = "Frecuencia", title = "Ancho falange camélidos") +
  theme_classic()


# 4. Boxplots (Gráficos de cajas y bigotes). ------------------------------
# Los boxplots son una forma muy útil de visualizar la distribución de una variable numérica para distintos grupos. Muestran la mediana, los cuartiles y los valores atípicos. Para crearlos usamos la función geom_boxplot(). A diferencia del histograma, debemos especificar tanto el eje x (variable categórica, como Taxon) como el eje y (variable numérica, como Ancho o Largo) dentro de aes().

# 4.1. Boxplot básico.

ggplot(data = camelidos, aes(x = Taxon, y = Ancho)) +
  geom_boxplot()

# 4.2. Rotar el boxplot con coord_flip().
# Si preferimos verlo en forma horizontal, podemos agregar la función coord_flip().

ggplot(data = camelidos, aes(x = Taxon, y = Ancho)) +
  geom_boxplot() +
  coord_flip()

# O bien intercambiando los ejes directamente en aes()

ggplot(data = camelidos, aes(x = Ancho, y = Taxon)) +
  geom_boxplot()

# 4.3. Personalizar colores con scale_fill_manual().
# Al igual que en el histograma, podemos asignar colores por grupo. Para esto incluimos fill = Taxon en aes() y luego definimos los colores con scale_fill_manual().

ggplot(data = camelidos, aes(x = Taxon, y = Ancho, fill = Taxon)) +
  geom_boxplot() +
  scale_fill_manual(values = c("purple", "green"))

# 4.4. Usar paletas predefinidas con scale_fill_brewer().
# En lugar de elegir los colores manualmente, podemos usar paletas de colores prediseñadas disponibles en ggplot2 a través de scale_fill_brewer(). Puedes explorar las opciones disponibles en colorbrewer2.org.

ggplot(data = camelidos, aes(x = Taxon, y = Ancho, fill = Taxon)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "GnBu")

# 4.5. Boxplot completamente personalizado.
# Combinamos todo lo aprendido: colores, escala del eje, etiquetas y tema de fondo.

ggplot(data = camelidos, aes(x = Taxon, y = Ancho, fill = Taxon)) +
  geom_boxplot() +
  scale_fill_manual(values = c("purple", "green")) +
  scale_y_continuous(breaks = seq(14, 36, 4)) +
  labs(x = "Taxón", y = "Ancho (cm)", title = "Ancho falange camélidos") +
  theme_classic()

# 4.6. Boxplot para la variable Largo.
# Primero revisamos el rango de valores con summary() para saber qué secuencia usar en el eje y.

summary(camelidos$Largo)

ggplot(data = camelidos, aes(x = Taxon, y = Largo, fill = Taxon)) +
  geom_boxplot() +
  scale_fill_manual(values = c("purple", "green")) +
  scale_y_continuous(breaks = seq(38, 82, 4)) +
  labs(x = "Taxón", y = "Largo (mm)", title = "Largo falange camélidos") +
  theme_gray()


# 5. Paletas de colores: paquete wesanderson. -----------------------------
# El paquete wesanderson ofrece paletas de colores inspiradas en las películas del director Wes Anderson. Podemos ver todas las paletas disponibles con la función names().

names(wesanderson::wes_palettes)

# Para usar una paleta de este paquete dentro de ggplot2, reemplazamos los colores en scale_fill_manual() por la función wes_palette(), indicando el número de colores que necesitamos (n=2) y el nombre de la paleta.

ggplot(data = camelidos, aes(x = Taxon, y = Largo, fill = Taxon)) +
  geom_boxplot() +
  scale_y_continuous(breaks = seq(38, 90, 4)) +
  labs(x = "Taxón", y = "Largo (mm)", title = "Largo falange camélidos") +
  theme_gray() +
  scale_fill_manual(values = wes_palette(n = 2, "GrandBudapest1"))

# Recursos útiles:
# R Color Palettes: https://github.com/EmilHvitfeldt/r-color-palettes
# Colores en ggplot2: http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# Tabla de colores de R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# Datanovia: https://www.datanovia.com/en/blog/ggplot-colors-best-tricks-you-will-love/


# 6. Raincloud Plots. -----------------------------------------------------
# Los raincloud plots son una forma más completa de visualizar distribuciones de datos. Combinan tres elementos en un solo gráfico:
# 1. stat_halfeye: muestra la distribución de probabilidad estimada ("nube").
# 2. geom_boxplot: muestra la mediana y los cuartiles.
# 3. geom_beeswarm: muestra cada observación de forma individual ("lluvia").
# Esta combinación evita ocultar información importante que los boxplots tradicionales pueden omitir.

ggplot(data = camelidos, aes(x = Taxon, y = Largo, fill = Taxon)) +
  # Capa 1: distribución tipo "nube"
  ggdist::stat_halfeye(
    adjust = 0.5, width = 0.3, .width = 0,
    justification = -0.3, point_colour = NA, alpha = 0.7
  ) +
  # Capa 2: boxplot compacto
  geom_boxplot(width = 0.1) +
  # Capa 3: puntos individuales ("lluvia")
  geom_beeswarm(width = 0.05, alpha = 0.5, color = "blue", cex = 1.5) +
  scale_fill_brewer(palette = "Dark2") +
  scale_y_continuous(limits = c(38, 82), breaks = seq(38, 82, 2)) +
  labs(x = "Taxón", y = "Largo (mm)", title = "Largo falange camélidos") +
  theme_classic() +
  theme(legend.position = "none")

# Recursos adicionales:
# Cookbook for R: http://www.cookbook-r.com/Graphs/
# ggplot2 boxplots (STHDA): http://www.sthda.com/english/wiki/ggplot2-box-plot-quick-start-guide-r-software-and-data-visualization
# Tutorial ggplot2 (Cédric Scherer): https://www.cedricscherer.com/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/
# Top 50 visualizaciones en ggplot2: http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
# R Gallery: https://r-graph-gallery.com
