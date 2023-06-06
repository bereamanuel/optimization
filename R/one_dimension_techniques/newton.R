new <- function(f,x,tol,maxiter){
  # Newton's method
  # INPUT:
  #   - f: Function to search the min
  #   - df: Derivate f.
  #   - x0 : First aprox
  #   - maxiter: Number of maxiter
  #   - tol: Tolerance
  # OUTPUT:
  #   - x: Min candidate
  #   - t: Time compsumtion
  #   - k: Number of iterations used

t1 <-  now()
k <-  1
incre1 <-  tol+1

X <-  data.frame( "x" = x, "error" = incre1, "time" =  now()-t1)


while (incre1>tol & k<maxiter){
  df <-  D(f,"x")
  df2 <-  D(D(f,"x"),"x")
  xk <- x-eval(df)/eval(df2)
  incre1 <-  abs(eval(df))
  x <- xk
  k <- k+1
  X[k,] <- c(x,incre1,now()-t1)
  }


return(X)
}
# Prueba
maxiter <-  50
tol   <-  1e-6

f <- expression(x^2+2*x+1)
x <-  1


print(new(f,x,tol,maxiter))
