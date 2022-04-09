###--------------------------------------
#Student Name: Yin Lok Chan 
#GNumber: G00554949 
#Assigment 11
###--------------------------------------

rm(list=ls())

data <- read.csv('~/data/EmployeeAttrition.csv')

# this is just for testing to use "print" statement.

# Create Histogram for Age using R
hist(data$Age)
# Most of the people age in employee Attrition are in 30 to 35 range. 
# The mimimum age are from 15 to 20. The maximum age are below 60. 

# Create Scatter Plot for Age and Monthly Income using R

plot(data$MonthlyIncome ~  data$Age, data = data,col=c("Blue"))
# As we see from the graph, as age increase, the monthly income salary is more variance. 
# At lower age than 30, most of the people have low monthly income. After age of 40, the income can be max out.