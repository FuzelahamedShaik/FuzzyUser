x <- c(3,7,1)
if(x[1]<x[2]){
  temp = x[1]
  x[1] = x[2]
  x[2] = temp
}else if(x[1]<x[3]){
  temp1 = x[1]
  x[1] = x[3]
  x[3] = temp1
}else if(x[2]<x[3]){
  temp2 = x[2]
  x[2] = x[3]
  x[3] = temp2
}  
print(x)