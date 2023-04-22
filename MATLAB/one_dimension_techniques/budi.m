function [X] = budi(f,a,b,maxiter,tol)
% Dichotomic search
% INPUT:
%   - f: Function to search the min
%   - a: X left
%   - b: X Right
%   - maxiter: Number of maxiter
%   - tol: Tolerance
% OUTPUT:
%   - x: Min candidate
%   - t: Time compsumtion
%   - k: Number of iterations used
%Init current time
t1 = now; 
digits(200);
k = 1;
incre1 = tol+1;
epsilon = tol * 1e-1; %epsilon has one 0 more to get the given tol.
%Init the loop
while incre1>tol && k<maxiter
    incre1 = norm(b-a);
    mid = (b+a)/2;
    xa = mid - epsilon/2;
    xb = mid + epsilon/2;
    X(k,:) = [min(a,b),incre1,now-t1];
    if (feval(f,xa) < feval(f,xb))
        b = xb;
    else
        a = xa;
    end
    k=k+1;
end
end