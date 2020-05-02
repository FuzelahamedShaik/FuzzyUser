library(ISLR)
species <- iris[,"Species"]
stand.features <- scale(iris[,-5])
var(stand.features[,1])
final.data <- cbind(stand.features,iris[5])

library(caTools)
set.seed(101)
sample <- sample.split(final.data$Species,SplitRatio = 0.7)
test <- subset(final.data,sample==F)
train <- subset(final.data,sample==T)

library(class)
predict.species <- NULL
misserr <- NULL
for(i in 1:15){
  predict.species <- knn(train[,-5],test[,-5],train$Species,k=i)
  misserr[i] <- mean(test$Species != predict.species)
}

library(ggplot2)
k.val <- 1:15
df <- data.frame(k.val,misserr)
pl <- ggplot(df,aes(k.val,misserr)) + geom_point(color="blue",alpha=0.5,size=5) + theme_bw() + geom_line(color="red")
print(pl)

