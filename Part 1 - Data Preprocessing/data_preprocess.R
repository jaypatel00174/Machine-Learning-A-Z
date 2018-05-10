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


