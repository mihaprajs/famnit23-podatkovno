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
  geom_point(size=3,shape=if_else(faithful$eruptions<3,15,17),alpha=0.6)

# naloga2
ggplot(faithful) + 
  geom_histogram(aes(x = eruptions,
                     fill = eruptions<3))

  # naloga3
ggplot(faithful,aes(x=eruptions,fill=waiting<60))+
  geom_histogram(position="dodge")

  # naloga4
ggplot(faithful,aes(x = eruptions, y = waiting)) + 
  geom_point()+
  geom_vline(xintercept = 3,
             linetype=3,
             color="red",
             size=2)+
  geom_abline(intercept=40,
              slope=10)

  # statistics
df<-mpg |>
  dplyr::select(class) |>
  summarise(stevilo=n(),
            .by="class")

ggplot(mpg)+
    geom_bar(aes(x=class))

ggplot(df,aes(x=class,y=stevilo))+
  geom_bar(stat="identity")

    # naloga5
ggplot(mpg,aes(x = class, y = hwy)) + 
  geom_jitter(width = 0.2)+
  stat_summary(aes(x = class, y = hwy),
               fun="mean",
               color="red",
               size=1.1)+
  stat_summary(aes(x = class, y = hwy),
               fun="median",
               color="blue",
               size=1.1)

  # Stats
ggplot(mpg, aes(x = displ, 
                y = hwy, 
                colour = class)) + 
  geom_point()

  # naloga6
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, colour = class)) + 
  scale_colour_brewer(type = 'qual',
                      palette="Set1")

  # naloga7
ggplot(mpg) + 
  geom_point(aes(x = displ,
                 y = hwy,
                 colour = class,
                 size = 1)) + 
  scale_colour_brewer(type = 'qual',
                      palette="Set1")+
  scale_size_continuous(range = c(4,8))


ggplot(mpg)+
  geom_point(aes(x=displ,y=hwy))+
  facet_wrap(~ class,scale="free")
ggplot(mpg) + 
  geom_bar(aes(y = manufacturer)) + 
  facet_grid(class ~ .,
             scale="free",
             space="free")
ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  scale_y_continuous(limits = c(0, 40))
ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  coord_cartesian(ylim = c(0, 30))
df1<-mpg |>
  count(class)
ggplot(df) +
  geom_bar(aes(x=reorder(class,n),y=n),
           stat="identity") +
  coord_polar(theta='y') +
  expand_limits(y=70)
ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  coord_polar(theta = 'y') + 
  expand_limits(y = 70)
