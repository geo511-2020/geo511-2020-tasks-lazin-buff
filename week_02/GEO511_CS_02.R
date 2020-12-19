
#initialize GEO511 CS_02 "My grandfather says climate is cooling"

#packages
install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

#data
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.csv"
##needed to rename URL from prompt URL
temp=read.csv(dataurl,skip=1,na="999.90",col_names=c("year","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec","djf","mam","jja","son","metANN"))
##last column kept generating character smudge in header, so went to more specific read.csv below
temp1=read.csv(dataurl,header = TRUE,skip=1,na="999.90",sep=",",col.names=c("YEAR","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC","DJF","MAM","JJA","SON","metANN"))
summary(temp1)
summary(temp1$JJA)

#plot
ggplot(data=temp1,aes(YEAR,JJA))%>%
+geom_line()%>%
+geom_smooth(linetype="dashed",color="red")%>%
+ylab("Mean Summer Temp (C)")%>%
+xlab("Year")%>%
+ggtitle("BuffaloNY_MeanSummerTemps.png",subtitle="Summer includes June, July, August
Data from Global Historical Climate Network
Red line is a LOESS Smooth")

#export
ggsave("GEO511_CS_02.png",plot=last_plot(),device="png",path="/Users/markolazin/Desktop",scale=1)

#extra time
