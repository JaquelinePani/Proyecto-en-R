#-----------------------------------------------------
#Proyecto en R_Actividad transversal  Jaqueline Pani Delgado
#-----------------------------------------------------

#Carga de librerías a utilizar
library(readr)   # Para leer archivos CSV
library(dplyr)   # Para manipulación de datos
library(ggplot2) # Para visualización de datos

#Carga de datos
print("Cargando el dataset desde un archivo CSV...")
datos <- read.csv("salarios_mujeres.csv")

#Exploración del dataset
print("Visualizar las primeras 6 filas: ")
head(datos)
print("Tipos de datos de cada columna: ")
str(datos)
print("Dimensiones del dataset (filas x columnas):")
dim(datos)

#Identificación de problemas en los datos
print("Numero de valores NA por columna: ")
colSums(is.na(datos))
duplicado <- table(duplicated(datos))
print("Numero de valores duplicados por filas: ")
duplicado

#Calculo de Medidas de Tendencia Central
print("Resumen estadístico de la variable numérica:")
summary(datos)

media <- mean(datos$Salario, na.rm = TRUE)
print(paste("La media de los salarios de mujeres es: ", media))
mediana <- median(datos$Salario, na.rm = TRUE)
print(paste("La mediana de los salarios de mujeres es: ", mediana))

#Filtrado
datos_limpios <- na.omit(datos)
datos_sin_duplicados <- datos_limpios[!duplicated(datos_limpios), ]
print("Datos sin valores duplicados: ")
datos_sin_duplicados

#Visualización: Histograma----
ggplot(datos_limpios, aes(x = Salario)) +
  geom_histogram(binwidth = 2000, fill = "purple", color = "black", alpha = 0.7) +
  labs(title = "Frecuencia del Salario de mujeres",
       x = "Salario",
       y = "Frecuencia") +
  theme_minimal()
print("Gráfico generado con éxito.")
#Link de GitHub donde se puede encontrar este proyecto:
#https://github.com/JaquelinePani
