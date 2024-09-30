head(BT)
tail(BT)

df<-read_parquet("podatki/data.parquet")
write.csv(df, "podatki/data.csv")

start<-Sys.time()
nyc<-read.csv("podatki/data.csv")
Sys.time()-start


library(readxl)
library(writexl)



write_xlsx(airquality,"podatki/airquality.xlsx")



df1<-data.frame(A=c(1,2,3),B=c("apple","banana","lemon"))
df2<-data.frame(C=c("car","truck","bus"))
df3<-cbind(df1,df2)
df3  

df1<-data.frame(A=c(1,2,3),B=c("apple","banana","lemon"))
df2<-data.frame(A=c(4,5,6),B=c("bike","plane","train"))
df4<-rbind(df1,df2)


# ODMOR

#base R
paste(2, "je najmanjše praštevilo")
paste0(2, "je najmanjše praštevilo")
paste(2, "je najmanjše praštevilo", sep="")
paste0(2, " je najmanjše praštevilo")

#tidyverse
str_c(2, "je najmanjše praštevilo")

str_c("Beautiful",NA, sep=" ")
paste("Beautiful",NA, sep=" ") #base R
#predpona str_ za funk. iz packagea stringr
for (i in 1:10) {
  
  res<-ifelse(i%%2==0,"sodo", "liho")
  print(paste(i,"je",res,"število!", sep=" "))
  
  
}
for (i in 1:10) {
  
  res<-ifelse(i%%2==0,"sodo", "liho")
  print(str_c(i,"je",res,"število!", sep=" "))
  
  
}

nchar(c("Bruce", "Wayne"))
stringr::str_length(c("Bruce", "Wayne")) #stringr:: vzame funk. iz stringr
length(c("Bruce", "Wayne"))
str_length(c("Bruce", "Wayne"))


ime<-c("John", "Jane")
toupper(ime)
tolower(ime)
str_to_upper(ime)
str_to_lower(ime)
str_to_title(ime)

str_sub(c("Bruce", "Wayne"), 1, 4)
str_sub(c("Bruce", "Wayne"), -3, -1)

ime2<-c("Bruce", "Wayne", "John", "Jane")
sum(str_ends(ime2, "e"))
ime2[str_ends(ime2, "e")]
str_count(ime2[str_ends(ime2, "e")])
length(ime2[str_ends(ime2, "e")])

string<-c("car", "caaaaaar", "cr", "caar", "bcar")
str_count(string, "^ca{1,2}r")
str_count(string, "^ca?r")

pizzas <- c("cheese", "pepperoni", "sausage and green peppers")

str_detect(pizzas, pattern = "pepper")

str_subset(pizzas, pattern = fixed("pepper"))
str_count(pizzas, pattern = fixed("pepper"))
str_count(pizzas, pattern = fixed("e"))

date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")

split_dates <- str_split(date_ranges, pattern = fixed(" - "), simplify = TRUE) #naredi matriko, simplify = FALSE -> nariše seznam, FALSE je default

split_dates

library(janeaustenr)
knjige<-austen_books()

text<-knjige$text
text<-paste(knjige$text, collapse = ", ")
str_count(text, "John")

ids <- c("ID#: 192", "ID#: 118", "ID#: 001")

# Replace "ID#: " with ""
id_nums <- str_replace(ids, "ID#: ", "")

id_nums
as.numeric(id_nums)

phone_numbers <- c("510-555-0123", "541-555-0167")

str_replace_all(phone_numbers, "-", ".")
str_replace(phone_numbers, "-", ".")

elementi<-c("c.r","cr","car")
str_detect(elementi, ".") # pika najde katerikoli element
str_detect(elementi, fixed("."))
str_extract(ids, "\\d+")
