library(ggplot2)
library(ggplot2movies)
pl <- ggplot(movies,aes(year,rating))
print(pl + geom_bin2d(binwidth=c(3,1)) + scale_fill_gradient(low="green",high="red"))
pl1 <- ggplot(movies,aes(year,rating))
print(pl1 + geom_hex())
pl2 <- ggplot(movies,aes(year,rating))
print(pl2 + geom_density2d())

#Refer cheat sheet for more geom_