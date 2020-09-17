#GEO511 Task 1

#Packages - only need simple histogram
install.packages("ggplot2")
library(ggplot2)

#Script - load data, make a histogram
data<-iris
data_PL<-data$Petal.Length
mean_PL<-mean(data_PL)
hist(data_PL, main="Histogram Petal Length", xlab="Petal Length", ylab="# of Petals", border="blue",col="yellow",xlim=c(0,10), ylim=c(0,50),las=1,breaks=10)


#Bonus add mean line to histogram to indicate mean
abline(v=mean_PL,col="red",lwd=2)
