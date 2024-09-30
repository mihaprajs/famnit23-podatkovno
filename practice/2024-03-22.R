# D -> od prejšnjega tedana
rep("A",3) # -> rep=repeat
rep(c("A","B"),4)
rep(c("A","B"),c(2,4))
rep(c("Kava","Caj","Pivo","Sok"),30)
sample(0:6,65,replace = T)
sample(0:6,7,replace = F)
sample(factor(rep(c("Kava","Caj","Pivo","Sok"),30)))->f1
order(c("b","d","a","c"))
v<-c("b","d","a","c")
v[order(v)]
f1[order(f1)]
# pipa |> ali %>% -> potrebuje library(tidyverse)
sum(1:4)
1:4 |> sum()
library(tidyverse)
1:4 %>% sum()
1:12 %>% matrix(3,4)
3 %>% matrix(1:12,.,4)
4 %>% matrix(1:12,3,.)
# pikico lahko uprabimo več kot enkrat
4 %>% matrix(1:12,12/.,.)
4 %>% matrix(1:12,12/.,4)
4 %>% {matrix(1:12,12/.,4)} # ustavimo privzeto nastavitev, da gre argument na prvo mesto
4 %>% letters[.]
letters %>% .[1:4]
sample(letters) %>% .[order(.)]
# E
iris %>% head()
iris %>% .[1:6]
iris %>% str()
iris$Species %>% levels() # == iris$Species %>% levels(.)
iris$Species=="setosa"
iris[iris$Species=="setosa" & iris$Petal.Length<1.5,]
# DON'T DO: iris$Species="setosa" -> povozi originalne podatke
iris %>% .[.$Species=="setosa" & .$Petal.Length<1.5,]
airquality %>% head()
airquality %>% .[.$Temp >=50 & .$Temp <=60,]
airquality %>% .[.$Wind >15/1.609,c("Wind","Day","Month")]
# E: 1. naloga sampel, letters, LETTERS, paste/stringr::str_c
paste(LETTERS,letters,sep = "")
paste(letters,collapse = ".")
paste(sample(LETTERS[-c(1,5,9,15,21)],50,replace = T,),
      sample(letters[c(1,5,9,15,21)],50,replace = T,),
      sample(letters[-c(1,5,9,15,21)],50,replace = T,),
      sample(letters[c(1,5,9,15,21)],50,replace = T,),
      sample(letters[-c(1,5,9,15,21)],50,replace = T,),
      sep = "")
letters[c(1,5,9,15,21)] # -> najde samo samoglasnike
letters[-c(1,5,9,15,21)] # -> najde samo sogalsnike
1:26 %>% {names(.)<-letters;.} %>% .[c("a","e","i","o","u")]
1:4 %in% 3:6 # %>% za vsak element na levi pogleda če je na desni in vže true ali false
c(F,T) & c(T,T) # && ne dela vedno uporabi le EN (1) "&"
1:4 %>% {.+1} %>% sum()
# getwd() v scripti vrne dir v katerem je projekt
# getwd() v .qmd vrne dir v katerem je file

# A
dir(recursive = T)
"DataVaje/file_example_XLS_50.xls" %>% readxl::read_excel()
"DataVaje/file_example_XLS_50.xls" %>% readxl::read_excel(skip = 2) # preskiči prvi 2 vrstici
"DataVaje/file_example_XLS_50.xls" %>% readxl::read_excel(skip = 2) %>% as.data.frame()
"DataVaje/data.csv" %>% read.csv()
"DataVaje/data.csv" %>% read.csv() %>% writexl::write_xlsx("DataVaje/drzave.xlsx")
# B
"DataVaje/time_series_covid19_confirmed_global.csv" %>% read.csv() -> df1
df1 %>% dim()
df1[df1$Country.Region=="Slovenia",1:6]
df1 %>% .[.$Country.Region=="Slovenia",c(1:4,ncol(.))]
df1 %>% .[.$Country.Region=="Slovenia",c(1:4,ncol(.)-6:0)]
df1 %>% .[.$Country.Region=="Slovenia",c(1:4,ncol(.)-6:0)] %>% write.csv("DataVaje/CovidSlo")

