### left_join ####
library(nycflights13)
library(dplyr)

flights
airlines

flights$carrier

flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)%>%
  left_join(airlines)

weather
flights2 %>% left_join(weather)

flights2 %>% left_join(planes, by = 'tailnum')#seleccionar por que columna queremos unir

flights
airports

df = left_join(flights, airports, by = c('origin' = 'faa'))

### tipos de joins ###

df1 <- tibble(x = c(1, 2), y = 2:1)
df2 <- tibble(x = c(3, 1), a = 10, b = "a")

### tipos de join ###

df1 %>% inner_join(df2)
df1 %>% left_join(df2)
df1 %>% right_join(df2)
df1 %>% full_join(df2)


df1 <- tibble(x = c(1, 1, 2), y = 1:3)
df2 <- tibble(x = c(1, 1, 2), z = c("a", "b", "a"))

df1 %>% left_join(df2)


### filtering join ###

library ("nycflights13")

flights %>%  
  anti_join(planes, by = "tailnum") %>%  #elementos que no coinciden
  count(tailnum, sort = TRUE)

# Recuerda que los paréntesis al inicio y al final permiten mostrar el resultado en consola sin llamar a la variable
(df1 <- tibble(x = c(1, 1, 3, 4), y = 1:4))
(df2 <- tibble(x = c(1, 1, 2), z = c("a", "b", "a")))

df1 %>% nrow()
df1 %>% inner_join(df2, by = "x") %>% nrow()
df1 %>% semi_join(df2, by = "x")#solo elementos que coinciden


# establecer operaciones
(df1 <- tibble(x = 1:2, y = c(1L, 1L)))
(df2 <- tibble(x = 1:2, y = 1:2))

intersect(df1, df2)

union(df1, df2)

setdiff(df1, df2)

setdiff(df2, df1)
