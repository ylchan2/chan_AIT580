# Rock Chan 
import pandas as pd
from numpy import mean
from numpy import std
from matplotlib import pyplot
from scipy import stats

data = pd.read_csv('EmployeeAttrition.csv')

#print(data.head())

#Check the head of the DataFrame.
print(data.head())

#Q1: Find the number of entries/rows and columns in the data.
print(data.info())

#Q2: What is the average Monthly Income?
print("Average Monthly Income: " + str(data['MonthlyIncome'].mean()))

#Q3: What is the highest amount of HourlyRate ?
print("Highest hourly Rate: " + str(data['HourlyRate'].max()))

#Q4: What is the Department, JobRole, MaritalStatus and OverTime of EmployeeNumber 10?
employee10 = data[data["EmployeeNumber"] == 10]
print("Employee 10:")
print("Department:"+employee10['Department'])
print("Job Role:"+employee10['JobRole'])
print("MaritalStatus:"+employee10['MaritalStatus'])
print("OverTime:"+employee10['OverTime'])

#Q5: What is the Employee ID of highest MonthlyIncome paid employee?
highestMonthly = data[data["MonthlyIncome"] == data["MonthlyIncome"].max()]
print(highestMonthly["EmployeeNumber"])


#Q6: What is the average(mean) DailyRate group by Age for all Employees whose age is greater than 58. (hint: use groupby function)
data[data["Age"] > 58].groupby('Age').DailyRate.mean()

#Q7: How many unique EducationField are there?
print(list(set(data["EducationField"])))

#Q8: What are the top 5 most common JobRole?
print(data['JobRole'].value_counts().head(5))


#Q9: How many JobRoles represented by less than 100 employees?
print("JobRole < 100 :" + str((data['JobRole'].value_counts() < 100).count()))

#Q10: What is the correlation between Education and JobSatisfaction?
pyplot.scatter(data['Education'], data['JobSatisfaction'])
pyplot.show()

print(stats.pearsonr(data['Education'], data['JobSatisfaction']))
# Pearson's r is -0.011296116736573996 and p-value is 0.6652000076112805
# correlation of education and job satisfaction is low.
