df <- read.csv("bank_note_data.csv")
library(caTools)
set.seed(101)
sample <- sample.split(df$Class,SplitRatio = 0.7)
train <- subset(df,sample==T)
test <- subset(df,sample==F)

library(neuralnet)
nn <- neuralnet(Class ~ Image.Var+Image.Skew+Image.Curt+Entropy,data=train,hidden = c(5,3),linear.output = F)
predicted.nn <- compute(nn,test[1:4])
predictions <- sapply(predicted.nn$net.result,round)
table(predictions,test$Class)

library(randomForest)
df$Class <- factor(df$Class)
set.seed(101)
split <- sample.split(df$Class,SplitRatio = 0.7)
train <- subset(df,split==T)
test <- subset(df,split==F)

rf.model <- randomForest(Class ~ .,train)
rf.predict <- predict(rf.model,test)
table(rf.predict,test$Class)










