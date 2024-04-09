# vaje 5 A do konca
library(tidyverse)
fakulteta<-\(n){if(n<=0){1}else{n*fakulteta(n-1)}}
fakulteta3<-\(n){ifelse(n<=0,1,n*fakulteta3(n-1))}
1:5 %>% fakulteta3()

# vaje 5 B

{-360:360/360*pi} %>% {plot(sin(.),cos(.),type="l")}
{-100:100/100*pi} %>% {plot(.,-sqrt(1-.^2))}

incircle<-\(x,y){x^2+y^2<=1}
incircle(1,1)
{0:10/10} %>% points(.,.)
{0:10/10} %>% incircle(.,.)

nrt<-\(x,n=2){x^(1/n)}
nrt(1024)
nrt(1024,5)

# vaje 5 C
min_matrika<-\(m){apply(m,2,min)}

matrix(1:9,3,3) %>% min_matrika()
  #apply za matrike, mapply za ultiple parametre, sapply>lapply za vektorje, tapply za agregacijo
minolovec<-\(nrow,ncol,nmines=floor(nrow*ncol/5)){
  c(rep(T,nmines),rep(F,nrow*ncol-nmines)) %>% sample() %>% matrix(nrow,ncol)
}
minolovec(3,4)

print("sporočilo")
warning("sporočilo")
message("sporočilo")
tryCatch({"a"+1},error=\(x){message("Podatki so nesmiselni");NaN})

minolovecTC<-\(nrow,ncol,nmines=floor(nrow*ncol/5)){
  c(rep(T,nmines),rep(F,nrow*ncol-nmines)) %>% sample() %>% matrix(nrow,ncol) %>% tryCatch(error=\(x){message("Podatki so nesmiselni");NaN})
}
minolovecTC(3,4,q)

# vaje 5 D

tapply(1:10,rep(c("a","b"),5),sum)
tapply(iris[,1],iris$Species,mean)
apply(iris[,-5],2,\(x){tapply(x,iris$Species,mean)})
sapply(iris[,-5],\(x){tapply(x,iris$Species,mean)})

aggregate2<-\(vector,df,fun){sapply(df,\(x){tapply(x,vector,fun)})}
aggregate2(iris[,5],iris[,-5],mean)


inputdf<-data.frame(From=c("colour","lift","centre"), To=c("color","elevator","center"),stringsAsFactors=F)
inputstring<-"In the centre of the lift there was a banana"
inputstring %>% strsplit(" |\n") %>% unlist() %>% str_replace_all(inputdf[1,1],inputdf[1,2])
inputstring %>% str_replace_all(inputdf[1,1],inputdf[1,2])
inputstring %>% strsplit(" |\n") %>% unlist() %>% {sapply(inputdf[,1],\(x){x==.})} # zaključimo naslednjič

translate <- function(df,string) {
  string %>% str_split(" |\n") %>% unlist() 
}