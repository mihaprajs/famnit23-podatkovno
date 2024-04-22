library(tidyverse)
n<-1000
x<-(1:n-1)^((sqrt(5)-1)/2)*cos((1:n-1)*2*pi*(sqrt(5)-1)/2)
y<-(1:n-1)^((sqrt(5)-1)/2)*sin((1:n-1)*2*pi*(sqrt(5)-1)/2)
plot(x,y)
lattice::xyplot(y~x)
df<-data.frame(X=x,Y=y) 
df |> ggplot()+aes(x=X,y=Y)+geom_point()
#paket1: miniUI, esquesse
ggplot(df) +
  aes(x = X, y = Y) +
  geom_point(shape = "circle", size = 1.5, colour = "#112446") +
  theme_minimal()

data.frame(X=x,Y=y) |> ggplot(aes(x=X,y=Y))+geom_point()
data.frame(X=x,Y=y) |> ggplot()+geom_point(aes(x=X,y=Y))

#A2
seq(-pi,pi,0.1) %>% plot(.,sin(.),type="l")

plot(sin,-pi,pi)

seq(-pi,pi,0.1) %>% data.frame(X=.,Y=sin(.)) %>% ggplot()+aes(x=X,y=Y)+geom_line()
# NAriši krožnico s polmerom 1 okoli izhodišča. Dodaj naslov in pre/poimenuj x- in y-os. Nariši še kvadrat na isto sliko.
seq(-pi,pi,0.1) %>% {plot(cos(.),sin(.),type="l",xlab="X-os",ylab="Y-os",main="NASLOV")}

points(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type="l",col="red")

df2<-seq(-pi,pi,0.1) %>%
  {data.frame(X=c(cos(.),c(1,1,-1,-1,1)),
              Y=c(sin(.),c(1,-1,-1,1,1)),
              Tip=rep(c("Krog","Kvadrat"),c(length(.),5)))} 
df2 %>% ggplot()+aes(x=X,y=Y,group=Tip,color=Tip)+geom_path()+labs(x = "x",y = "y",title = "s",subtitle = "ad",caption = "a")

ggplot(df2) + aes(x = X, y = Y) + geom_path(colour = "#112446") + facet_wrap(vars(Tip)) # taka koda se lahko pojavi na izpitu

seq(-pi,pi,0.1) %>% data.frame(Alpha=.,S=sin(.),C=cos(.)) %>% ggplot()+geom_path(aes(x=Alpha,y=S))+geom_path(aes(x=Alpha,y=C))+geom_path(aes(x=C,y=S))

#B
montecarlo<-\(n){
  seq(-pi,pi,0.1) %>% {plot(cos(.),sin(.),type="l",xlab="X-os",ylab="Y-os",main="NASLOV",col="blue")}
  points(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type="l",col="red")
  x<-runif(n,-1,1)
  y<-runif(n,-1,1)
  points(x,y,col=ifelse(x^2+y^2<=1,"darkgreen","purple"))
  4*sum(x^2+y^2<=1)/n
}
start<-Sys.time();montecarlo(1000000);Sys.time()-start
n<-1000
x<-(1:n-1)^((sqrt(5)-1)/2)*cos((1:n-1)*2*pi*(sqrt(5)-1)/2)
y<-(1:n-1)^((sqrt(5)-1)/2)*sin((1:n-1)*2*pi*(sqrt(5)-1)/2)
data.frame(X=x,Y=y) %>% ggplot()+aes(x=X,y=Y,colour=1:1000,size=sqrt(x^2+y^2))+geom_point()+scale_color_gradient(low="#3dad46",high="brown")+scale_size_continuous(range=c(1,3))

#C
iris %>% ggplot()+aes(x=Petal.Length)+geom_histogram()
iris %>% ggplot()+aes(y=Petal.Length,fill=Species)+geom_bar()
iris %>% ggplot()+aes(x=Petal.Length,color=Species)+geom_histogram()
iris %>% filter(Species=="virginica") %>% ggplot()+aes(y=Petal.Length,fill=Species)+geom_bar()

dfB1<-data.frame(labels=c("no","no, but in yellow"),"values"=c(7,1))
ggplot(dfB1, aes(x="", y=values,fill=labels))+
  geom_bar(width = 1, stat = "identity")+coord_polar("y", start=0.2)+
  scale_fill_manual(values=c("blue", "yellow"))+
  #  ggtitle("Is this meme funny?")
  labs(title="Is this meme funny?",x="",y="")+
  theme(plot.title = element_text(size=30),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        legend.title=element_blank(),
        legend.text = element_text(size = 16, face = "bold"))


coeff<-lm(iris$Petal.Width~iris$Petal.Length)
coeff[[1]] # y=kx+n <- output (Intercept)=n, slope=k 
ggplot(iris,aes(Petal.Length,Petal.Width,color=(Petal.Length*coeff[[1]][2]+coeff[[1]][1]>Petal.Width)))+geom_point()+geom_abline(intercept=coeff[[1]][1],slope=coeff[[1]][2])+
  labs(color = "Below the regression line?",title="Is there a correlation between petal length and width?")
