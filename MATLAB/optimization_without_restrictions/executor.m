syms x y 
f(x,y)=(x-2)^4+(x-2)^2*y^2+(y+1)^2;
v = [x,y];

x0 = [1,1];
maxiter = 10;
tol = 1E-12;

Newton_Multi(f,v,x0,maxiter,tol)