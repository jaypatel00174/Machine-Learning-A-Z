# Data Preprocessing

database = read.csv('Data.csv') 

#Check if we have null values in dataset
summary(database)

# replace null values with mean
database$Age = ifelse(is.na(database$Age),
                      ave(database$Age,FUN = function(x) mean(x,na.rm = TRUE)),
                      database$Age)
database$Salary = ifelse(is.na(database$Salary),
                         ave(database$Salary,FUN = function(x) mean(x,na.rm = TRUE)),
                         database$Salary)

#Encoding catagorical data

database$Country = factor(database$Country,
                          levels = c("France","Spain","Germany"),
                          labels = c(1,2,3))
database$Purchased = factor(database$Purchased,
                            levels = c("Yes","No"),
                            labels = c(1,0))

# Train-test split
# we will use caTools package for that let's install first
#install.packages(caTools)

#selecting library first
library(caTools)

set.seed(45)
#define split
split = sample.split(database$Purchased,SplitRatio = 0.8)

# Making actual split in train test
training_set = subset(database, split==TRUE)
test_set = subset(database,split==FALSE)

#Scaling Features
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])