library(tidyverse)
library(janitor)
library(readxl)
df<-mtcars |> slice_sample(n=10)

  #row_number
df |>
  mutate(id=row_number()) |>
  relocate(id,.before="mpg")

  #row_number+grupa
df |>
  group_by(cyl) |>
  mutate(id=row_number()) |>
  relocate(id,.before="mpg")

  #ntile
df |>
  mutate(skupina=ntile(mpg,3)) |>
  relocate(skupina,.before="mpg")

  #min_rank (descending)
df |>
  dplyr::select(mpg,cyl) |>
  mutate(vrstni_red=min_rank(mpg)) 

  #min_rank (acceding)
df |>
  dplyr::select(mpg,cyl) |>
  mutate(vrstni_red=min_rank(-mpg)) 


  #dense_rank (zafila luknje v rankanju)
df |>
  dplyr::select(mpg,cyl) |>
  mutate(vrstni_red=dense_rank(-mpg)) 

  #lead, lag
df1<-airquality |>
  clean_names() |>
  dplyr::filter(month==5) |>
  head(10)

df1 |>
  mutate(temp_lag=lag(temp),
         procent_spremembe=round((temp_lag-temp)/temp_lag*100,2))


df2<-read_xlsx("podatki/import_problematic.xlsx",
               sheet=3,
               skip=10)
df2 |> 
  slice(2:213) |>
  head()


fTOc<-function(x) {
  round((x-32)*5/9,0)
}
input<-c(100, 102, 99)
fTOc(input)

airquality |>
  clean_names() |>
  mutate(temp_c=fTOc(temp)) |>
  head()

stupidFunction<-function(x,y){return(sum(x,y))}


airquality %>% 
  clean_names() %>%
  mutate(something=stupidFunction(month, day)) %>% #računa vektorsko (vzame vse vrednosti za mesec in jih sešteje, enako naredi z dnevom, nato te dve števili sešteje skupaj)
  head(3)

stupidFunction_v<-Vectorize(stupidFunction)
airquality %>% 
  clean_names() %>%
  mutate(something=stupidFunction_v(month, day)) %>% 
  head(3)

  #rowwise()
airquality |>
  clean_names() |>
  rowwise() |>
  mutate(something=stupidFunction_v(month, day)) %>% 
  ungroup() %>%
  head()

  #group_by
airquality |>
  clean_names() |>
  mutate(id=row_number()) |>
  mutate(something=stupidFunction_v(month, day),
         .by="id") %>% 
  head()

airquality |>
  clean_names() |>
  mutate(id=row_number()) |>
  group_by(id) |>
  mutate(something=stupidFunction_v(month, day)) %>% 
  head()

airquality |>
  clean_names() |>
  mutate(povprecje=mean(temp),
         .by="month") |>
  head()

mpgToLiters <- function(x) {
  if (x==0) {
    return(0)
  }else {
    return(round(325.21/x,2))
  }
}

mtcars |>
  mutate(car=row.names(mtcars)) |>
  rowwise() |>
  mutate(l_per_100km=mpgToLiters(mpg)) |>
  relocate(l_per_100km,.before="mpg") |>
  ggplot()+
  aes(x=l_per_100km,y=wt,label=car)+
  geom_point()+
  geom_label()+
  geom_smooth(method="lm",se=F)+
  theme_light()


band_members
band_instruments

  #inner_join
band_members |>
  inner_join(band_instruments,
             join_by(name==name))
  #left_join
band_members |>
  left_join(band_instruments,
            join_by(name==name))


  #right_join
band_members |>
  right_join(band_instruments,
            join_by(name==name))
  
  #full_join
band_members |>
  full_join(band_instruments,
            join_by(name==name))


  #anti_join
band_members |>
  anti_join(band_instruments,
            join_by(name==name))

  #semi_join
band_members |>
    semi_join(band_instruments,
            join_by(name==name))

  #cross_join
band_members |>
  cross_join(band_instruments)