%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    ALGORIMO PARA MULTIPLICADORES DE LAGRANGE    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PROF. ANDRÉS PÉREZ  %%
%%   Optimizar  f(x,y)=x^2+3y^2                    %%
%%   Sujeto a:  g(x,y)=x^2-2*x+y^2-3               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y l       % Declaración de variables (l=lambda)
%% Definición de funciones
f(x,y)=x^2+3*y^2;               % Función a optimizar
g(x,y)=x^2-2*x+y^2-3;        % Función de restricción
%% Función Lagrangiana
L(x,y,l)=f(x,y)+l*g(x,y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Condición Necesaria: \nabla L(x,y,l)=0  
Grad=jacobian(L(x,y,l),[x,y,l]);
%% Solución del sistema de ecuaciones para obtener
%% los puntos críticos
[px,py,pl]=solve(Grad,x,y,l);
n=size(px,1);
%% Visualización de Puntos Críticos
for i=1:n
    disp(' ')
    disp(['Los puntos críticos son: P',num2str(i)])
    [px(i),py(i)]
end

%% Clasificación de los Puntos Críticos: Hessiano
Hess(x,y,l)=hessian(L(x,y,l),[x,y,l]);
%% Evaluación en la matriz Hessiana
for i=1:n
    disp('')
    disp(['El hessiano en el punto: P(',num2str(i),') es:'] )
    D=det(Hess(px(i),py(i),pl(i)))
    if D>0 
    disp('')
    disp('El punto realiza un máximo' ) 
    else 
        disp('')
    disp('El punto realiza un minimo' )
    end
end
%x=linspace(-5,5,50);
%y=x';
%z=x.^2+3.*y.^2;
%surf(x,y,z)
ezcontour(f(x,y),[-5,5])
grid on
colorbar
hold on
for i=1:n
    plot(px(i),py(i),'Ob')
end
hold off
