library(ggplot2)
df<-mpg
pl <- ggplot(df,aes(class))
pl2 <- pl + geom_bar(aes(fill=drv),position="stack")
print(pl2)