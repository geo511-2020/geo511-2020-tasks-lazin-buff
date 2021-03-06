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

#Actual task

#Based on Distance
flight_maxD<-flights%>%
  rename("faa"="dest")%>%
  filter(origin=="JFK"|origin=="LGA"|origin=="EWR")%>%
  arrange(desc(distance))%>%
  slice(1)
port_maxD<-inner_join(flight_maxD,airports)
port_maxD$name
#Honolulu Intl

#Based on Air Time
flight_maxT<-flights%>%
  rename("faa"="dest")%>%
  filter(origin=="JFK"|origin=="LGA"|origin=="EWR")%>%
  arrange(desc(air_time))%>%
  slice(1)
port_maxT<-inner_join(flight_maxT,airports)
port_maxT$name
#Honolulu Intl

#Added in origin filter per recommendation of Collin O'Connor. Although code produces correct answer, code is non replicable for other cities w/o addition of origin filter.

#Extra Time
airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("world") +
  geom_point(col="red") +
  coord_quickmap()

airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("") +
  geom_point(col="red") +
  coord_quickmap()