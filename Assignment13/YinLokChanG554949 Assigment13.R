###------------------
### Visualization in R and Tableau
#Student Name: Yin Lok Chan 
#GNumber: G00554949 
###------------------

#setwd("~/git/AIT580/")

library(ggplot2)
library(cluster)
rm(list=ls())

data <- read.csv('~/data/EmployeeAttrition.csv')

# 1a
plot(data$TotalWorkingYears ~  data$MonthlyIncome, data = data,col=c("Blue"))
with(data, scatter.smooth(TotalWorkingYears, MonthlyIncome,lpars = list(col = "red", lwd = 3, lty = 3)))
# From total working year from 10 to around 15, the monthly income increase slowly. After 15 years, monthly income increase 
# much faster. 

# 1b
plot(data$Age ~  data$DistanceFromHome, data = data,col=c("Blue"))
with(data, scatter.smooth(Age, DistanceFromHome,lpars = list(col = "red", lwd = 3, lty = 3)))
# There is no difference in ditance from home to work and the employees age. But as we see in the graph, data are everywhere.

#1c
t.test(data$TotalWorkingYears,data$MonthlyIncome)
# We reject the null hypothesis because the P-value (2e-16) is less than the significance level. 
# Therefore, we support the claim that TotalWorkingYears and MonthlyIncome are correlated with each other.

t.test(data$Age,data$DistanceFromHome)
# We fail reject the null hypothesis because the P-value (0.9485) is greater than the significance level. 
# Therefore, we can’t support the claim that Age varies depending on individual’s DistanceFromHome

#1d
summary(lm(TotalWorkingYears ~ MonthlyIncome, data=data))
# We reject the null hypothesis because the P-value (2e-16) is less than the significance level. 
# Therefore, we support the claim that TotalWorkingYears and MonthlyIncome are correlated with each other.

#2a
x <- subset(data, select=c("TotalWorkingYears", "MonthlyIncome"))
cl <- kmeans(x,3)
plot(x,col=cl$cluster)
# cluster 1 is at the lowerer working year and monthly income are low. 
# cluster 2 is at the least 5 to 6 working years and monthly income are at 60000 to 120000.
# cluster 3 is at 8 working year and monthly income are at least 90000.


#2b
d <- subset(data, select=c("TotalWorkingYears", "MonthlyIncome"))
cls <- kmeans(x,5)
d$cluster <- as.character(cls$cluster)
head(d)
ggplot(data=d, aes(x=TotalWorkingYears, y=MonthlyIncome, color=cluster)) + geom_point()
# cluster 1 is from 0 to 20 working years. The monthly income are at maximum 3500.
# Cluster 2 is from 2 to 24 working years. The monhtly income are from 3500 to 6000.
# Cluster 3 is from 6 to 37 working years. The monhtly income are from 6000 to almost 8000.
# Cluster 4 is from 6 to 40 working years. The monhtly income are from 8000 to 14000.
# Cluster 5 is from 9 to 40 working years. The monhtly income are from 14000 to almost 20000.
# The cluster is mainly split by monthly income. Because as we see in the graph the monthly income are more variance.
