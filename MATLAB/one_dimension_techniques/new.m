function [X] = new(f,x0,tol,maxiter)
% Newton's method
% INPUT:
%   - f: Function to search the min
%   - df: Derivate f.
%   - x0 : First aprox
%   - maxiter: Number of maxiter
%   - tol: Tolerance
% OUTPUT:
%   - x: Min candidate
%   - t: Time compsumtion
%   - k: Number of iterations used
syms x
t = now;
k = 1;
incre1 = tol+1;

df = inline(diff(f,x));
df2 = inline(diff(diff(f,x),x));

while incre1>tol && k<maxiter
     xk=x0-df(x0)/df2(x0);                            
     incre1=norm(df(x0));         
     x0=xk;                                  
     X(k,:) = [x0,incre1,now-t];
     k=k+1;                                     
end

end