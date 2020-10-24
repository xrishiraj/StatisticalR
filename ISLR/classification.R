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


