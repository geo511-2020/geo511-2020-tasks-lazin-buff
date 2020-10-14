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
  filter(!continent=="Antarctica")

object_countries<-as(countries_world,"Spatial")
plot(tmax_month$tmax2)

#gain function

tmax_annual<-max(tmax_month)
plot(tmax_annual)
names(tmax_annual)<-"tmax"

tmax_country=raster::extract(tmax_annual,countries_world,fun=max,na.rm=TRUE,small=TRUE,sp=TRUE)
#st_as_sf(tmax_country)