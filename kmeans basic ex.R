df1 <- read.csv("winequality-red.csv",sep = ";")
df2 <- read.csv("winequality-white.csv",sep = ";")
df1$label <- sapply(df1$fixed.acidity,function(x){"red"})
df2$label <- sapply(df2$fixed.acidity,function(x){"white"})
wine <- rbind(df1,df2)

library(ggplot2)
pl <- ggplot(wine,aes(residual.sugar)) + geom_histogram(aes(fill=label),color="black") + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
#print(pl)
pl2 <- ggplot(wine,aes(citric.acid)) + geom_histogram(aes(fill=label),color="black") + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
#print(pl2)
pl3 <- ggplot(wine,aes(alcohol)) + geom_histogram(aes(fill=label),color="black") + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
#print(pl3)
pl4 <- ggplot(wine,aes(citric.acid,residual.sugar)) + geom_point(aes(color=label),alpha=0.2) + scale_color_manual(values=c('#ae4554','#faf7ea')) + theme_dark()
#print(pl4)
pl5 <- ggplot(wine,aes(volatile.acidity,residual.sugar)) + geom_point(aes(color=label),alpha=0.2) + scale_color_manual(values=c('#ae4554','#faf7ea')) + theme_dark()
#print(pl5)

library(cluster)
clus.data <- wine[,1:12]
wine.cluster <- kmeans(clus.data,2)
table(wine$label,wine.cluster$cluster)

 











