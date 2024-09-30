library(tidyverse)
a = c(5,7,2,9)
ifelse(a %% 2 == 0,"even","odd") # modulo -> %%

for (stevilka in a) {
  if (stevilka %% 2 == 0) {
    print("sodo")
  } else {
    print("liho")
  }
}
?sample
sample(10,3)
sample(1000,30,replace = T)
sample(10,30,replace = T)


zacetek<-Sys.time()
nakljucna_stevila<-c()
nakljucna_stevila<-sample(100000,10000,replace = T)
Sys.time()-zacetek
zacetek<-Sys.time()
nakljucna_stevila<-c()
for (i in 1:10000) {
  nakljucna_stevila<-c(nakljucna_stevila,sample(100000,1,replace = T))
}
Sys.time()-zacetek
sample(1000,10000,replace = T) # same as for loop above

soda_stevila<-c()
liha_stevila<-c()
for (stevilo in nakljucna_stevila) {
  if (stevilo %% 2 == 0) {
    soda_stevila<-c(soda_stevila,stevilo)
  } else {
    liha_stevila<-c(liha_stevila,stevilo)
  }
}
length(soda_stevila)/length(nakljucna_stevila)
length(liha_stevila)/length(nakljucna_stevila)

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

x<-1:5
for (val in x) {
  if (val == 3) {
    break
  }
  print(val)
}
for (val in x) {
  if (val == 3) {
    next
  }
  print(val)
}
y<-10:15
for (stevilo in y) {
  for (val in x) {
    if (val == 3) {
      break
    }
    print(val)
  }
  print(stevilo)
}
x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}

mtcars
?apply
apply(mtcars, 2, mean)
#sapply -> vrne vektor, lapply -> vrne list, tapplay, mapply
sapply(mtcars, mean)
lapply(mtcars, mean)
sapply(airquality, mean)
sapply(airquality, mean, na.rm=TRUE)
summary(airquality)
mapply(mean,mtcars)
mapply(mean,na.rm=T,airquality)
tapply(airquality$Ozone,
       airquality$Month,
       mean,
       na.rm=T)
tapply(mtcars$mpg,
       mtcars$cyl,
       mean)
library(writexl)
write_xlsx(mtcars,"./mtcars.xlsx")

vsota <- function(x,y) {
  res<-x+y
  paste0("Vsota ",x," in ",y," je ",res,".")
}
vsota(10,20)
power <- function(x,y=0) {
  res<-x^y
  paste0("Rezultat ",x," na ",y," je ",res,".")
  return(res)
}
power(2,6)
power(2,8)
power(2)

nc<-sample(10000000,10000000,replace = T)
sum(ifelse(nc %% 2 == 0,T,F))/length(nc)

vsota_razlika <- function(x,y) {
  vsota<-x+y
  razlika<-x-y
  
  return(list(sum=vsota,difference=razlika))
}
vsota_razlika(10,20)$sum
vsota_razlika(20,10)$difference

lapply(list(1,2,3), function(x) { 3 * x })
sapply(sample(10,10,replace = T),
       function(x) ifelse(x%%2==0,T,F))

mapply(function(x,y,z) { 3 * x*y*z},list(1,2,3),MoreArgs=list(y=2,z=3))
