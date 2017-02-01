# Script to calculate everything about the parabolic
# shot without friction and in International System of Units

# Inputs of the function are:
# a) initial velocity vo
# b) shot angle alfa

# Parameter
# g) gravity acceleration g = 9.81 m/s^2

# The outputs of the function are:
# T_1: ascending time
# T_2: descending time
#   H: maximum height
#   Tt: total time
#   L: maximum horizontal range


parabolic <- function(vo, alpha){
  
  g <- 32.174  # feet per second squared
  an <- round((2*pi*alpha)/360,2)
  T_1 <- round(vo*sin(an)/g,2)
  H <- round((vo^2)*(sin(an)^2)/(2*g),2)
  T_2 <- round(vo*sin(an)/g,2)
  T_t <- round(2*vo*sin(an)/g,2)
  L <- round(vo^2*sin(2*an)/g,2)
  
  
  y <- vector()
  p <- seq(0.0, round(L), round(L)/100)
  
  # Fill y values
  for(i in 0:length(p)){
    y[i] <- (tan(an)*p[i])-((g/((2*vo^2)*cos(an)^2))*p[i]^2)
  }
  
  output<-list("g"=g,"an"=an,"T_1"=T_1,"H"=H,"T_2"=T_2,"T_t"=T_t,
               "L"=L,"y"=y,"p"=p)
  return(output)
}