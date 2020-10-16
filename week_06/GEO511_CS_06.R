#Calculate annual maximum temperatures from a monthly spatio-temporal dataset
#Remove Antarctica from the world dataset
#Summarize raster values within polygons
#Generate a summary figure and table.
#Save your script as a .R or .Rmd in your course repository

#initialize
library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

#Data
data_world<-data(world)
tmax_month<-getData(name="worldclim",var="tmax",res=10)
gain(tmax_month)<-.1

countries_world<-world%>%
  filter(!continent=="Antarctica")%>%
  filter(!continent=="Seven seas (open ocean)")

object_countries<-as(countries_world,"Spatial")
plot(tmax_month$tmax2)

tmax_annual<-max(tmax_month)
plot(tmax_annual)
names(tmax_annual)<-"tmax"

tmax_country=raster::extract(tmax_annual,countries_world,fun=max,na.rm=TRUE,small=TRUE,sp=TRUE)
tmax_country_sf=st_as_sf(tmax_country)
tmax_country_sf

tmax_country_map<-ggplot(tmax_country_sf)+
  geom_sf(aes(fill=tmax))+
  scale_fill_viridis_c(name="Annual Maximum\nTemperature °C")+
  theme(legend.position='bottom',legend.title=element_text(size=16,color='orange'))
tmax_country_map

tmax_table<-as.data.frame(tmax_country_sf%>%
  group_by(continent)%>%
  top_n(1,tmax))
keep<-c("name_long","continent","tmax")
tmax_final<-tmax_table[,(names(tmax_table)%in%keep)]%>%
  arrange(desc(tmax))
tmax_final