# A
m1<-matrix(c(1:9),3,,T)
m1
data.frame(A=c("Peter","Klavdija","Uros"),
           B=c("Mursic","Kutmar","Godnov"),
           C=c(T,F,T))->df1
df1
str(df1) # izpiše tip
colnames(m1)<-c("Stolpec1","Stolpec2","Stolpec3")
rownames(m1)<-c("Vrstica1","Vrstica2","Vrsica3")
rownames(m1)[2]<-"miška"
m1["miška","Stolpec3"]<-100
m1[,"Stolpec2"]<-10:12
colnames(df1)<-c("ime","priimek","spol")
df1$ime
df1$letnik<-c(88,80,75)
df1[,-5]->df1
df1[nrow(df1)+1,]<-list("Ademir","Hujdurovic",T,87)

# B
letters
v1<-c(1:26)
names(v1)<-letters
v1[c("a","e","i","o","u")]
names(v1[c(1,5,9,15,21)])
#v1[c(T,...)]
v1>20
v1[v1>20]
l1<-list(matrika=m1,dataframe=df1,vektor=v1,stevilka=5)
l1[[1]]
l1$dataframe
l1$dataframe$priimek
l1$stevilka<-6
l1[4:1][[1]]
c(l1$vektor[1:19],š=19.5,l1$vektor[-1:-19])->l1$vektor
l1$dataframe[1:2,]
?head()
head(l1$dataframe,2)
library(tidyverse) # da laho uporabimmi %>%
l1$dataframe %>% head(2)
l1$dataframe %>% head(.,2)
2 %>% head(l1$dataframe,.)
df1 %>% as.list() %>% as.data.frame()

# C
factor(c("moski","zenska","moski","moski"))
factor(c("moski","zenska","moski","moski"))->df1$spol
f1<-factor(c(1,2,3,1,2,3,2,0,3,4))
levels(f1)
summary(f1)
factor(c("moski","zenska","moski","moski")) %>% summary()
summary(f1)["3"]
levels(f1)[3]<-"6" # zamenja vse vrednosti, ki se skladajo z vrednostjo zapisano na indexu v levelu
datasets::airquality
airquality %>% head()
airquality %>% knitr::kable() %>% head()
airquality %>% tibble()
airquality %>% DT::datatable()
airquality$Month
factor(airquality$Month) %>% levels() %>% as.numeric()
unique(airquality$Month) # isto kot vrsta višje
factor(airquality$Month) %>% levels() %>% as.numeric() %>% month.name[.]
month.name
month.name[unique(airquality$Month)]
mtcars %>% head()
?mtcars
mtcars$cyl
unique(mtcars$cyl)
length(unique(mtcars$cyl))

# D
vpH<-runif(100, 0, 14) # 100 naključnih vrednosti med 0 in 14
cut(vpH,c(0,3,6,8,11,14),labels = c("s.acid","w.acid","neutral","w.base","s.base"))->f1
f1 %>% summary() %>% .["s.acid"]

otroci<-sample(0:6, 65, replace=T)
sample(letters,10,replace = T)
otroci %>% cut(c(-1,0,1,6),labels = c("0","1",">=2")) # otroci %>% cut(c(-inf,0,1,inf),labels = c("0","1",">=2"))
otroci %>% cut(c(-1,0,1,6),labels = c("0","1",">=2"),ordered_result = T)->f2
f1=="neutral" # f1>"neutral -> ne dela (delo s stringi)
f2>"1" # Dela (delo z int)
