% Búsqueda dicotómica
% Funcion A
a = -100;
b = 100;
f = @(x) x^2+2*x+1;
maxiter = 5;
tol = 1e-6;
[A] = budi(f,a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A(end,3),'MM:SS.FFF'),A(end,1),size(A,1))

[A] = incu(f,a,1,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A(end,3),'MM:SS.FFF'),A(end,1),size(A,1) )
fprintf('-------------------------------------------------------------------\n')
% Funcion B
a = -100;
b = 100;
f = @(x) sin(x)+x^2;
maxiter = 500;
tol = 1e-6;
[B] = budi(f,a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B(end,3),'MM:SS.FFF'),B(end,1),size(B,1) )

[B] = incu(f,a,1,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B(end,3),'MM:SS.FFF'),B(end,1),size(B,1) )

fprintf('-------------------------------------------------------------------\n')
% Funcion C
a = 1e-6;
b = 5;
f = @(x) cos(x)-log(x);
maxiter = 500;
tol = 1e-6;
[C] = budi(f,a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C(end,3),'MM:SS.FFF'),C(end,1),size(C,1) )

[C] = incu(f,a,1,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C(end,3),'MM:SS.FFF'),C(end,1),size(C,1) )

fprintf('-------------------------------------------------------------------\n')
% Funcion D
a = 1;
b = 4;
maxiter = 500;
tol = 1e-6;
[D] = budi('funcionrr',a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D(end,3),'MM:SS.FFF'),D(end,1),size(D,1) )

[D] = incu('funcionrr',a,3,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D(end,3),'MM:SS.FFF'),D(end,1),size(D,1) )

fprintf('-------------------------------------------------------------------\n')