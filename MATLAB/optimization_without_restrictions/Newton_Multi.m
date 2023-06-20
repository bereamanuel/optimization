function [X] = Newton_Multi(Df,DDf,x0,maxiter,tol)
% Dichotomic search
% INPUT:
%   - f: Function to search the min
%   - Df: Jacobian
%   - DDf: Hessian matrix
%   - x0: Aprox initial value
%   - maxiter: Number of maxiter
%   - tol: Tolerance
% OUTPUT:
%   - x: Min candidate
%   - t: Time compsumtion
%   - k: Number of iterations used

%Init current time
t = now; 
digits(200);
iter = 1;

while iter<maxiter
D=Df(x0) ;       % Vector Gradiente
n1= sqrt(D'*D);         % Norma del Vector Gradiente - Criterio de Parada
       % Se imprime cada iterado y el error que se comete en la iteración
sprintf ("Iterado %d, aprox=( %f, %f), error= %e", iter , x0, n1)
h= DDf(x0)\D ;         % Cálculo del p correspondiente          
n2= sqrt(h'*h) ;       % Norma de p - Segundo Criterio de Parada
x0=x0-h';                 % Actualización del punto x=(x(1),x(2))
if (n1<tol) || (n2<tol) % Pregunta para Criterio de Parada
iter = maxiter ;
break;
end
X(iter,:) = [x0,n1,n2,now-t];
iter = iter +1;         % Actualización del Contador
end

end