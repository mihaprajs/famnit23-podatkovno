library(tidyverse)
library(ggthemes)
library(extrafont)
library(ggrepel)

loadfonts(device="win")

ggplot(mpg) + 
  geom_bar(aes(y=class)) + 
  facet_wrap(~year) + 
  theme_minimal()+
  theme(text=element_text(family="Times New Roman",
                          size=16),
        axis.text.y=element_text(angle=45,
                                 colour="red"))
p1<-mtcars |>
  mutate(car=row.names(mtcars)) |>
  ggplot()+
  aes(x=mpg,
      y=wt,
      label=car)+
  geom_point(size=2)+
  geom_label_repel()+
  geom_hline(yintercept=4.5,
             linetype="dashed")+
  geom_text(aes(x=27,
                y=5,
                label="Neekonomični avtomobili",
                color="red"))+
  annotate("text",
           x=27,
           y=3,
           label="Ekonomični avtomobili",
           color="green")+
  theme_minimal()

p2<-ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()

p3<-ggplot(mpg) + 
  geom_bar(aes(y=class)) + 
  facet_wrap(~year) + 
  theme_minimal()+
  theme(text=element_text(family="Times New Roman",
                          size=16),
        axis.text.y=element_text(angle=45,
                                 colour="red"))

library(patchwork)

p1/p2/p3

ggsave("izvoz.jpeg",device="jpeg",dpi=600)

p_all <- (p1 | p2) / 
  p3
p_all + plot_layout(guides = 'collect')

library(gganimate)
library(gifski)

graf<-ggplot(economics) + 
  geom_line(aes(x = date, y = unemploy)) + 
  transition_reveal(along = date)
animate(graf, renderer = gifski_renderer())

graf2<-ggplot(mpg) + geom_bar(aes(x = factor(cyl))) + 
  labs(title = 'Number of cars in {closest_state} by number of cylinders') + 
  transition_states(states = year) + enter_grow() + 
  exit_fade()
animate(graf2, renderer = gifski_renderer())

library(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')
