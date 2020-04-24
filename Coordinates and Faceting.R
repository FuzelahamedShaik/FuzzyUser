library(ggplot2)
pl <- ggplot(mpg,aes(displ,hwy)) + geom_point()
pl2 <-pl + coord_cartesian(xlim=c(1,4),ylim=c(15,30)) + facet_grid(drv ~ cyl)
print(pl2)