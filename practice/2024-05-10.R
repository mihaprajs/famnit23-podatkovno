# 8A
library(tidyverse)
airquality |> head()
c(1,2,NA) |> sum(na.rm=T)
1==NA
is.na(1)
is.na(NA)
airquality |> drop_na() # izbirše vrstice z vsaj enim NA 
airquality %>% .[!is.na(.$Ozone),] # |> ne dela v tem primeru, obvezno %>%
airquality %>% filter(!is.na(.$Ozone))
airquality |> filter(1) # ne dela
airquality |>
  group_by(Month) |>
  filter(min(Temp)==Temp) |>
  ungroup()
airquality %>% .[!is.na(.$Ozone),ncol(.)-0:3]
airquality %>%
  filter(!is.na(.$Ozone)) %>%
  select(ncol(.)-0:3,Ozone)
airquality %>%
  .[sample(1:nrow(.),floor(nrow(.)/15)),]
airquality %>%
  .[sample(rep(c(T,F),c(floor(nrow(.)/15),nrow(.)-floor(nrow(.)/15)))),]
airquality |> sample_frac(1/15)
airquality |> slice_sample(prop = 1/15)
airquality %>%
  .[sample(1:nrow(.),floor(nrow(.)/15)),grep("o",colnames(.))] 
airquality |>
  slice_sample(prop=1/15) |>
  select(matches("O"))



# A3
airquality %>% head()
#(0°F -32)*(5/9) = -17,78°C

airquality %>%
  {.$Celzij<-(.$Temp-32)*(5/9);.}
airquality %>%
  mutate(Celzij=(.$Temp-32)*(5/9))
airquality %>%
  {.$Celzij<-(.$Temp-32)*(5/9);.} %>%
  {c(max=max(.$Celzij),min=min(.$Celzij),povprecje=mean(.$Celzij))}
airquality %>%
  {.$Celzij<-(.$Temp-32)*(5/9);.} %>%
  summarise(max=max(.$Celzij),min=min(.$Celzij),povprecje=mean(.$Celzij))
?airquality
airquality %>%
  drop_na() %>%
  summarise(min(Solar.R),max(Solar.R))
airquality %>%
  summarise(min(Solar.R,na.rm=T),max(Solar.R,na.rm=T))
airquality %>%
  filter(min(Solar.R,na.rm=T)==Solar.R | max(Solar.R,na.rm=T)==Solar.R)


# B
mtcars %>%
  {.$Tip<-rownames(.);rownames(.)<-NULL;.}
mtcars %>%
  rownames_to_column()
mtcars %>%
  as_tibble() %>%
  {.$Tip<-rownames(.);rownames(.)<-NULL;.}
df<-mtcars %>%
  rownames_to_column() %>%
  rename(Tip=rowname)
df %>%
  filter(grepl("Merc",Tip)) %>%
  summarise(mean(hp))
df %>%
  mutate(Znamka=str_remove(Tip," .*")) %>%
  group_by(Znamka) %>%
  summarise(Avg=mean(hp)) %>%
  ggplot()+aes(y=Znamka,weight=Avg)+geom_bar()
df %>%
  .$cyl %>%
  factor() %>%
  summary()
df %>%
  group_by(cyl) %>%
  summarise(n())
df %>%
  group_by(cyl) %>%
  summarise(length(am))

# B4
df %>%
  sapply(class)
df %>%
  select_if(c(F,F,F,F,F,F,F,T,F,F,F,T))
df %>%
  select_if(is.numeric) %>%
  summarise_all(max)
df %>%
  summarise_if(is.numeric,min)
df %>%
  summarise_if(is.numeric,\(x){c(min(x),max(x))})
df %>%
  select_if(is.numeric) %>%
  summarise_all(c(max=max,min=min))
df %>%
  summarise_if(is.numeric,c(min=min,max=max))

# C
USArrests %>%
  nrow()
USArrests %>%
  summarise(n())
?USArrests
USArrests %>%
  .[order(-.$Murder),] %>%
  head(3)
USArrests %>%
  slice_max(Murder,n=3)
USArrests %>%
  arrange(desc(Murder)) %>%
  head(3)
USArrests %>%
  top_n(3,Rape)
USArrests %>%
  mutate(Skupno=Murder+Assault+Rape) %>%
  arrange(desc(Skupno))














