# -*- coding: utf-8 -*-
"""
Created on Wed May  9 11:26:44 2018

@author: jaypate
"""

#Import require libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Get data from csv file to panda dataframe
df = pd.read_csv("Data.csv")

# Making Dependent variable matrix
X = df.iloc[:,:-1].values 
y = df.iloc[:,-1].values

# Taking care of missing values

# check for missing value
df.apply(lambda x : sum(pd.isnull(x)/len(df)*100))

# Replacing missing value with mean
from sklearn.preprocessing import Imputer

imputer = Imputer(missing_values = 'NaN',strategy = 'mean',axis = 0)
imputer = imputer.fit(X[:,1:3])
X[:,1:3] = imputer.transform(X[:,1:3])

#Encoding categorical data
from sklearn.preprocessing import LabelEncoder

labelencoder_X = LabelEncoder()
X[:,0] = labelencoder_X.fit_transform(X[:,0])

#Onehot Encodeing
from sklearn.preprocessing import OneHotEncoder

onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()

labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)


#Spliting train-test
from sklearn.cross_validation import train_test_split

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size = 0.2,random_state = 42)

#Feature Scaling
from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) 
