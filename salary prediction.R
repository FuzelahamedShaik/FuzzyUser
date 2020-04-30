sal <- read.csv("adult_sal.csv")
library(dplyr)
#table(sal$type_employer)
sal <- select(sal,-X)

unemp <- function(job){
  job <- as.character(job)
  if (job=='Never-worked' | job=='Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}
sal$type_employer <- sapply(sal$type_employer,unemp)

group_emp <- function(job){
  if(job=="Local-gov" | job=="State-gov"){
    return("SL-gov")
  }else if(job=="Self-emp-not-inc" | job=="Self-emp-inc"){
    return("self-emp")
  }else{
    return(job)
  }
}
sal$type_employer <- sapply(sal$type_employer,group_emp)

group_marital <- function(mar){
  mar <- as.character(mar)
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
  }else if(mar=='Never-married'){
    return(mar)
  }else{
    return('Married')
  }
}
sal$marital <- sapply(sal$marital,group_marital)
#table(sal$marital)

Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')
group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}
sal$country <- sapply(sal$country,group_country)

sal$type_employer <- sapply(sal$type_employer,factor)
sal$marital <- sapply(sal$marital,factor)
sal$country <- sapply(sal$country,factor)


library(Amelia)
sal[sal=="?"] <- NA
missmap(sal,y.at = c(1),y.labels = c(" "),col=c("yellow","black"))
sal <- na.omit(sal)
sal <- rename(sal,region=country)

library(ggplot2)
pl <- ggplot(sal,aes(age)) + geom_histogram(aes(fill = income),color="black",binwidth = 1) + theme_bw()
pl1 <- ggplot(sal,aes(hr_per_week)) + geom_histogram(aes(fill=income),color="black") + theme_bw()
pl2 <- ggplot(sal,aes(region)) + geom_bar(aes(fill=income),color='black') + theme_bw()


library(caTools)
set.seed(101)
sample <- sample.split(sal,SplitRatio = 0.7)
train <- subset(sal,sample==T)
test <- subset(sal,sample==F)

model <- glm(income ~ .,family = binomial(link = "logit"),train)
new.step.model <- step(model)
test$predict.income <- predict(model,newdata = test,type="response")

table(test$income,test$predict.income>0.5)

acc <- (7105+1542)/(7105+1542+573+1019)
recall <- (7105)/(7105+573)
pre <- (7105)/(7105+1019)















