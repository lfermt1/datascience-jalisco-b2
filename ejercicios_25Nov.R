install.packages('datos')

#1Filtra los vuelos para mostrar únicamente los aviones que han realizado al menos cien viajes.
#2Combina datos::vehiculos y datos::comunes para encontrar los registros de los modelos más comunes.
#3Encuentra las 48 horas (en el transcurso del año) que tengan los peores atrasos. Haz una referencia cruzada con la tabla clima. ¿Puedes observar patrones?
#4 ¿Qué te indica anti_join(vuelos, aeropuertos, by = c("destino" = "codigo_aeropuerto"))? ¿Qué te indica anti_join(aeropuertos, vuelos, by = c("codigo_aeropuerto" = "destino"))?
  

library(datos)
#pregunta 1
grupo <- group_by(vuelos, vuelo)
conteo <- count(grupo, vuelo)
filtrar <- filter(conteo, (n < 100))

#pregunta 2
str(vehiculos)
comunes
comunes <- inner_join(vehiculos,comunes, by = 'fabricante')
comunes <- vehiculos %>% inner_join(comunes)

#pregunta 3
atraso <- summarise(group_by(vuelos,vuelo),sum(atraso_salida))
cruzada <- full_join(vuelos,clima)

#pregunta 4
vuelos
aeropuertos

anti1 <- anti_join(vuelos, aeropuertos, by = c("destino


  
