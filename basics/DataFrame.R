# Title     : TODO
# Objective : TODO
# Created by: rishi
# Created on: 10/18/2020

############# DATAFRAME #########

# Dataframe is like an excel sheet. So, one can have different data types.


#### CREATING DATAFRAME ####
name = c("Dev", "kal", "Anna", "Erik", "Flo", "Xi")
payment = c(100, 200, 150, 50, 75, 100)

debt = data.frame(name, payment)
class(debt)
debt


#### COLUMN NAMES OF DATAFRAME ####
colnames(debt) = c('friend', 'money')
debt

#### ROW NAMES OF DATAFRMAE ####
rownames(debt) = c('a', 'b', 'c', 'd', 'e', 'f')
debt


##### SUBSETTING DATA FRAMES ####
debt[1:2]
debt[1,]
debt[1:4,]



#### SUBSET function ####
# a more powerful function for subsetting
