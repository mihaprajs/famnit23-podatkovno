# A
a<-3+5-10
a=3+5-10
3+5-10->a
a
4^5 #or 4**5
log(3*4) # ln(3*5) ne dela
exp(1)
sin(pi)
0.00000000000000012246
0.00000000000000012246
0.00000000000000012246==0
sqrt(4)/log10(100)
abs(-10)+floor(4.6)+ceiling(3.2)
# B
c("miza","stol","omara","okno")->v0
v0
v0[1]
v0[4]
v0[4]<-"polica"
v0[4]
v0
v1<-c(1,4,3,15,75)
v2<-c(5,6,0,sqrt(2),-4)
v1;v2
v1+3->v1
v2*2->v2
v1+v2
c(1,2,3)+c(10,20)
c(1,2,3)+c(10,20) # Seštevanje 2 različno dolgih vektorjev povzroči warning!
c(1,2,3,4)+c(10,20)
v1;v2
v1*v2
sum(v1*v2)
v1;v2
c(v1,v2)
length(c(v1,v2))
# C
c(1,"a",TRUE) # T ali TRUE / F ali FALSE dela
# v vektrojih se vse vrednosti spremenijo v isti tip
c(1,F)
v->c(1:100)
1:100
1:100->v
v
sum(v)
sum(1:10000)
sum(v*v)
v*v
sum(v)/length(v)
mean(v)
min(v)
max(v)
letters
letters[3]
letters[c(3,2,5)]
letters[5:10]
letters[-3] # vrne vse vrednosti na indexih razen 3 indexa
letters[-1:-10]
letters[c(1,-2)]
letters[26]
letters[27] # letters[27] -> OUTPUT: NA
v[-1:-70]<-0
v
v[-1:-100:5]<--1
v[1:100:5]<--1
v[1:20*-5]<-(-1)
v
v[1:20*-5]<-(-1) # Zamenja vse razen 5ih vrednosti na -1
v
seq(-5,-100,-5)
# D
seq(100:1)
c(seq(100,1))->v3
v3
c(seq(-100,-1))->v4
v4
c(seq(-50,1000,10))->v5
v5
c(seq(1,106,3))->v6
v6
# E
list(1,"a",T)->l1
l1
list(2,3,2,"banana",1:10)->l2
l2
l1[[2]]
l1[2]
l1[2] # za pridobiti podseznam
l1
l1[2:3]
l1[[2]]<-"A"
l3<-c(l2,l1) # seznam z 2 podseznamoma
l3.2<-list(l2,l1) # seznam z 2 elementoma, ki sta podseznama
l3.3<-l2;l2[[6]]<-l1
l3[[4]]
l3.3<-l2;l2[[6]]<-l1
l3.2[[1]][[4]]
l2[[5]][4]
l4<-list("pivo",4.3,l1,"KOPER",l2)
l4[[3]][[3]]<--2
l4
l5<-list(4,5.3,1.4,0,-3,3,3)
sum(l5)
sum(unlist(l5))
# F
matrix(1,4,3)
matrix(c(1,0,0,0),4,4)
matrix(c(1,0,0,0,0),4,4)
matrix(c(1,0,0,0,0),4,4)
m2<-matrix(9:1,3,3)
m2
m2<-matrix(9:1,3)
m2
m1<-matrix(1:9,3,,T)
m1
m3<-matrix(1:4,2,6)
m3
?matrix
matrix(1:9,3,T)
matrix(1:9,3,byrow = T)
m1*3->m1
m1
m1+m2
m3-10
m1*3->m1
m1
cbind(m1, m2)
rbind(cbind(m1, m2),m3)
m1^2
m1 %*% m1 # množenje matrik
m1
m1^2
dim(m3)[2]
nrow(m3)
ncol(m3)
m1/3->m1
m1[2,1]
m1[2,1]<--1
m1[2,1]
m2[1:3,2]
m2[]
m2[,2]
m2[,2,drop=F]

# 15.3.2024
m2[1:2,2:3]
m2[-3,-1]
m2[c(T,T,F),c(F,T,T)] # dostopanje z logičnimi vrednostmi (F -ne vrne stolpca, T -vrne stolpec)
m2[1:2,2:3] <- 0
m2
m1[1,,drop=F]
m1[-1,]<--5
m4<-matrix(c("a","b","c","d"),2,2)
m4
m4<-matrix(c("a","b","c","d"),2,2,byrow = T)
m4
matrix(letters[1:4],2,2,byrow = T)
m3
cbind(m4,m3)
m4;m3;cbind(m4,m3) # ko zdužimo matriko char in int vse vrednosti postanjeo char
