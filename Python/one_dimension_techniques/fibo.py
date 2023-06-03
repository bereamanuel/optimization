def fibo(f,a,b,maxiter,tol):
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

    import time
    import numpy as np
    import pandas as pd 

    t1 = time.time()
    k = 1
    incre1 = tol+1
    epsilon = tol * 1e-1 #epsilon has one 0 more to get the given tol.

    I0 = [a,b]
    F0 = [ f(I0[0]), f(I0[1]) ]

    w1 = I0[1]-I0[0]
    F = np.zeros( [maxiter,1] )

    F[0] = 1
    F[1] = 2
    n = 1 
    while w1 > tol*F[n] :
        n = n+1
        F[n] = F[n-1] + F[n-2]
    
    w = w1
    w = w*F[n-2]/F[n-1]


    xa = I0[1]-w 
    xb = I0[0]+w
    fa=f(xa)
    fb=f(xb)

    X = pd.DataFrame( {"x" : (I0[0]+I0[1])/2, "error" : [I0[1]-I0[0]], "time": [time.time()-t1] } )

    # Init the loop
    for k in range(1,n-2) :

        w = w*F[n-k-1]/F[n-k]; 

        if (f(xa) > f(xb)) :
            I0[0]=xa
            F0[0]=fa
            xa=xb
            fa=fb
            xb=xa+w
            fb = f(xb)
        else:
            I0[1]=xb
            F0[1]=fb
            xb=xa
            fb=fa
            xa=xb-w
            fa = f(xa)

        X = pd.concat([X, 
                pd.DataFrame( {"x" : (I0[0]+I0[1])/2, "error" : [I0[1]-I0[0]], "time": [time.time()-t1] } ) ], axis = 0)

    return X

# Prueba
maxiter = 50
tol   = 1e-6

def f(x):
    return x**2+2*x+1

a = -1000
b = 1000
x0 = 0


print(fibo(f,a,b,maxiter,tol))