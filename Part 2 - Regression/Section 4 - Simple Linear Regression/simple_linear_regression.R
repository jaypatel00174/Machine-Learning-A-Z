# Simple Linear Regression

# Importing Dataset
database = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
library(caTools)
split = sample.split(database$Salary,SplitRatio = 2/3)
training_set = subset(database,split==TRUE)
test_set = subset(database,split==FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience, data=training_set)

# Predicting the Test set results
y_pred = predict(regressor,newdata = test_set)