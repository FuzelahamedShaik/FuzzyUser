loan <- read.csv("loan_data.csv")
loan$inq.last.6mths <- factor(loan$inq.last.6mths)
loan$delinq.2yrs <- factor(loan$delinq.2yrs)
loan$pub.rec <- factor(loan$pub.rec)
loan$not.fully.paid <- factor(loan$not.fully.paid)
loan$credit.policy <- factor(loan$credit.policy)

library(ggplot2)
pl <- ggplot(loan,aes(fico)) + geom_histogram(aes(fill=not.fully.paid),color="black") + theme_bw()
#print(pl)
pl1 <- ggplot(loan,aes(factor(purpose))) + geom_bar(aes(fill=not.fully.paid),position = "dodge") + theme_bw()
#print(pl1)
pl2 <- ggplot(loan,aes(int.rate,fico)) + geom_point(aes(color=not.fully.paid),alpha=0.5) + theme_bw()
#print(pl2)

library(caTools)
set.seed(101)
sample <- sample.split(loan$not.fully.paid,SplitRatio = 0.7)
train <- subset(loan,sample==T)
test <- subset(loan,sample==F)

library(e1071)
model <- svm(not.fully.paid ~ .,train)
loan.predict <- predict(model,test[1:13])
table(loan.predict,test$not.fully.paid)

tune.results <- tune(svm,train.x=not.fully.paid~., data=train,kernel='radial',ranges=list(cost=c(100,200), gamma=c(0.1)))
tuned.model <- svm(not.fully.paid ~ .,train,cost=100,gamma=0.1)
tuned.predict <- predict(tuned.model,test[1:13])
table(tuned.predict,test$not.fully.paid)










