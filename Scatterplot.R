library(ggplot2)
df <- mtcars
pl <- ggplot(df,aes(wt,mpg))
pl2 <- pl + geom_point(aes(color=hp),size=5)
print(pl2 + scale_color_gradient(low="blue",high="red"))