library(tidyverse)


old_dates<-ymd("17000101")
as.numeric(old_dates)

df<-data.frame(date=c(20240320,20240321,20240322))

df %>% 
  mutate(datum=ymd(date),
         mesec=month(date))

date<-"2019-05-05"
time<-"18:51:32"

datetime<-paste(date,time) # lahko tudi str_c(date,time)

as.POSIXct(datetime) ## base R

datetime_base<-as.POSIXct(datetime) ## base R
class(datetime_base)

ameriski_datum<-"032004"
as.POSIXct(ameriski_datum,format="%d/%d/%y") # base R za spremembo formata datuma
mdy(ameriski_datum) # tidyverse način za spremembo datuma

now()
today()

as_date(ameriski_datum)

Sys.Date()
today()
Sys.time()

now()
zacetek<-now()
Sys.sleep(10)
now()-zacetek


ymd("2017-01-31")
mdy("Januar 31, 2017",locale = "sl_SL.UTF-8")
dmy("31-Jan-2017")
dmy("17/10/2018")

mdy("März 31, 2017", locale="sl_SL.utf8")
mdy("März 31, 2017", locale="de_DE.utf8")

year<-2007
month<-11
day<-5
hour<-15
minutes<-7
make_date(year, month, day)
make_datetime(year, month, day, hour, minutes)

now()
as_datetime(today())
as_date(now())


d1 <- "January 1, 2010"
mdy(d1)
d2 <- "2015-Mar-07"
ymd(d2)
d3 <- "06-Jun-2017"
dmy(d3)
d4 <- c("August 19 (2015)", "July 1 (2015)")
mdy(d4)
d5 <- "12/30/14" # Dec 30, 2014
mdy(d5)

x<-ymd_hms("2019-05-05 19:23:13")
year(x)
month(x)
mday(x)
yday(x)

danes<-today()
yday(danes)
month(danes,label=TRUE,abbr=FALSE,locale="sl_SL.UTF-8")

year(danes)
day(danes)
wday(danes,label=TRUE,abbr=FALSE,locale = "sl_SL.UTF-8")


pickup_dan<-wday(pickuptime,label=TRUE,abbr=FALSE,locale = "sl_SL.UTF-8")

summary(pickup_dan)

sedaj<-now()
seconds(sedaj)

wday("2004-03-26",label=T,abbr=F)
wday("2044-03-26",label=T,abbr=F)

my_age<-today()-ymd("2004-03-26")
as.duration(my_age)

dhours(c(12, 24))

novo_leto<-ymd("2024-01-01")
as.duration(today()-novo_leto)

ddays(0:5)
dweeks(3)
dyears(20)

days(7)
hours(c(12, 24))
minutes(10)
seconds(15)
months(1:6)
weeks(3)
years(1)


today()+dyears(10)
wday(ymd("2004-03-26")+dyears(10))

timeDiff<-now()-ymd_hms("2021-01-01 00:00:00")
timeDiffS<-as.duration(timeDiff)

# to period
seconds_to_period(timeDiffS)

seconds_to_period(as.duration(now()-zacetek))

difftime(ymd("2004-03-26"),now(),units = "days")


mdy("08,30,1930")
mdy("Aug 30,1930")
dmy("30aug1930")

date10<-"30aug1930"
as.Date(date10,format = "%d%b%Y")

