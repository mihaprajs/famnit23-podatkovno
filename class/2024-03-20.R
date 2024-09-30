# uvdoz parquet datoteke,
library(arrow)
df1<-read_parquet("podatki/data.parquet")



# izdvoji/shrani v spremenljivko pickupdaytime
pickuptime<-as_datetime(df1$tpep_pickup_datetime)
dropoftime<-as_datetime(df1$tpep_dropoff_datetime)

# parse date
as_date(pickuptime)
as_date(dropoftime)

# čas vožnje
df1$tpep_pickup_datetime<-ymd_hms(df1$tpep_pickup_datetime)
df1$tpep_dropoff_datetime<-ymd_hms(df1$tpep_dropoff_datetime)
cas_voznje<-dropoftime-pickuptime
razlika<-mean(cas_voznje, na.rm=T)
seconds_to_period(razlika)

seconds_to_period(min(cas_voznje))

df2<-data.frame(cas_voznje=cas_voznje)
head(df2)
df2 %>% dplyr::filter(cas_voznje>0 & cas_voznje<7200)
df3<-df1 %>% 
  mutate(pickDan=wday(tpep_pickup_datetime),
         dropDan=wday(tpep_dropoff_datetime)) %>%
  dplyr::filter(pickDan!=dropDan) 

