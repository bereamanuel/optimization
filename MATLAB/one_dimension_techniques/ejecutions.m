%Para todos los algoritmos podemos definir unas condiciones de parada, como
%son el numero máximo de iteraciones, la tolerancia del método o en el caso
%de rectas inexactas tenemos que definir un alpha y un beta para ver que se
%cumplen las condiciones de Wolfe.
% Condiciones de parada
warning('off','last') 
maxiter = 50;
tol   = 1e-6;
alpha = 1e-4;
beta  = 1e-1;
% ------------------------------------------------------------------------
% Funcion A
% ------------------------------------------------------------------------
%Para esta primera funcion, al tratarse en toda la recta real, vamos
%definir el inicio y el fin del intervalo con un numero suficientemente
%grande como para que sea siginificativo
f = @(x) x^2+2*x+1;
%   Intervalo o aproximacion incial
a = -1000;
b = 1000;
x0 = 0;

fprintf('---Funcion x^2+2*x+1 --------------------------------------------------\n')
fprintf('---Busqueda dicotomica ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda dicotomica')
%Ejecucion
[A1] = budi(f,a,b,maxiter,tol);
plot(A1(:,1),arrayfun(f,A1(:,1)),'or')
legend('x^2+2*x+1','x*')
xlabel(sprintf('The algorithm take %s s \n to find the min %d \n in %d iters \n', datestr(A1(end,3),'MM:SS.FFF'),A1(end,1),size(A1,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A1(end,3),'MM:SS.FFF'),A1(end,1),size(A1,1))
% ----
fprintf('---Algoritmo Fibonacci ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Fibonacci')
[A2] = fibo(f,a,b,maxiter,tol);
plot(A2(:,1),arrayfun(f,A2(:,1)),'or')
legend('x^2+2*x+1','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A2(end,3),'MM:SS.FFF'),A2(end,1),size(A2,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A2(end,3),'MM:SS.FFF'),A2(end,1),size(A2,1))
% ----
fprintf('---Interpolacion Cuadratica---------------------------------------------\n')
figure
hold on
fplot(f)
title('Interpolacion Cuadratica')
[A3] = incu(f,a,1,b,maxiter,tol);
plot(A3(:,1),arrayfun(f,A3(:,1)),'or')
legend('x^2+2*x+1','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A3(end,3),'MM:SS.FFF'),A3(end,1),size(A3,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A3(end,3),'MM:SS.FFF'),A3(end,1),size(A3,1))

% ----
fprintf('---Rectas Inexactas ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Rectas Inexactas')
[A4] = rein(f,x0,alpha,beta,maxiter,tol);
plot(A4(:,1),arrayfun(f,A4(:,1)),'or')
legend('x^2+2*x+1','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A4(end,3),'MM:SS.FFF'),A4(end,1),size(A4,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A4(end,3),'MM:SS.FFF'),A4(end,1),size(A4,1))
% ----
fprintf('---Busqueda Newton ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Newton')
[A5] = new(f,x0,tol,maxiter);
plot(A5(:,1),arrayfun(f,A5(:,1)),'or')
legend('x^2+2*x+1','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A5(end,3),'MM:SS.FFF'),A5(end,1),size(A5,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(A5(end,3),'MM:SS.FFF'),A5(end,1),size(A5,1))
fprintf('\n \n \n')

% ----------------------------------------------------------------
% Funcion B
% ----------------------------------------------------------------
f = @(x) sin(x)+x^2;
%   Intervalo o aproximacion incial
a = -1000;
b = 1000;
x0 = 0;


fprintf('---Funcion sin(x)+x^2 --------------------------------------------------\n')
fprintf('---Busqueda dicotomica ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda dicotomica')
%Ejecucion
[B1] = budi(f,a,b,maxiter,tol);
plot(B1(:,1),arrayfun(f,B1(:,1)),'or')
legend('sin(x)+x^2','x*')
xlabel(sprintf('The algorithm take %s s \n to find the min %d \n in %d iters \n', datestr(B1(end,3),'MM:SS.FFF'),B1(end,1),size(B1,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B1(end,3),'MM:SS.FFF'),B1(end,1),size(B1,1))
% ----
fprintf('---Algoritmo Fibonacci ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Fibonacci')
[B2] = fibo(f,a,b,maxiter,tol);
plot(B2(:,1),arrayfun(f,B2(:,1)),'or')
legend('sin(x)+x^2','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B2(end,3),'MM:SS.FFF'),B2(end,1),size(B2,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B2(end,3),'MM:SS.FFF'),B2(end,1),size(B2,1))
% ----
fprintf('---Interpolacion Cuadratica---------------------------------------------\n')
figure
hold on
fplot(f)
title('Interpolacion Cuadratica')
[B3] = incu(f,a,1,b,maxiter,tol);
plot(B3(:,1),arrayfun(f,B3(:,1)),'or')
legend('sin(x)+x^2','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B3(end,3),'MM:SS.FFF'),B3(end,1),size(B3,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B3(end,3),'MM:SS.FFF'),B3(end,1),size(B3,1))

% ----
fprintf('---Rectas Inexactas ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Rectas Inexactas')
[B4] = rein(f,x0,alpha,beta,maxiter,tol);
plot(B4(:,1),arrayfun(f,B4(:,1)),'or')
legend('sin(x)+x^2','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B4(end,3),'MM:SS.FFF'),B4(end,1),size(B4,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B4(end,3),'MM:SS.FFF'),B4(end,1),size(B4,1))
% ----
fprintf('---Busqueda Newton ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Newton')
[B5] = new(f,x0,tol,maxiter);
plot(B5(:,1),arrayfun(f,B5(:,1)),'or')
legend('sin(x)+x^2','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B5(end,3),'MM:SS.FFF'),B5(end,1),size(B5,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(B5(end,3),'MM:SS.FFF'),B5(end,1),size(B5,1))
fprintf('\n \n \n')

% ------------------------------------------------------------------------
% Funcion C
% ------------------------------------------------------------------------
f = @(x) cos(x)-log(x);

a = 1e-6;
b = 5;


% Ejecucion
fprintf('---Funcion cos(x)-log(x) --------------------------------------------------\n')
fprintf('---Busqueda dicotomica ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda dicotomica')
%Ejecucion
[C1] = budi(f,a,b,maxiter,tol);
plot(C1(:,1),arrayfun(f,C1(:,1)),'or')
legend('cos(x)-log(x)','x*')
xlabel(sprintf('The algorithm take %s s \n to find the min %d \n in %d iters \n', datestr(C1(end,3),'MM:SS.FFF'),C1(end,1),size(C1,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C1(end,3),'MM:SS.FFF'),C1(end,1),size(C1,1))
% ----
fprintf('---Algoritmo Fibonacci ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Fibonacci')
[C2] = fibo(f,a,b,maxiter,tol);
plot(C2(:,1),arrayfun(f,C2(:,1)),'or')
legend('cos(x)-log(x)','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C2(end,3),'MM:SS.FFF'),C2(end,1),size(C2,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C2(end,3),'MM:SS.FFF'),C2(end,1),size(C2,1))
% ----
fprintf('---Interpolacion Cuadratica---------------------------------------------\n')
figure
hold on
fplot(f)
title('Interpolacion Cuadratica')
[C3] = incu(f,a,1,b,maxiter,tol);
plot(C3(:,1),arrayfun(f,C3(:,1)),'or')
legend('cos(x)-log(x)','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C3(end,3),'MM:SS.FFF'),C3(end,1),size(C3,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C3(end,3),'MM:SS.FFF'),C3(end,1),size(C3,1))

% ----
x0 = 1;
fprintf('---Rectas Inexactas ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Rectas Inexactas')
[C4] = rein(f,x0,alpha,beta,maxiter,tol);
plot(C4(:,1),arrayfun(f,C4(:,1)),'or')
legend('cos(x)-log(x)','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C4(end,3),'MM:SS.FFF'),C4(end,1),size(C4,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C4(end,3),'MM:SS.FFF'),C4(end,1),size(C4,1))
% ----
x0 = 2.5;
fprintf('---Busqueda Newton ------------------------------------------------\n')
figure
hold on
fplot(f)
title('Busqueda Newton')
[C5] = new(f,x0,tol,maxiter);
plot(C5(:,1),arrayfun(f,C5(:,1)),'or')
legend('cos(x)-log(x)','x*')
xlabel(sprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C5(end,3),'MM:SS.FFF'),C5(end,1),size(C5,1)));
hold off
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(C5(end,3),'MM:SS.FFF'),C5(end,1),size(C5,1))
fprintf('\n \n \n')

%Para esta funcion, hemos tenido que ajustar el x0, ya que la solucion
%dependedía del punto cogido, por eso para Newton y rectas inexactas hemos
%usado un punto x0 diferente.

% ------------------------------------------------------------------------
% Funcion D
% ------------------------------------------------------------------------
fprintf('---Funcion EDO --------------------------------------------------\n')
a = 1;
b = 4;
x0 = 3.5;

%Ejecucion
fprintf('---Busqueda dicotomica ------------------------------------------------\n')
[D1] = budi('funcionrr',a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D1(end,3),'MM:SS.FFF'),D1(end,1),size(D1,1) )
fprintf('---Algoritmo Fibonacci ------------------------------------------------\n')
[D2] = fibo('funcionrr',a,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D2(end,3),'MM:SS.FFF'),D2(end,1),size(D2,1) )
fprintf('---Interpolacion Cuadratica---------------------------------------------\n')
[D3] = incu('funcionrr',a,3,b,maxiter,tol);
fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D3(end,3),'MM:SS.FFF'),D3(end,1),size(D3,1) )
% fprintf('---Rectas Inexactas ------------------------------------------------\n')
% [D4] = rein('funcionrr',x0,alpha,beta,maxiter,tol);
% fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D4(end,3),'MM:SS.FFF'),D4(end,1),size(D4,1) )
% fprintf('---Busqueda Newton ------------------------------------------------\n')
% [D5] = new('funcionrr',x0,tol,maxiter);
% fprintf('The algorithm take %s s to find the min %d in %d iters \n', datestr(D5(end,3),'MM:SS.FFF'),D5(end,1),size(D5,1) )
% fprintf('-------------------------------------------------------------------\n')