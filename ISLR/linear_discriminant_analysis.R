################## LINEAR DISCRIMINANT ANALYSIS ###################

library(ISLR)
library(MASS)

train = (Year < 2005) # creates a logical vector of the same dimension with 1250 elements. 
Smarket_2005 = Smarket[!train,]
dim(Smarket_2005)
Direction_2005 = Direction[!train]


lda_fit = lda(formula = Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
lda_fit  
plot(lda_fit)


lda_pred = predict(lda_fit, Smarket_2005)
names(lda_pred)


lda_class = lda_pred$class
table(lda_class, Direction_2005)
mean(lda_class == Direction_2005)

# Applying a 50 % threshold to the posterior probabilities allows us to recreate the predictions contained in lda.pred$class
sum(lda_pred$posterior[,1] >= 0.5)
sum(lda_pred$posterior[,1] < 0.5)

lda_pred$posterior[1:20, 1]
lda_class[1:20]



################## QUADRATIC DISCRIMINANT ANALYSIS ###################
qda_fit = qda(formula = Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
qda_fit  
plot(qda_fit)

qda_pred = predict(qda_fit, Smarket_2005)
names(qda_pred)


qda_class = qda_pred$class
table(qda_class, Direction_2005)
mean(qda_class == Direction_2005)


##################   KNN   ###################
# Uses Class library

library(class)
train_X = cbind(Lag1, Lag2)[train,]
test_X = cbind(Lag1, Lag2)[!train, ]
train_Direction = Direction[train]


set.seed(1)
knn_pred = knn(train = train_X, test = test_X, cl=train_Direction, k=1 )
table(knn_pred, Direction_2005)
mean(knn_pred == Direction_2005)


  
# k = 3
knn_pred = knn(train = train_X, test = test_X, cl=train_Direction, k=3 )
table(knn_pred, Direction_2005)
mean(knn_pred == Direction_2005)
