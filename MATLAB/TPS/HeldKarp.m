%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           ALGORITMO DE HELD-KARP PARA CAMINOS HAMILTONIANOS           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROF. Andrés Pérez %%%%%%
clear all
clc
tic                                         % Inicio del contador de tiempo
%%                 Matriz de Adyacencia  - con pesos                     %%
%% Matriz 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  dmatrix=[0 3 3 4 99 4;3 0 2 99 3 6;3 2 0 1 2 99;4 99 1 0 6 99;99 3 2 6 0 2;4 6 99 99 2 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indS=0;
numCiudades=size(dmatrix(:,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Almacenaje de Datos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% identificamos cada conjunto S con el producto de los primeros primos,por
%% ejemplo S={3,4,6}, cojerá el producto del tercer, cuarto y sexto primo 
%% (i.e. 5*7*13) como índice del conjunto S.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Se inicializan matrices de cada conjunto
numPrim=primes(6*10);
numPrim=numPrim(1:numCiudades);
maxConj=prod(numPrim); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% d(conjunto, ultima):= Contiene el costo de el circuito que empieza en 1, 
%%                  pasa por las ciudades del conjunto y termina en ultima.
d(maxConj,numCiudades)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% predecesor(conjunto, ultima):= Contiene la penúltima ciudad del circuito
%%              que empieza en 1, pasa por el conjunto y termina en ultima.
predecesor(maxConj,numCiudades)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicio de casos: caso k=0
for c=2:numCiudades
    d(numPrim(c), c)= dmatrix(c,1);
end
%% Caso General
for s=2:numCiudades
    %% S contiene todas las combinaciones de s elementos de las ciudades que
    %% nos quedan.
    restantes=2:numCiudades;
    S=nchoosek(restantes,s); % Devuelve combinaciones de s elementos de restantes

    %% Se recorren todos los conjuntos S de s elementos
    for ind=1:size(S(:,1))
        %% Para cada conjunto S, calculamos el coste asociado al conjunto que
        %% termina en k
        for k=1:s
            minval=inf;
            
            sconj=S(ind,:);
            sMenosk=S(ind,:);
            sMenosk(k)=[];
            indc=indexConj(sMenosk,numPrim);

            %% Se busca el mínimo de los posibles caminos que acaban en k y
            %% tienen m como penúltima ciudad
            for m=1:s
                if m==k
                    continue
                end
                %% Al costo calculado de ir de 1 hasta m siguiendo los
                %% elementos del conjunto (valor almacenado en d(indc,sconj(m)))
                %% se le suma el valor de ir de m a k.
                dm=dmatrix(sconj(k),sconj(m))+d(indc,sconj(m));
                if(dm< minval)
                    minval=dm;
                    indmin=m;
                end
            end

            indcM=indexConj(S(ind,:),numPrim);
            d(indcM,sconj(k))=minval;
            predecesor(indcM,sconj(k))=sconj(indmin);
            sconj(indmin)
        end
    end
end

%% Se reproduce el último paso, para volver a 1
optim=inf;
for k=2:numCiudades
    sconj=2:numCiudades;
    indc=indexConj(sconj,numPrim);
    dm=dmatrix(k,1)+d(indc,k);
    if(dm< optim)
        optim=dm;
        indmin=k;
    end
end


%% Extracción del camino final
%% El resultado contiene el vector del camino
resultado(numCiudades+1)=0;
resultado(1)=1;

%% novisitadas nos dice que ciudades todavía no hemos visitado:
%% 1-> no visitada
%% 0-> visitada
novisitadas=ones([1,numCiudades]);
novisitadas=logical(novisitadas);
novisitadas(1)=0;

%% Lista de ciudades a eliminar.
identidad=1:numCiudades;
for i= 2:numCiudades
        %% La siguiente ciudad a visitar se almacena en indmin.
        resultado(i)=indmin;
        %% Miramos el conjunto de ciudades no visitadas
        conjS=identidad(novisitadas);
        %% Elimina ciudad que visitamos
        novisitadas(indmin)=0;

        %% Devuelve el penúltimo elemento del camino, esto es, la siguiente
        %% Ciudad que visitiaremos.
        indS=indexConj(conjS,numPrim);
        indmin=predecesor(indS,indmin);

end

resultado(end)=1
optim

toc
%% indexConj calcula el índice del conjunto Conj.
%% Emplea numPrim para no recalcularlo
function indc=indexConj(Conj,numPrim)
    indc=prod(numPrim(Conj));
end
