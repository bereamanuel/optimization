function [X] = incu(f,x1,x2,x3,maxiter,tol)
% Cuadratic interpolation
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
    while incre1>tol && k<maxiter
        y1 = feval(f,x1);
        y2 = feval(f,x2);
        y3 = feval(f,x3);

        B = (x2^2-x3^2)*y1 + (x3^2-x1^2)*y2 + (x1^2-x2^2)*y3;
        A = (x3-x2)*y1 + (x1-x3)*y2 + (x2-x1)*y3;
        x0 = -B/(2*A);
        y0 = feval(f,x0);
        incre1 = norm(x2-x0);
        X(k,:) = [x0,incre1,now-t1];
    if x0>x2 && x0<x3
        if y0<y2 && y0<y3
            x1 = x2;
            x3 = x3;
            x2 = x0;
        else
            x1 = x1;
            x2 = x2;
            x3 = x0;
        end
    else 
        if y0<y1 && y0<y2
            x1 = x1;
            x3 = x2;
            x2 = x0;
            
        else
            x1 = x0;
            x2 = x2;
            x3 = x3;
        end

    end
    k = k+1;
    end
