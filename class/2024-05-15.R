index<-data.frame(year=factor(2007:2016),
                  pop=sample(10000:20000, size=10))
index

  # base graphics
plot(index$year,
     index$pop,
     main="populacija skozi leto",
     ylab="Populacija",
     xlab="Leto")

  # lattice
library(lattice)
barchart(pop~year,
         data=index,
         main="populacija skozi leto",
         ylab="Populacija",
         xlab="Leto")
index1<-data.frame(year=2007:2016,
                  pop=sample(10000:20000, size=10))

xyplot(pop~year,
       data=index,
       main="populacija skozi leto",
       ylab="Populacija",
       xlab="Leto")

xyplot(mpg~wt|as.factor(cyl),data=mtcars)

  # ggplot2
library(tidyverse)
ggplot(faithful)+
  aes(y=waiting,
      x=eruptions)+
  geom_point()

ggplot(faithful)+
  geom_point(aes(y=waiting,
                 x=eruptions))

ggplot(faithful,aes(y=waiting,
                    x=eruptions,
                    colour=eruptions<3))+
  geom_point()

dfe<-faithful |>
  mutate(color=if_else(eruptions<3,T,F))
ggplot(dfe,aes(y=waiting,
                    x=eruptions,
                    colour=color))+
  geom_point()

ggplot(data=faithful,
       mapping=aes(x=eruptions,
                   y=waiting))+
  geom_density_2d()+
  geom_point()


  # naloga1
ggplot(faithful,aes(x = eruptions, y = waiting)) + 
  geom_point(size=3,shape=15,alpha=0.2)

ggplot(faithful,aes(x = eruptions, y = waiting)) + 
  geom_point(size=3,shape=if_else(faithful$eruptions<3,15,1),alpha=0.2)
