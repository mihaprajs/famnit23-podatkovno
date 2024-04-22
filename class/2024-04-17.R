library(tidyverse)
sales_data <- tibble(
  salesperson = c('Alice', 'Bob', 'Catherine', 'Alice', 'Bob', 'Catherine', 'Alice', 'Bob', 'Catherine'),
  region = c('East', 'East', 'East', 'West', 'West', 'West', 'North', 'North', 'North'),
  sales = c(300, 250, 450, 500, 400, 550, 600, 350, 500)
)

sales_data |> group_by(salesperson) |> summarise(prodaja=sum(sales)) |> ungroup()

sales_data |> summarise(prodaja=sum(sales),.by = "salesperson")

df_person_region<-sales_data |> summarise(prodaja=sum(sales),.by=c("salesperson","region"))

df_person_region |> summarise(prodaja=sum(prodaja),
                              .by=c("salesperson"))
df_person_region |> summarise(prodaja=sum(prodaja),
                              .by=c("region"))
library(arrow)

nyc<-read_parquet("podatki/data.parquet")

nyc_payment_type<-nyc |> summarise(stevilo=n(),
                                   .by=c("payment_type","RatecodeID")) |> arrange(desc(stevilo))
nyc_payment_type |> summarise(stevilo=sum(stevilo),
                              .by="RatecodeID")
nyc_payment_type<-nyc |>
  summarise(stevilo=n(),
            .by=c("payment_type","RatecodeID"))|>
  mutate(payment_type=as.character(payment_type),
         RatecodeID=as.character(RatecodeID)) |>
  arrange(desc(stevilo))

ggplot(nyc_payment_type) +
  aes(x = reorder(payment_type,-stevilo), y = stevilo) +
  geom_col(fill = "#646c7c") +
  labs(
    x = "tip plačila",
    y = "število prevozov",
    title = "Število prevozov",
    subtitle = "Prevozi po plačilu in okraju",
    caption = "¸"
  ) +
  theme_minimal()

nyc_payment_type

mtcars |>
  as_tibble()

mtcars[,c(10,1:9,11)] |>
  as_tibble()

mtcars |>
  relocate(gear,.after="mpg") |>
  relocate(am,.after="carb") |>
  as_tibble()

data <- tibble(
  time=1:5,
  measurment=c(NA,3,NA,NA,5)
)
data

data1 <- tibble(
  person=c("Anne",NA,NA,"John",NA),
  measurment=c(2,3,4,1,5)
)
data1

filled_data <- data1 |>
  fill(person,.direction="down")
filled_data

mtcars |>
  mutate(avto=rownames(mtcars)) |>
  pivot_longer(cols = mpg:carb,
               names_to = "lastnost avta",
               values_to = "vrednost lastnosti") |>
  as_tibble()

data.frame(leto_mesec=c(2022/11,
                        2022/12),
           prodaja=c(100,200))
airquality |>
  dplyr::select(Month, Day, Temp) |>
  dplyr::filter(Month %in% c(5,6,7) & Day<4) |>
  pivot_wider(names_from="Month",
              values_from="Temp")
airquality |>
  dplyr::select(Month, Day, Temp) |>
  dplyr::filter(Month %in% c(5,6,7) & Day<4) |>
  pivot_wider(names_prefix="Month",
              names_from=Month,
              values_from=Temp)
warpbreaks$breaks[1]<-NA
warpbreaks |>
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = ~ mean(.x,na.rm = T)
  )


# top_n(), sample_n(), sample_frac() -> stare fje niso relevantne
# v1.0.0: slice_min(), slice_max(), slice_head(), slice_tail(), slice_sample() -> nove fje


iris%>%top_n(2, wt=Petal.Width)
iris%>%slice_max(order_by = Petal.Width, n=2)

mtcars |>
  mutate(avto=rownames(mtcars)) |>
  as_tibble() |>
  dplyr::select(avto,
                mpg) |>
  slice_max(order_by=mpg,
            n=3) # -> če je več enakih vrne vse

mtcars |>
  mutate(avto=rownames(mtcars)) |>
  as_tibble() |>
  dplyr::select(avto,
                mpg) |>
  slice_min(order_by=mpg,
            n=3)

dfAvto<-mtcars |>
  mutate(avto=rownames(mtcars)) |>
  dplyr::select(avto,mpg,wt)

ggplot(dfAvto) +
  aes(x = mpg, y = wt) +
  geom_point(shape = "circle", size = 2.85, colour = "#112446") +
  geom_smooth(method="lm",se=F)+
  theme_minimal()

mtcars |>
  slice_sample(prop=0.5)

mtcars |>
  slice_sample(n=10)

mtcars |>
  slice_head(n=6)

mtcars |>
  slice_head(prop=0.2)

mtcars |>
  slice_head()

mtcars |>
  slice_tail()

mtcars |>
  mutate(avto=rownames(mtcars)) |>
  dplyr::select(avto,mpg,wt,cyl) |>
  slice_max(n=3,by="cyl",order_by=mpg)

mtcars |>
  mutate(avto=rownames(mtcars)) |>
  dplyr::select(avto,mpg,wt,cyl) |>
  group_by(cyl) |>
  slice_max(n=3,order_by=mpg) |>
  ungroup()

mtcars |>
  group_by(cyl) |>
  summarise(povprecna_poraba=mean(mpg)) |>
  ungroup()

mtcars |>
  summarise(povprecna_poraba=mean(mpg),
            .by=c(cyl,am))
