num_check <- function(n,vec){
  for(items in vec){
    if(n == vec[items]){
      return (TRUE)
    }
  }
  return (FALSE)
}
print(num_check(3,c(1,2,3)))