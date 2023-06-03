function [X] = rein(f,x0,alpha,beta,maxiter,tol)
% Method of Inexact Lines
% INPUT:
%   - f: Function to search the min
%   - x0 : First aprox
%   - h : Step length
%   - maxiter: Number of maxiter
%   - tol: Tolerance
% OUTPUT:
%   - x: Min candidate
%   - t: Time compsumtion
%   - k: Number of iterations used
syms x
t1 = now;
k = 1;
incre1 = tol+1;
df = inline(diff(f,x));

while incre1>tol && k<maxiter
    fx0 = f(x0);
    dfx0 = df(x0);
    dk = -sign(dfx0);
    lambda = 1;
    while (f(x0+lambda*dfx0) <= fx0 + alpha*lambda*dfx0*dk) && beta*dfx0*dk <= df(x0+lambda*dk)*dk
        lambda = 0.5*lambda;
    end
    x0 = x0 + lambda*dk;
    incre1 = norm(df(x0));
    X(k,:) = [x0,incre1,now-t1];
    k = k + 1;
end
end