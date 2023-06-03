def budi(f,a,b,maxiter,tol):
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

    import time
    import numpy as np
    import pandas as pd 
    t1 = time.time()
    k = 1
    incre1 = tol+1
    epsilon = tol * 1e-1 #epsilon has one 0 more to get the given tol.

    X = pd.DataFrame( {"x" : [min(a,b)], "error" : [incre1], "time": [time.time()-t1] } )

    # Init the loop
    while incre1>tol and k<maxiter:
        incre1 = np.linalg.norm(b-a)
        mid = (b+a)/2
        xa = mid - epsilon/2
        xb = mid + epsilon/2

        if (f(xa) < f(xb)) :
            b = xb
        else:
            a = xa

        X = pd.concat([X, pd.DataFrame( {"x" : [min(a,b)], "error" : [incre1], "time": [time.time()-t1] } ) ], axis = 0)
        k=k+1

    return X

# Prueba
maxiter = 50
tol   = 1e-6

def f(x):
    return x**2+2*x+1

a = -1000
b = 1000
x0 = 0


print(budi(f,a,b,maxiter,tol))