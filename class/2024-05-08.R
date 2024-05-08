library(tidyverse)
library(janitor)

people <- tibble(
  name = c('Alice', 'Bob', 'Catherine', 'David', 'Emma'),
  age = c(25, 58, 33, 15, 46)
)

people

# <18 <- otrok
# 18-50 <- odrasel
# >50 <- senior

# age_group

people |>
  mutate(age_group=if_else(age<18,"otrok",
                           if_else(age>50,"senior","odrasel")))

people |>
  mutate(age_group=if_else(age<18,"otrok",
                           if_else(age>50,"senior",
                                   if_else(age>40,"kriza srednijh let","odrasel"))))

  #case_when
people |>
  mutate(age_group=case_when(age<18~"otrok",
                             age>50~"senior",
                             age>40~"kriza srednjih let",
                             .default="odrasel"))

people <- tibble(
  name = c('Alice', 'Bob, Jane', 'Catherine,Jim', 'David', 'Emma'),
  age = c(25, 58, 33, 15, 46)
)

people |>
  separate_rows(name) # stara fja

people |>
  separate_longer_delim(name,",") |>
  mutate(name=trimws(name))

airquality |>
  clean_names() |>
  map(mean,na.rm=T)

airquality |>
  clean_names() |>
  map_vec(mean,na.rm=T)

dummy<-function(x,y){
  rez<-sum(x,y)
  return(rez)
}

airquality |>
  clean_names() |>
  mutate(vsota=map2_int(month,day,dummy)) #map2 fja handla tudi row_wise

dummy_f<-function(x,y,z){
  rez<-sum(x,y,z)
  return(rez)
}

dummy_fv<-Vectorize(dummy_f)

airquality |>
  clean_names() |>
  mutate(vsota=dummy_fv(month,day))

airquality |>
  clean_names() |>
  mutate(vsota=pmap_dbl(list(month,day,temp,wind),dummy_f))

files<-list.files("./podatki","*.csv",full.names = T)

result<-list()
i<-1
for (file in files) {
  result[[i]]<-read.csv2(file)
  i=i+1
}

df<-rbindlist(result)
df

fdOne<-map(files,read.csv2) |>
  list_rbind()


library(gt)
library(lubridate)

  # kreiranje dataframe
df<-sp500 |>
  dplyr::select(date:close) |> 
  mutate(teden=week(date),
         dan_v_tednu=lubridate::wday(date, abbr = FALSE, label=TRUE)) |> 
  head(14) |>
  arrange((teden))|> 
  dplyr::filter(between(teden,50,52)) 

  #kreiranje gt objekta
gt<-df |> 
  gt(caption="First gt object",
     groupname_col = "teden") |> 
  tab_header(title="SP500 example",
             subtitle = "trgovanje v 6 dneh") |> 
  fmt_currency(columns=c(open:close),
               currency = "EUR") |> 
  fmt_date(columns=date,
           date_style = 7) 

  #dodajanje povzetka
gt|> 
  summary_rows(
    columns = c(high, low),
    fns = list(average = "mean"),
    fmt=~fmt_currency(.,
                      accounting = T,
                      placement = "right",
                      currency="EUR",
                      incl_space = T,
                      decimals = 0))

library(gtsummary)

airquality |>
  clean_names() |>
  dplyr::filter(month %in% c(5,6)) |>
  head() |>
  tbl_summary(include = c(ozone,temp,wind,month),
              by=month,
              missing = "no",
              statistic = list(all_continuous() ~ "{mean}")) |>
  add_p()


