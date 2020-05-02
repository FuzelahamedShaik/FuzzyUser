library(ISLR)
library(ggplot2)
col <- College
pl <- ggplot(col,aes(Room.Board,Grad.Rate)) + geom_point(aes(color=Private),size=4,alpha=0.5) + theme_bw()
#print(pl)
pl2 <- ggplot(col,aes(F.Undergrad)) + geom_histogram(aes(fill=Private),color="black") + theme_bw()
#print(pl2)
pl3 <- ggplot(col,aes(Grad.Rate)) + geom_histogram(aes(fill=Private),color="black") + theme_bw()
#print(pl3)
col["Cazenovia College",-1] <- 100

library(caTools)
set.seed(101)
sample <- sample.split(col$Private,SplitRatio = 0.7)
train <- subset(col,sample==T)
test <- subset(col,sample==F)

library(rpart)
tree <- rpart(Private ~ .,method = "class",train)
tree.predict <- predict(tree,test)
tree.predict <- as.data.frame(tree.predict)
joiner <- function(x){
  if(x>=0.5){
    return("Yes")
  }else{
    return("No")
  }
}

tree.predict$Private <- sapply(tree.predict$Yes,joiner)
table(test$Private,tree.predict$Private)

library(rpart.plot)
prp(tree)

library(randomForest)
rf.model <- randomForest(Private ~ .,importance=T,train)
#train data confusion
rf.model$confusion
rf.predict <- predict(rf.model,test)
table(rf.predict,test$Private)







