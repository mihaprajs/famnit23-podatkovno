# vaje 4B3
library(tidyverse)
readxl::read_excel("C:/Users/mihap/Code/famnit23-podatkovno/practice/R/2024-03-29/Sample - Superstore.xls")->store
store %>% {.$`Ship Date` - .$`Order Date`}
store %>% {as.Date(.$`Ship Date`) - as.Date(.$`Order Date`)}
store %>% {difftime(.$`Ship Date`,.$`Order Date`,units = "days")}->store$`Order Delay`
store %>% .[,ncol(.)]

# C
"2009-1-14 18:30:00" %>% ymd_hms() %>% as.Date()
"2009-1-14 18:30:00" %>% stringr::str_extract("^[^ ]+")
"2009-1-14 18:30:00" %>% stringr::str_remove(" .+") %>% ymd()

"24.10.1999" %>% dmy() %>% {c(day(.),month(.),year(.))}
"24.10.1999" %>% strsplit("\\.") %>% unlist()
"24.10.1999" %>% stringr::str_split("\\.") %>% .[[1]] %>% as.numeric() # stringr::str_split() in strsplit() delata isto

"1/1/2017 9:15" %>% dmy_hm()

"9:15:00 5 Jan 2020" %>% str_split(" ") %>% .[[1]] %>% {c(.[-1],.[1])} %>% paste(collapse=" ") %>% dmy_hms() %>% as.Date()
"9:15:00 5 Jan 2020" %>% str_remove("^[^ ]*") %>% dmy()

# D
"Zive naj vsi narodi
ki hrepene docakat dan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da rojak
prost bo vsak,
ne vrag, le sosed bo mejak."->himna
himna %>% cat()
himna %>% str_split(" |\n") %>% unlist() %>% length()
himna %>% str_count(".") # ne prešteje \n
himna %>% nchar()
# dir(recursive=",patteren="word") %>% read.csv()->word
("C:/Users/mihap/Code/famnit23-podatkovno/practice/R/2024-03-29/word.txt") %>% read.csv()->word
word %>% .[grep("age",.[,1]),]
word$X2 %>% str_view("age")
word$X2 %>% strsplit("") %>% unlist() %>% tolower() %>% factor() %>% summary() %>% .[order(-.)]

"a|A" %>% str_count(word$X2,.) %>% sum()
paste(letters,LETTERS,sep = "|") %>% sapply() # function(x){} ali \(x){}
paste(letters,LETTERS,sep = "|") %>% sapply(\(x){x %>% str_count(word$X2,.) %>% sum()})%>% .[order(-.)]

store$`Customer Name` %>% strsplit(" ") %>% sapply(\(x){paste(str_sub(x[1],1,1),".", str_sub(x[length(x)],1,1),".",sep = "")})->store$C.N


fakulteta <- function(n) {
  if (n<=0) {
    1
  } else {
    n*fakulteta(n-1)
  }
}
fakulteta(5)
fakulteta2<-\(n){prod(1:n)}
fakulteta2(5)
jeNaravno<-\(x){x>0 & x%%1==0}

c(4,1,0,-2,3.4) %>% jeNaravno()
jeNaravno2<-\(x){if (is.numeric(x)){
  x>0 & (x%%1==0)
  } else{
    F
  }
}
c(4,1,0,-2,3.4,"aa") %>% jeNaravno2()

1:5 %>% sapply(fakulteta)




