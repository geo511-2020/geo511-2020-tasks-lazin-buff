install.packages("tidyverse")
install.packages("reprex")
install.packages("sf")
install.packages("spData")

library(tidyverse)
library(reprex)
library(sf)

library(spData)
library(ggplot2)
data(world)

ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)