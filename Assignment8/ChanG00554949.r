###--------------------------------------
#Student Name: Yin Lok Chan 
#GNumber: G00554949 
###--------------------------------------

rm(list=ls())

data <- read.csv('~/data/EmployeeAttrition.csv')

# this is just for testing to use "print" statement.

# a. Find the number of rows and columns in the dataset (5 points)
print(paste("Number of Rows:",nrow(data)))
print(paste("Number of Columns:",ncol(data)))

# b. Find the maximum Age in the dataset (5 points)
print(paste("Max Age:",max(data$Age)))

# c. Find the minimum DailyRate in the dataset (5 points)
print(paste("Miniumn DailyRate:",min(data$DailyRate)))

# d. Find the average/mean MonthlyIncome in the dataset (5 points)
print(paste("Average MonthlyIncome:",mean(data$MonthlyIncome,na.rm=TRUE)))

# e. How many employees rated WorkLifeBalance as 1 (5 points)
print(paste("WorkLifeBalance=1:",length(which(data$WorkLifeBalance == 1))))

# f. What percent of total employees have TotalWorkingYears less than equal to 5? Also calculate the percentage for TotalWorkingYears greater than 5 (5 points)
print(paste("TotalWorkingYear<=five",sprintf("%0.1f%%",length(which(data$TotalWorkingYears <=5))/length(data$TotalWorkingYears)*100)))
print(paste("TotalWorkingYear<=five",sprintf("%0.1f%%",length(which(data$TotalWorkingYears >5))/length(data$TotalWorkingYears)*100)))

# g. Print EmployeeNumber, Department and MaritalStatus for those employees whose Attrition is Yes and RelationshipSatisfaction is 1 and YearsSinceLastPromotion is greater than 3 (10 points)
print(subset(data,Attrition=="Yes" & RelationshipSatisfaction == 1 & YearsSinceLastPromotion >=3, select=c(EmployeeNumber,Department,MaritalStatus)))

# h. Find the mean, median, mode, standard deviation and frequency distribution of EnvironmentSatisfaction for males and females separately. (Hint: For frequency distribution use table() function (10 points)
datamale = subset(data,Gender=="Male",select="EnvironmentSatisfaction")
print(paste("Male Mean:",mean(datamale$EnvironmentSatisfaction)))
print(paste("Male Median:",median(datamale$EnvironmentSatisfaction)))
print(paste("Male Mode:",unique(datamale$EnvironmentSatisfaction)))
print(paste("Male Standard Deviation:",sd(datamale$EnvironmentSatisfaction)))
transform(table(datamale$EnvironmentSatisfaction))

datamale = subset(data,Gender=="Female",select="EnvironmentSatisfaction")
print(paste("Female Mean:",mean(datamale$EnvironmentSatisfaction)))
print(paste("Female Median:",median(datamale$EnvironmentSatisfaction)))
print(paste("Female Mode:",unique(datamale$EnvironmentSatisfaction)))
print(paste("Female Standard Deviation:",sd(datamale$EnvironmentSatisfaction)))
transform(table(datamale$EnvironmentSatisfaction))


dataa <- read.csv('~/data/Acme.csv')

# 1.Identify data types for each attribute in the dataset
print(paste("Type of Year:",typeof((dataa$Year))))
print(paste("Type of StSalary:",typeof((dataa$StSalary))))
print(paste("Type of Gender:",typeof((dataa$Gender))))
print(paste("Type of Degree:",typeof((dataa$Degree))))

# 2.Produce a summary statistic for each attribute in the dataset
summary(dataa)


# 3.Produce visualizations for each attribute (Hint: use hist() function) 
hist(dataa$Year)
hist(dataa$StSalary)
hist(as.numeric(dataa$Gender))
hist(as.numeric(dataa$Degree))

# 4a Years of Experience and Starting Salary for all employees 
plot(dataa$Year ~ dataa$StSalary, data = dataa)

# 4b Years of Experience and Starting Salary for each gender
xlim <- range(c(dataa$StSalary))
ylim <- range(c(dataa$Years))

dataam = subset(dataa,Gender=="M")
print(dataam)
plot(dataam$Year ~ dataam$StSalary , data = dataam,col=c("Blue"))

dataaf = subset(dataa,Gender=="F")
points(dataaf$Year ~ dataaf$StSalary , data = dataaf,col=c("Red"), xlim=xlim, ylim=ylim)


legend("topleft",         
       legend = c("Female", "Male"),
       col = c("red", "Blue"),
       pch = c(16, 8))



# 4c Years of Experience and Starting Salary for each degree 
xlim <- range(c(dataa$StSalary))
ylim <- range(c(dataa$Years))

dataabs = subset(dataa,Degree=="BS")
plot(dataabs$Year ~ dataabs$StSalary , data = dataam,col=c("Red"), xlim=xlim, ylim=ylim)
lines(dataabs$Year,dataabs$StSalary,col="Red" )

dataams = subset(dataa,Degree=="MS")
points(dataams$Year ~ dataams$StSalary , data = dataam,col=c("Blue"))
lines(dataams$Year,dataams$StSalary,col="Blue" )

dataaphd = subset(dataa,Degree=="PhD")
points(dataaphd$Year ~ dataaphd$StSalary , data = dataam,col=c("Green"))
lines(dataaphd$Year,dataaphd$StSalary,col="Green" )

legend("topleft",         
       legend = c("BS", "MS","PhD"),
       col = c("Red", "Blue","Green"),
       pch = c(16, 8))


# 5a Is the correlation different for each gender? 
xlim <- range(c(dataa$StSalary))
ylim <- range(c(dataa$Years))

dataam = subset(dataa,Gender=="M")
plot(dataam$Year ~ dataam$StSalary , data = dataam,col=c("Blue"))
abline(lm(dataam$Year ~ dataam$StSalary), col = "Blue", lwd = 3)
dataaf = subset(dataa,Gender=="F")
points(dataaf$Year ~ dataaf$StSalary , data = dataaf,col=c("Red"), xlim=xlim, ylim=ylim)
abline(lm(dataaf$Year ~ dataaf$StSalary), col = "Red", lwd = 3)

legend("topleft",         
       legend = c("Female", "Male"),
       col = c("red", "Blue"),
       pch = c(16, 8))


# 5b Is the correlation different for each degree? 
xlim <- range(c(dataa$StSalary))
ylim <- range(c(dataa$Years))

dataabs = subset(dataa,Degree=="BS")
plot(dataabs$Year ~ dataabs$StSalary , data = dataam,col=c("Red"), xlim=xlim, ylim=ylim)
lines(dataabs$Year,dataabs$StSalary,col="Red" )
abline(lm(dataabs$Year ~ dataabs$StSalary), col = "red", lwd = 3)

dataams = subset(dataa,Degree=="MS")
points(dataams$Year ~ dataams$StSalary , data = dataam,col=c("Blue"))
lines(dataams$Year,dataams$StSalary,col="Blue" )
abline(lm(dataams$Year ~ dataams$StSalary), col = "Blue", lwd = 3)

dataaphd = subset(dataa,Degree=="PhD")
points(dataaphd$Year ~ dataaphd$StSalary , data = dataam,col=c("Green"))
lines(dataaphd$Year,dataaphd$StSalary,col="Green" )
abline(lm(dataaphd$Year ~ dataaphd$StSalary), col = "Green", lwd = 3)

legend("topleft",         
       legend = c("BS", "MS","PhD"),
       col = c("Red", "Blue","Green"),
       pch = c(16, 8))



