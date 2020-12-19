#GEO511_CS_03

#initialize
install.packages("gapminder")
library(gapminder)
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

#1
data<-as.data.frame(gapminder)
dataNoKuw8<-filter(data,country!='Kuwait')

#2
Q2<-ggplot(dataNoKuw8,aes(x=lifeExp,y=gdpPercap,color=continent,size=pop/100000,scale_y_continuous(trans="sqrt")))%>%
  +geom_point()+
  theme_bw()+
  facet_wrap(~year,nrow=1)+
  labs(x='Life Expectancy', y= 'GDP per capita', size='Population (100K)', color='Continent')
Q2

#3
CnYrNoKuw8<-dataNoKuw8%>%group_by(continent,year)
gapminder_continent<-summarize(CnYrNoKuw8,gdpPercapweighted=weighted.mean(x=gdpPercap,w=pop),pop=sum(as.numeric(pop)))
  
#4
Q4<-ggplot(dataNoKuw8,aes(x=year,y=gdpPercap,color=continent,group=country,scale_y_continuous(trans="sqrt")))+
  #load data and aesthetic into ggplot visual)
  theme_bw()+
  geom_point(aes(size=pop/100000))+
  geom_line(alpha=.5)+
  #make the lines a little transparent
  geom_line(data=gapminder_continent,aes(x=year,y=gdpPercapweighted,alpha=.5),inherit.aes=FALSE)+
  #incorporate continent agregate links and nodes
  scale_alpha_continuous(guide='none')+
  #need this or alpha will appear in labels
  geom_point(data=gapminder_continent,aes(size=pop/100000,x=year,y=gdpPercapweighted),inherit.aes=FALSE)+
  facet_wrap(~continent,nrow=1)+
  labs(x='Year', y= 'GDP per capita', size='Population (100K)', color='Continent')
Q4

#5
Q2
ggsave("GEO511_CS03_P1.png",plot=last_plot(),device="png",path="/Users/free/Desktop",width=15,)
Q4
ggsave("GEO511_CS03_P2.png",plot=last_plot(),device="png",path="/Users/free/Desktop",width=15,)