library(tidyverse) 
library(janitor)

iris %>% 
  clean_names() %>%
  dplyr::select(contains("sepal")) %>%
  arrange(desc(sepal_width)) %>%
  rename(sepalL = sepal_length, sepalW = sepal_width) %>%
  as_tibble()

mtcars %>%
  rename_with(~str_c("mtcars_",.,sep=""), starts_with("d")) %>%
  as_tibble()

# advanced
df_renamed <- df %>% 
  rename_with(
    ~name_mapping_df$new_name[match(.x, name_mapping_df$old_name)],
    .cols = everything()
  )

df_renamed

mtcars %>% 
  clean_names() %>%
  count(cyl, sort = T)

mtcars %>%
  summarise(max_mpg=max(mpg),
            average_mpg=mean(mpg))

airquality %>%
  clean_names() %>%
  summarise(across(.cols=ozone:temp,.fns=list(\(x) mean(x, na.rm = T))))

airquality %>%
  clean_names() %>%
  summarise(across(.cols=ozone:temp, 
                   .fns=list(povp=\(x) round(mean(x, na.rm=T),2),
                             maks=\(x) max(x, na.rm = T),
                             vsota=\(x) sum(x, na.rm = T)),
                   .names = "{.fn}-{.col}-hihi"))

mtcars %>%
  clean_names() %>%
  group_by(cyl) %>%
  summarise(mean(mpg), max(mpg))

airquality %>% 
  clean_names() %>%
  group_by(month) %>%
  summarise(mean(temp))

airquality %>% 
  clean_names() %>%
  summarise(povpTemp=mean(temp), .by=c("month")) %>%
  mutate(povpTempCelsius=round((povpTemp-32)*5/9,1)) %>%
  as_tibble()

iris %>%
  mutate(across(where(is.numeric), as.character)) %>%
  as_tibble()

airquality %>%
  clean_names() %>%
  dplyr::filter(month %in% c(5,6,7)) %>%
  as_tibble()

airquality %>%
  clean_names() %>%
  dplyr::filter(month != 5) %>%
  as_tibble()

library(arrow)
taksi<-read_parquet("C:/Users/mihap/Code/famnit23-podatkovno/class/2024-03-13/podatki/data.parquet")

# st vozenj po payment type
taksi %>%
  clean_names() %>%
  count(payment_type)

# povp znesek (total_amount) voznje in povp znesek voznje po dnevih
taksi %>%  
  summarise(povp = mean(total_amount))

taksi %>%  
  mutate(dan = wday(tpep_pickup_datetime)) %>%
  summarise(povp = mean(total_amount), .by = c("dan")) %>%
  arrange(dan)
