library(lubridate)

budi <- function(f,a,b,maxiter,tol){
  # Dichotomic search
  # INPUT:
  #   - f: Function to search the min
  #   - a: X left
  #   - b: X Right
  #   - maxiter: Number of maxiter
  #   - tol: Tolerance
  # OUTPUT:
  #   - x: Min candidate
  #   - t: Time compsumtion
  #   - k: Number of iterations used
  # Init current time
  t1 <- now()
  k <- 1
  incre1 <- tol+1
  epsilon <- tol * 1e-1 #epsilon has one 0 more to get the given tol.
  X <- data.frame( "x" = min(a,b), "error" = incre1, "time" = now()-t1 ) 
  
  # Init the loop
  while (incre1>tol & k<maxiter){
    
    incre1 <- abs(b-a)
    mid <- (b+a)/2
    xa <- mid - epsilon/2
    xb <- mid + epsilon/2
    
    if (f(xa) < f(xb)) {
      b <- xb
    } else {
      a <- xa
    }
    k <- k+1
    X[k,] <- c(min(a,b), incre1, now()-t1 )
  }
  return(X)
}
# Prueba
maxiter <- 50
tol   <- 1e-6

f <- function(x){
  return(x^2 + 2*x + 1)
  }

a <- -1000
b <- 1000
x0 <- 0


budi(f,a,b,maxiter,tol)
