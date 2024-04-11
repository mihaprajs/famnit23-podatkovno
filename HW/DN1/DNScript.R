library(tidyverse)
automobile<-mtcars
automobile <- automobile %>% rownames_to_column(var = "cars.name")
automobile$l_100km <- 235.2146/automobile$mpg
automobile<-automobile %>% select(-mpg) 
automobile$am <- factor(automobile$am,
                        levels = c(0, 1),
                        labels = c("Automatic", "Manual"))

# 4. What is the average number of gears?
average_gears <- mean(automobile$gear)
average_gears

# 5. Return the rows with cars with horsepower between 200 and 400.
horsepower_filtered <- automobile %>% .[.$hp >= 200 & .$hp <= 400,]
horsepower_filtered

most_fuel_efficient<-automobile %>% .[.$l_100km == min(.$l_100km) & .$cyl == 6,]
