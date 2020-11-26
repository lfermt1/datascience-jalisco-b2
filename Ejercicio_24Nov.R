#  1) ¿Cuál es la sucursal que recibe mas conexiones?
#    Agrupar: branch_office
#    Colapsar: suma de conexiones por sucursal
#  2) ¿Qué día de las semana tenemos mas visitantes?
#    Filtrar: visitor = true
#   Agrupar: day_of_week
#    Colapsar: Suma de visitantes por día
#  3) ¿Cuál es el tiempo promedio de conexión de un visitante?
#    Filtrar: visitor = true
#    Colapsar: Promedio de tiempo de conexión
#  4) ¿Cuantas persona por mes han realizado visitas?
#    filtrar: visitors = true
#    agrupar: por mes
#    colapsar: conteo
#  5) ¿A qué hora se registran más visitantes?
#     Filtrar: Obtener los registros por hora (hour_tz)
#    Agrupar: Visitantes y no visitantes (visitor)
#    Colapsar: Contar cuantos registros hay en cada grupo (count)
#    Se compara cuantos registros de  visitantes hay en cada hora.





library(tidyverse)

datos <- read.csv('datascience-jalisco-b2/e.csv')

p1 <- datos %>%
  group_by(branch_office) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

p2 <- datos %>%
  filter(visitor == 'true') %>%
  group_by(day_of_week_tz) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

p3 <- datos %>%
  filter(visitor == 'true') %>%
  group_by(branch_office) %>%
  summarise(t_promedio = mean(tiempodeses))

p4 <- datos %>%
  filter(visitor == 'true') %>%
  group_by(month_tz) %>%
  count(visitor)

p5 <- datos %>% 
  group_by(visitor, hour_tz) %>%
  summarise(count = n()) %>%
  arrange(visitor, desc(count))
