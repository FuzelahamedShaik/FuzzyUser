library(ISLR)
purchase <- Caravan[,"Purchase"]
standardized.caravan <- scale(Caravan[,-86])

test.index <- 1:1000
test.data <- standardized.caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.caravan[-test.index,]
train.purchase <- purchase[-test.index]

library(class)
set.seed(101)
predicted.purchase <- NULL
error.rate <- NULL
for(i in 1:15){
  predicted.purchase <- knn(train.data,test.data,train.purchase,k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

library(ggplot2)
k.values <- 1:15
error.df <- data.frame(error.rate,k.values)
pl <- ggplot(error.df,aes(k.values,error.rate)) + geom_point(size=5,alpha=0.5,color="blue") + theme_bw() + geom_line(color="black")
print(pl)
