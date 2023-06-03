function [X] = fibo(f,a,b,maxiter,tol)
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
digits(200);
%Init current time
t1 = now; 
k = 1;
incre1 = tol+1;
%Init first values
I0 = [a,b];
F0 = [feval(f,I0(1)),feval(f,I0(2))] ;
w1=I0(2)-I0(1);
F = zeros(maxiter,1);

%Iniciamos Fibonacci
F(1)=1; F(2)=2;
n = 2;
while w1 > tol*F(n)
    n = n+1;
    F(n) = F(n-1) + F(n-2);
end

w = w1;
w = w*F(n-2)/F(n-1);

xa = I0(2)-w; xb = I0(1)+w;
fa=feval(f,xa); fb=feval(f,xb);
X(1,:) = [(I0(1)+I0(2))/2, I0(2)-I0(1), now-t1];
for k=2:n-2
    w = w*F(n-k-1)/F(n-k); 
    if fa> fb
        I0(1)=xa;   F0(1)=fa;
        xa=xb;      fa=fb;
        xb=xa+w;    fb = feval(f,xb);
    else
        I0(2)=xb;   F0(2)=fb;
        xb=xa;      fb=fa;
        xa=xb-w;    fa = feval(f,xa);
    end
    X(k,:) = [(I0(1)+I0(2))/2, I0(2)-I0(1), now-t1];
end

end