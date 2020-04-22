bar_count <- function(load){
  amount.of.ones <- load%%5
 amount.of.fives <- round(load/5)
  print(amount.of.ones+amount.of.fives)
}
bar_count(17)