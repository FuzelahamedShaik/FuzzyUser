num_count <- function(n,vec){
  x <- 0
  for(items in vec){
    if(n == vec[items]){
      x <- x+1
    }
  }
  return(x)
}
print(num_count(2,c(1,2,2,4,2,2,2)))