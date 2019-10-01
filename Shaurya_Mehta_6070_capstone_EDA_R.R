require(sqldf)

library(ggplot2)
require(dplyr)
#data %>%summarise_each(funs(n_distinct))
#str(data)


#renewN<-sqldf('select * from data where RENEW = "N" ')
#renewY<-sqldf('select * from data where RENEW = "Y" ')
caps<-read.csv("C://Users/shaur/Downloads/submission.csv",header = TRUE)
require(sqldf)
str(caps)
dim(caps)
caps$WarehouseNo<-as.factor(caps$WarehouseNo)

temp<-sqldf('select WarehouseNo, SUM(DailySalesSell) as DollarS, SUM(DailySalesUnites) as TotalQuantity from caps group by WarehouseNo')
temp
sum(temp$DollarS)
sum(temp$TotalQuantity)
temp$perunit<-(temp$DollarS/temp$TotalQuantity)
sort
cor(temp)

library(psych)
pairs.panels(temp[2:4]) 

temp(temp)
write.csv(temp,file = file.choose(new = T))
