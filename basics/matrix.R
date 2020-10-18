# Title     : TODO
# Objective : TODO
# Created by: rishi
# Created on: 10/18/2020

##### Matrix ######
# matrix is a 2-d vector

# Sample matrix
mat = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
mat

####### COLON function #####

a = 1:8 # to create a list of numbers from 1 to 8 inclusive
class(a)
a * 2

###### SEQ function #####

b = seq(1, 10, 2) # creates a sequence from start, to stop , at a step
b # type ?seq to read about the function

# what if nrow and ncol is not given
data = c(1:16)
data.matrix = matrix(data)
data.matrix

# what if byrow is True
data.matrix2 = matrix(data, nrow = 2, byrow = TRUE)
data.matrix2

#### MATRIX COERCEION ####

coerce_mat = matrix(c(2, 3, 4, "hi"), nrow = 2, ncol = 2)
coerce_mat # please note in the console that all data has been coerced into strings

#### CBIND ####

micr = c(59.20, 59.25, 60.22, 59.95)
ebay = c(17.44, 18.32, 19.11, 18.22)

column_combine = cbind(micr,ebay)
column_combine
class(column_combine) # please observe that a matrix is formed

#### RBIND ####

row_combine = rbind(micr, ebay)
row_combine
class(row_combine)




