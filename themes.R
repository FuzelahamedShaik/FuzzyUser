library(ggplot2)
library(ggthemes)
print(ggplot(mtcars,aes(wt,mpg)) + geom_point() + theme_fivethirtyeight())