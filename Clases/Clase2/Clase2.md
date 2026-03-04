---
title: "Estadística Descriptiva. Medidas de Tendencia Central y dispersión."
output: 
  html_document: 
    keep_md: true
    toc: true
    toc_float: true
    toc_depth: 4
    theme: united
---

#### **1. Instalar paquetes.**
R viene con funciones básicas instaladas ("base R"), pero la verdadera potencia reside en los paquetes externos. Para usarlos, seguimos dos pasos: **instalarlos** (una sola vez en tu computadora, mediante la función **install.packages("nombre_del_paquete")**) y **cargarlos** (cada vez que abras un nuevo script, mediante la función **library("nombre_del_paquete")**).


``` r
#Instalar paquete por única vez. Estos son algunos que usaremos esta y la siguientes clases
install.packages("tidyverse") #El nombre del paquete debe estar entre comillas
install.packages("readxl")
install.packages("dplyr")
```


``` r
#Cargar paquete cada vez que abras una sesión nueva de RStudio. 
library(readxl) #En este caso el nombre del paquete funciona con y sin comillas
library(tidyverse)
```

```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.2.0     ✔ readr     2.2.0
## ✔ forcats   1.0.1     ✔ stringr   1.6.0
## ✔ ggplot2   4.0.2     ✔ tibble    3.3.1
## ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
## ✔ purrr     1.2.1     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
library(dplyr)
```

---

#### **2. Preparación de datos.**
Importamos nuestros datos mediante el botón **import** o bien mediante la función read_excel() del paquete **readxl**. En este caso trabajaremos con la base de datos `Tabla_camelida.xlsx`. 


``` r
camelidos <- read_excel("~/Desktop/work/0_Cuantitativa_2026/ArqCuantitativa2026/datos/Tabla camelida.xlsx")
camelidos
```

```
## # A tibble: 33 × 3
##    Taxon Largo Ancho
##    <chr> <dbl> <dbl>
##  1 LLAMA  80.3  35.4
##  2 LLAMA  71.6  21.2
##  3 LLAMA  70.9  22.0
##  4 LLAMA  70.6  22.3
##  5 LLAMA  69.1  22.7
##  6 LLAMA  68.7  20.8
##  7 LLAMA  67.8  20  
##  8 LLAMA  66.6  21  
##  9 LLAMA  65.9  20.3
## 10 LLAMA  65.8  21.2
## # ℹ 23 more rows
```

---

#### **3. Filtrado de datos.**
A menudo necesitamos aislar datos específicos. Para esto, usaremos la función **filter()** junto al operador pipe **(%>%)** disponibles en el paquete **tidyverse**, que funciona como un "entonces": "toma los datos, y luego fíltralos".
En este caso haremos el ejercicio de filtrar solo los datos provenientes del Taxón llamas. Tanto las variables como los datos a seleccionar deben ser escritos **tal cual como están en la base de datos original**.


``` r
# Creamos un nuevo dataframe solo con los datos de LLAMA
llama <- camelidos %>% filter(Taxon == "LLAMA")

# Verificamos el resultado
llama
```

```
## # A tibble: 20 × 3
##    Taxon Largo Ancho
##    <chr> <dbl> <dbl>
##  1 LLAMA  80.3  35.4
##  2 LLAMA  71.6  21.2
##  3 LLAMA  70.9  22.0
##  4 LLAMA  70.6  22.3
##  5 LLAMA  69.1  22.7
##  6 LLAMA  68.7  20.8
##  7 LLAMA  67.8  20  
##  8 LLAMA  66.6  21  
##  9 LLAMA  65.9  20.3
## 10 LLAMA  65.8  21.2
## 11 LLAMA  65.1  21.6
## 12 LLAMA  64.6  19.3
## 13 LLAMA  64.2  20.0
## 14 LLAMA  61.5  18.7
## 15 LLAMA  61.1  20.3
## 16 LLAMA  60.8  18.8
## 17 LLAMA  60.6  19.9
## 18 LLAMA  60.5  18.9
## 19 LLAMA  56.9  18.8
## 20 LLAMA  40.2  15.2
```




<div style="text-align: center; margin-top: 50px; margin-bottom: 30px;">
  
  <a href=""../Clase1/Clase1.html"" class="btn btn-default">← Clase Anterior</a>
  <a href="../../index.html" class="btn btn-default" style="margin: 0 10px;">Índice</a>
  <a href="../Clase3/Clase3.html" class="btn btn-default">Siguiente Clase →</a>

</div>
