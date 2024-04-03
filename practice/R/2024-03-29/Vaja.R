# od prejšnič B3
library(tidyverse)
dir(recursive = T)
"C:/Users/mihap/Code/famnit23-podatkovno/practice/R/2024-03-22/DataVaje/time_series_covid19_confirmed_global.csv" %>% read_csv() -> df1

df1 %>% .[1:5,1:5]
df1 %>% .[,ncol(.)] %>% sum() # komulativno
df1 %>% .[,ncol(.)-0:1] %>% {sum(.[,1])-sum(.[2])} # samo novi na zadnjji dan
df1 %>% .[,c(2,ncol(.))]
df1 %>% .[,c(2,ncol(.))] %>% write.csv(gzfile("C:/Users/mihap/Code/famnit23-podatkovno/practice/R/2024-03-22/DataVaje/CovidGlobalno.csv.gz"))
# od prejšnič C
dir(recursive = T)
"SI.zip" %>% unzip(list = T)
"SI.zip" %>% unzip(exdir = "SI")
"SI/SI.txt" %>% read.table(sep = "\t") %>% .[,-4:-9] -> zip
zip %>% head()
  # grep, grepl, stringr::str_detect()
c("Peter","Janko","Metka","Medo")->imena
grep("e",imena)
grepl("e",imena)
imena[grep("e",imena)]
imena[grepl("e",imena)]
stringr::str_detect(imena,"e")
zip$V3 %>% .[grep("z",.)]
  # regex: regularni izrazi
zip %>% .[grep("z",.$V3),2:3]
zip %>% .[grep("H|h",.$V3),2:3]
zip %>% .[grep("[Hh]",.$V3),2:3]
zip %>% .[grep("r$",.$V3),2:3]
zip %>% .[.$V2>=6000 & .$V2<7000,2:3]
zip %>% .[.$V2>=6000 & .$V2<7000,2:3] %>% write.table("Obala.tsv",sep = "\t",row.names = F)
zip %>% .[.$V2>=6000 & .$V2<7000,2:3] %>% {colnames(.)<-c("zip","kraj");.} %>% write.table("Obala.tsv",sep = "\t",row.names = F)
# od prejšnič D
dir(recursive = T,pattern = "\\.xlsx?$")
"Sample - Superstore.xls" %>% readxl::read_xls() -> store
store %>% .[seq(100,nrow(store),100),1:7] %>% writexl::write_xlsx("Trgovina.xlsx")
"Sample - Superstore.xls" %>% readxl::excel_sheets()
"Sample - Superstore.xls" %>% readxl::read_xls(sheet = 2) -> store2
store$`Customer Name` %>% unique()
store$`Customer Name` %>% unique() %>% .[grep(" [^ ]+ ",.)] # iščemo vnose z več kot tremi besedami

# 2024-03-29 A
library(lubridate)
Sys.time() %>% class() #posix
Sys.Date() %>% class() #date
"23.3.2024" %>% class() #character
today() %>% month(label = T,abbr = F,locale = "Slovenian")
today() %>% lubridate::wday(label = T,abbr = F,locale = "Slovenian")
v1<-c("13.1.2021","3.Jan.2011","4 March 14")
v1 %>% class() #character
v1 %>% lubridate::dmy()
"1.Feb.2020" %>% dmy() %>% {today()-.}
"1.Feb.2020" %>% dmy() %>% difftime(today(),.,units = "weeks")
"1.Jan.2024" %>% dmy() %>% {.+years(1)-.}
"25.12.2010" %>% dmy() %>% {.+years(c(0:9))}
"25.12.2010" %>% dmy() %>% {.+years(c(0:9))} %>% wday(label=T,abbr=F)
"25.12.2010" %>% dmy() %>% {.+years(c(0:9))} %>% wday(label=T,abbr=F) %>% {.>"Monday"}
"25.12.2010" %>% dmy() %>% {.+years(c(0:9))} %>% .[wday(.,label = T,abbr = F)>="Monday" & wday(.,label = T,abbr = F)<="Friday"]
"25.12.2010" %>% dmy() %>% {.+years(c(0:9))} %>% .[wday(.,label = T,abbr = F)>="Monday" & wday(.,label = T,abbr = F)<="Friday"] %>% year()
"3.1.2021" %>% dmy() %>% {.+years(c(0:100))} %>% {.[wday(.)==1]<-.[wday(.)==1]+days(1);.} %>% {.[wday(.)==7]<-.[wday(.)==7]+days(2);.}
# B
dB1<-"April 5th 22";dB2<-"30.1.2020"; dB3<-"2/14/00";dB4<-"2010-6-19"; dB5<-"4. Jan 1999"
dB1 %>% mdy() %>% format("%d %m %Y %y %h") # 05 04 2022 22 Apr
dB1 %>% mdy() %>% format("%d.%m.%Y")
dB2 %>% dmy() %>% format("%m/%d/%y")
dB3 %>% mdy() %>% format("%Y-%m-%d")
dB4 %>% ymd() %>% format("%d. %h %Y")
dB5 %>% dmy() %>% format("%d.%m.%Y")
