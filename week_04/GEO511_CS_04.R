#GEO511_CS_04
#initialize

install.packages("tidyverse")
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)

flights<-flights
weather<-weather
planes<-planes
airports<-airports
airlines<-airlines

summary(flights$distance)
summary(flights$air_time)

#Based on Distance
flight_maxD<-flights%>%
  rename("faa"="dest")%>%
  arrange(desc(distance))%>%
  slice(1)
port_maxD<-inner_join(flight_maxD,airports)
port_maxD$name
#Honolulu Intl

#Based on Air Time
flight_maxT<-flights%>%
  rename("faa"="dest")%>%
  arrange(desc(air_time))%>%
  slice(1)
port_maxT<-inner_join(flight_maxT,airports)
port_maxT$name
#Honolulu Intl