# Title     : TODO
# Objective : TODO
# Created by: rishi
# Created on: 10/18/2020

########## INSTALLING LIBRARIES #########

# Step 1: To find the name of the library(package).
# step 2:
install.packages("quantmod")
# step 2(alternate): Go to Packages menu and click Install icon. Type package name
# step 3:Installing means downloading it somwhere, but we need to call the package
# into this script so that we can use. We need to call it everytime for seprate scripts
# step 4:
library(quantmod)

########## IMPORTING DATA ####

# Importing from Yahoo
apple.data = getSymbols(Symbols = 'AAPL', src = 'yahoo')
head(apple.data)


# Importing from Google
facebook.data = getSymbols(Symbols = 'FB', src= 'google')
head(facebook.data)

data = getSymbols("SPY", from = "2000-01-01", to = "2016-06-30",
                  src =  "yahoo", adjust =  TRUE)
