library(lubridate)

fibo <- function(f,a,b,maxiter,tol){
  # Cuadratic interpolation
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

I0 <- c(a,b)
F0 <- c(f(I0[0]), f(I0[1]))

w1 <- I0[2]-I0[1]
F <- rep(0, maxiter)

F[1] = 1
F[2] = 2
n = 2
while (as.numeric(w1) > tol*F[n]) {
  n <- n+1
  F[n] <- F[n-1] + F[n-2]
}
w <- w1
w <- w*F[n-2]/F[n-1]


xa <-  I0[2]-w 
xb <- I0[1]+w
fa <- f(xa)
fb <- f(xb)

X = data.frame( "x" = (I0[1]+I0[2])/2 , "error" = I0[2]-I0[1], "time" = now()-t1  )

# Init the loop
for ( k in (2:n-2)) {
  
  w <- w*F[n-k-1]/F[n-k]

  if (f(xa) > f(xb)) {
      I0[1]<-xa
      F0[1]<-fa
      xa<-xb
      fa<-fb
      xb<-xa+w
      fb <- f(xb)
      }else{
        I0[2]<-xb
        F0[3]<-fb
        xb<-xa
        fb<-fa
        xa<-xb-w
        fa <- f(xa)
      }
X[k,] <- c( (I0[1]+I0[2])/2 , I0[2]-I0[1] ,now()-t1 )

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


fibo(f,a,b,maxiter,tol)
