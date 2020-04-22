summer <- function(num1,num2,num3){
  s <- 0
  v <- c(num1,num2,num3)
  for(i in v){
    if(v[i]%%3!=0){
      s <- s+v[i]
    }
  }
  return(s)
}
print(summer(3,3,3))