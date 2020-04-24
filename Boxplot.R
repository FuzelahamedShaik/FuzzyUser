library(ggplot2)
pl <- ggplot(mtcars,aes(factor(cyl),mpg))
print(pl + geom_boxplot(aes(fill = factor(cyl)))) + theme_clean()