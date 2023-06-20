%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  ALGORITMO PARA EL MÉTODO SIMPLEX                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%          PROBLEMA: Resolver un Problema Lineal Estandarizado         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all                                     
clc 
%% CONDICIONES INICIALES DE PROBLEMA LINEAL ESTANDARIZADO
C=[1 -2 0 0]' ;                                      % Vector de costes
b=[2  6]'  ;                                       % Vector de recursos
A=[-1 1 1 0; -1 2 0 1];                        % Matriz de restricciones
%% CONDICIONES INICIALES DE PROBLEMA LINEAL ESTANDARIZADO
%C=[-1 -2 0 0 0]' ;                                      % Vector de costes
%b=[2  3  4]'  ;                                       % Vector de recursos
%A=[-2 1 1 0 0; -1 1 0 1 0; 1 0 0 0 1];           % Matriz de restricciones

%% SELECCIÓN DE SOLUCIONES BÁSICAS VIA REDUCCIÓN GAUSSIANA
[~,inB]=rref(A);        % Selección de índices para las soluciones básicas
inN=(1:length(C));       % Indices de las No básicas (definidos completos)
inN(inB)=[];                     % Se le restan los indices de las Básicas

%%  BUCLE DE COSTOS Y MEJORAMIENTO
cNt=[-1  -1];      % Condición inicial negativa para que entre en el bucle
cNt<-10*eps(1);    % Buena práctica para buscar < 0 con el epsilon máquina

%%                           INICIO DEL BUCLE                           %%
while sum(cNt<-10*eps(1))>0
      B=A(:,inB);                                       % Matriz Básica
      N=A(:,inN);                                       % Matriz No Básica

      CB=C(inB);                                          % Costos Básicos
      CN=C(inN);                                       % CostoS No Básicos

      btecho=B\b;     % Esto evita calcular inversa para luego multiplicar
      xB=btecho;                                      % soluciones básicas

      x=zeros(length(C), 1);                               % Solución Total
      x(inB)=xB; % Coordenadas de soluciones básicas y se le inyecta btecho

      cNt=(CN'-CB'*(B\N))';          % btecho=B\verdaderos costes reducidos

      [~,r]=max(cNt<-10*eps(1));    % Criterio de parada, el mayor antes de 
                                    % los negativos

      Ar=A(:,inN(r));            % Matriz cuyas columnas están asociadas a 
                                 % las No Básicas

      Artecho=B\Ar;                  % Puede que existan algunos negativos

      Artecho(Artecho<-10*eps(1))=0;  % Esos valores negativos los elimino 

      [xs,s ]=min(btecho./Artecho); % División término a término 
                                    % matricialmente. Podríamos dividir
                                    % por cero y en ese caso daría infinito

      if xs==inf
          warning('El Problema es No Acotado');
          return;
      end
      % Recuerde que r es el índice de soluciones no básicas que entra en
      % la base y s el índice de la básicas que sale

      basein=inN(r);
      baseout=inB(s);

      % Luego se realiza un intercambio de indices

      inB(s)=basein;
      inN(r)=baseout;

end

x
