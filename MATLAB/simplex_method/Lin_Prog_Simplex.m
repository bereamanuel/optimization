C=[-1 -2 0 0 0]';  % Vector de costes
beq=[2  3  4]';        % Vector de recursos
Aeq=[-2 1 1 0 0; -1 1 0 1 0; 1 0 0 0 1]; % Matriz de restricciones

%C=[1 -2 0 0]';  % Vector de costes
%beq=[2  6]';        % Vector de recursos
%Aeq=[-1 1 1 0; 
%     -1 2 0 1]; % Matriz de restricciones

A=[];
b=[];
x0=0;
lb=[0,0,0,0];
ub=[inf,inf,inf,inf];
ans=linprog(C,A,b,Aeq,beq,lb,ub,x0);
ans