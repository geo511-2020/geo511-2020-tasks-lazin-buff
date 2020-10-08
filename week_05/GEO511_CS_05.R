#initialize

install.packages("spData")
install.packages("sf")
install.packages("tidyverse")
install.packages("units")
install.packages("tmap")

library(spData)
library(sf)
library(tidyverse)
library(units)
library(tmap)

#load data

data(world)
data(us_states)
head(world) #name_long
head(us_states) #NAME

albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

can<-world%>%
  filter(name_long=="Canada")
nys<-us_states%>%
  filter(NAME=="New York")

can_trans<-st_transform(can,albers)
world_buffer=st_buffer(can_trans,dist=10000)
nys_trans<-st_transform(nys,albers)
border<-st_intersection(world_buffer,nys_trans)

plot(can_trans)
plot(world_buffer)
plot(border)
st_area(border)

#tried out tmap per recommendation of Collin O'Connor
  tm_graticules(col="green")+
  tm_shape(nys_trans)+
  tm_fill(col="gray")+
  tm_borders(col="black")+
  tm_shape(border)+
  tm_fill(col="red")+
  tm_borders(col="black")+
  tm_layout(main.title="NY Land within 10km",main.title.position="center")+
  tm_compass()
