prime_check <- function(val){
  if(val==2){
    return(TRUE)
  }
  for(i in 2:(val-1)){
    if(val%%i==0){
      return(FALSE)
    }
  }
  return(TRUE)
}
print(prime_check(75))