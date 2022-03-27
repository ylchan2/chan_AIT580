###------------------
###Hypothesis Testing
#Student Name: Yin Lok Chan 
#GNumber: G00554949 
###------------------

#setwd("~/git/AIT580/")

rm(list=ls())

data <- read.csv('~/data/EmployeeAttrition.csv')


# Your hypothesis testings here...

#1. If the MonthlyIncome of Males is greater than Females (5 points) 
males = subset(data,Gender=="Male")
females = subset(data,Gender=="Female")
t.test(males$MonthlyIncome,females$MonthlyIncome,alternative = "greater",paired =FALSE, conf.level = 0.95)
# We fail reject the null hypothesis because the P-value (0.8891) is greater than the significance level. 
# Therefore, we can’t support the claim that MonthlyIncome of Males is greater than Females.

#2. If the WorkLifeBalance of Males is less than Females (5 points) 
males = subset(data,Gender=="Male")
females = subset(data,Gender=="Female")
t.test(males$WorkLifeBalance,females$WorkLifeBalance,alternative = "less",paired =FALSE, conf.level = 0.95)
# We fail reject the null hypothesis because the P-value (0.4577) is greater than the significance level. 
# Therefore, we can’t support the claim that WorkLifeBalance of Males is less than Females.

#3. If the YearsAtCompany of Single is less than Married (5 points) 
singles = subset(data,MaritalStatus=="Single")
marrieds = subset(data,MaritalStatus=="Married")
t.test(singles$YearsAtCompany,marrieds$YearsAtCompany,alternative = "less",paired =FALSE, conf.level = 0.95)
# We reject the null hypothesis because the P-value (0.004973) is less than the significance level. 
# Therefore, we support the claim that YearsAtCompany of Single is less than Married.

#4. If the EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No (5 points) 
attyes = subset(data,Attrition=="Yes")
attno = subset(data,Attrition=="No")
t.test(attyes$EnvironmentSatisfaction,attno$EnvironmentSatisfaction,alternative = "less",paired =FALSE, conf.level = 0.95)
# We reject the null hypothesis because the P-value (0.0001046) is less than the significance level. 
# Therefore, we support the claim that EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No.

#5. If the MonthlyIncome of Manager is greater than Laboratory Technician (Hint: Use JobRole to find Manager and Laboratory Technician) (5 points)
manager = subset(data,JobRole=="Manager")
labtech = subset(data,JobRole=="Laboratory Technician")
t.test(manager$MonthlyIncome,labtech$MonthlyIncome,alternative = "greater",paired =FALSE, conf.level = 0.95)
# We reject the null hypothesis because the P-value (2.2e-16) is less than the significance level. 
# Therefore, we support the claim that MonthlyIncome of Manager is greater than Laboratory Technician.

#6. If YearsAtCompany and DailyRate are correlated with each other (5 points)
summary(lm(YearsAtCompany ~ WorkLifeBalance, data=data))
# We fail reject the null hypothesis because the P-value (0.643) is greater than the significance level. 
# Therefore, we can’t support the claim that YearsAtCompany and DailyRate are correlated with each other.

#7. If YearsAtCompany and MonthlyIncome are correlated with each other (5 points)
summary(lm(YearsAtCompany ~ MonthlyIncome, data=data))
# We reject the null hypothesis because the P-value (2.2e-16) is less than the significance level. 
# Therefore, we support the claim that YearsAtCompany and MonthlyIncome are correlated with each other.


#8. If YearsAtCompany varies depending on individual’s MaritalStatus (5 points)
summary(aov(YearsAtCompany ~ MaritalStatus, data=data))
# We reject the null hypothesis because the P-value (0.0247) is less than the significance level. 
# Therefore, we support the claim that YearsAtCompany varies depending on individual’s MaritalStatus.

#9. If MonthlyIncome varies depending on individual’s PerformanceRating (5 points)
summary(aov(YearsAtCompany ~ PerformanceRating, data=data))
# We fail reject the null hypothesis because the P-value (0.895) is greater than the significance level. 
# Therefore, we can’t support the claim that MonthlyIncome varies depending on individual’s PerformanceRating.

#10. If MonthlyIncome varies depending on individual’s WorkLifeBalance (5 points)
summary(aov(YearsAtCompany ~ WorkLifeBalance, data=data))
# We fail reject the null hypothesis because the P-value (0.643) is greater than the significance level. 
# Therefore, we can’t support the claim that MonthlyIncome varies depending on individual’s WorkLifeBalance.
