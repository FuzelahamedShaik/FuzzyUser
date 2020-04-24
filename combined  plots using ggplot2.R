library(ggplot2)
#Histogram
pl <- ggplot(mpg,aes(hwy)) + geom_histogram(fill="pink")
print(pl)
#Barplot
pl1 <- ggplot(mpg,aes(manufacturer)) + geom_bar(aes(fill=factor(cyl)))
print(pl1)
#Scatterplot
#txhousing is inbuilt data in ggplot2
pl2 <- ggplot(txhousing,aes(sales,volume)) + geom_point(color="blue",alpha=0.5)
print(pl2 + geom_smooth(color="red"))