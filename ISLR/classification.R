# Title     : TODO
# Objective : TODO
# Created by: rishi
# Created on: 10/18/2020


library(ISLR)
names(Smarket) # names of the features


dim(Smarket) #dimensions
summary(Smarket) # summary in quartiles
head(Smarket)
pairs(Smarket) # plots matrix of scatterplot. For logical and factor columns are
# are converted into numeric in the same way as data.matrix does.

cor(Smarket[,-9]) # correlation after subsetting the factor column - up/down 

attach(Smarket) # this tell R to look first the Smarket data for any upcoming variable or feature
plot(Volume) # plotting the volume of stocks traded


################## Logistic Regeression ###################
# glm: glm is used to fit generalized linear models, specified by giving a 
# symbolic description of the linear predictor and a description of the error 
# distribution.

# family attribute in the glm() function means the description of the error distribution and link function to be used in the model. 
# binomial(link = "logit")
# gaussian(link = "identity")
# Gamma(link = "inverse")
# inverse.gaussian(link = "1/mu^2")
# poisson(link = "log")
# quasi(link = "identity", variance = "constant")
# quasibinomial(link = "logit")
# quasipoisson(link = "log")

glm_logistic_reg = glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
               data = Smarket, family = binomial)
summary(glm_logistic_reg)
coef(glm_logistic_reg) # accessing only the coefficients that is intercept and betas
summary(glm_logistic_reg)$coef
summary(glm_logistic_reg)$coef[, 4] # accessig only the p values

#################### predict() ##########################
# The predict() function can be used to predict the probability that the market will go up, given values of the predictors. The type="response"
# option tells R to output probabilities of the form P(Y = 1|X), as opposed to other information such as the logit. 

# If no data set is supplied to the predict() function, then the probabilities are computed for the training
# data that was used to fit the logistic regression model

glm_prob = predict(glm_logistic_reg, type = 'response')
glm_prob[1:10]


contrasts(Direction) # contrasts() function indicates that R has created a dummy variable with a 1 for Up
glm_pred = rep('Down', times= 1250)
glm_pred[glm_prob > 0.5] = 'Up'


table(glm_pred, Direction) # used to produce a confusion matrix in order to determine how many observations were correctly or incorrectly classified.
# Diagonal elements are correct predictions. That is when it was Down, and was predicted Down

(145 + 507)/1250
mean(glm_pred == Direction) # thing inside the function creates a logical vector where R automatically assigns the Factor as True and False for up and down respectively

# Since, above prediction was based not on any new data, prediction cannot be assumed to show the true picture.

train = (Year < 2005) # creates a logical vector of the same dimension with 1250 elements. 
Smarket_2005 = Smarket[!train,]
dim(Smarket_2005)
Direction_2005 = Direction[!train]


# We now fit a logistic regression model using only the subset of the observations that correspond to dates before 2005, using the subset argument. We then obtain predicted 
# probabilities of the stock market going up for each of the days in our test set—that is, for the days in 2005

glm_subset_log_reg = glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
                         data = Smarket, family = binomial, subset = train)
glm_subset_prob = predict(glm_subset_log_reg, Smarket_2005, type = 'response')


glm_subset_pred = rep('Down', 252)
glm_subset_pred[glm_subset_prob > 0.5] = 'Up'
table(glm_subset_pred, Direction_2005)
(77+44)/252
mean(glm_subset_pred == Direction_2005)

##### Refitting logistic regression with a few number of features ####

glm_subset_log_reg = glm(formula = Direction ~ Lag1 + Lag2,
                         data = Smarket, family = binomial, subset = train)
glm_subset_prob = predict(glm_subset_log_reg, Smarket_2005, type = 'response')


glm_subset_pred = rep('Down', 252)
glm_subset_pred[glm_subset_prob > 0.5] = 'Up'
table(glm_subset_pred, Direction_2005)

mean(glm_subset_pred == Direction_2005)

### Prediciting with particular lag vaues ###
predict(glm_subset_log_reg, newdata = data.frame(Lag1 = c(1.2, 1.5), Lag2 = c(1.1, -0.8)),
        type = 'response')
