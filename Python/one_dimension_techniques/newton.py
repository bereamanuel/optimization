def new(f,x0,tol,maxiter):
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
    import time
    from scipy.misc import derivative
    import numpy as np
    import pandas as pd 

    t1 = time.time()
    k = 1
    incre1 = tol+1

    X = pd.DataFrame( {"x" : x0, "error" : incre1, "time": [time.time()-t1] } )


    while incre1>tol and k<maxiter:
        df = derivative(f,x0)
        df2 = derivative(f,x0, n=2)
        xk=x0-df/df2                            
        incre1=np.linalg.norm(df)         
        x0=xk                                  
        X = pd.concat([X, pd.DataFrame( {"x" : x0, "error" : incre1, "time": [time.time()-t1] } ) ], axis = 0)
        k = k+1                                    
    

    return(X)

# Prueba
maxiter = 50
tol   = 1e-6

def f(x):
    return x**2+2*x+1

x0 = 1


print(new(f,x0,tol,maxiter))  
