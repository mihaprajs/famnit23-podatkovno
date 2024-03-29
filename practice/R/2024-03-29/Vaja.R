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

