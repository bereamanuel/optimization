%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                    MÉTODO SIMPLEX TABLAS MODELO 2                    %%
%%                                                  PROF. ANDRÉS PÉREZ  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ');
disp('Instrucciones:'); % Indicaciones para un correcto funcionamiento del algoritmo
disp('1. La ecuaciones o inecuaciones, deben ingresarse en forma de vector, considerando ambos miembros de las mismas.');
disp('2. En el caso de la Función Objetivo, los términos correspondientes deben desplazarse para que nos quede igualada a cero.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ingreso de Función Objetivo, número de restricciones y restricciones %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=input('Ingrese la función objetivo a optimizar: ');
var=input('Ingrese el número de variables de decisión: ');
n=input('Ingrese el número de restricciones del problema: ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MATRIZ SIMPLEX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Se define la primera fila de la matriz simplex la cual contiene los 
%% términos de la función objetivo
filaFO=[F zeros(1,n)];

%% Se solicita el ingreso de cada restricción del problema
for i=1:1:n
    restricciones(i,:)=[0 input('Ingrese Restricción: ')];
end

%% Se almacenará en la variable nfr rl número de filas pertenecientes a las 
%% restricciones
nfr=size(restricciones,2);

%% Se separa la última columna de cada restricción, la cual corresponde al
%% segundo miembro de cada ecuación o inecuación
for i=1:1:nfr-1
    filasRest(:,i)=restricciones(:,i);
end

%% Luego, se procede a incluir a las variables de holgura en cada restricción

filasRest=[filasRest eye(n) restricciones(:,nfr)];

%% Finalmente, se construye la Matriz SImplex con la matriz de la Función
%% Objetivo y la matriz de las restricciones y es mostrada en pantalla.
M=[filaFO;filasRest];
disp(' ');
disp('La tabla Simplex inicial es: ');
disp(M);
disp(' ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ITERACIONES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ahora, se inicia la primera iteración. Para ello: S
%% 1. Se define una variable auxiliar v, que cambiará su valor a cero 
%%    cuando se encuentre la solución óptima. 
%% 2. Se considera una segunda variablke auxiliar como contador de iteraciones

v=1;
t=0;

%% Nota: Mientras el valor de la variable auxiliar sea 1, la solución óptima
%%       aún no ha sido hallada.
while v~=0
    %% Se reconoce el valor y la columna en la que se encuentra el valor 
    %% mínimo "ELEMENTO PIVOTE" y "COLUMNA PIVOTE".
    [nfila,ncolumna]=size(M);
    [valormin,columnapiv]=min(M(1,:));

    %% Una iteración se ejecutará sólo si existe un término negativo en la
    %% fila perteneciente a la función objetivo, es decir, si se cumple la
    %% condición de optimalidad.

    if valormin<0
        %% Los términos de la columna pivote deben dividir a los elementos 
        %% la última columna que corresponden a los segundos miembros de
        %% las ecuaciones de restricción.

        for i=2:nfila
            c_factibilidad(i-1)=M(i,ncolumna)/M(i,columnapiv);
        end

        %% Se encuentra el valor mínimo requerido con el fin de satisfacer 
        %% la condición de factibilidad.

        [minimo,filapiv]=min(c_factibilidad);

        %% Se debe sumar una unidad para encontrar la fila pivote, ya que
        %% sólo se estuvieron contando las filas que contienen restricciones

        filapiv=filapiv+1;

        %% Posteriormente, se divide cada elemento de la fila pivote por el
        %% elemento pivote

        M(filapiv,:)=1/M(filapiv,columnapiv)*M(filapiv,:);
        fila_pivote=M(filapiv,:);

        %% Después se transforman las demás filas.
        
        for i=1:1:nfila
            M(i,:)=(-M(i,columnapiv)*M(filapiv,:)+M(i,:));

            if M(i,:)==M(filapiv,:)
                M(i,:)=fila_pivote;
            end
        end

        %% Se imprime en la pantalla la tabla Simplex de la actual iteración
        %% y aumenta en una unidad el contador

        tabla_iteracion=['La tabla Simplex de la iteración N° ',num2str(t+1), ' es: '];
        disp(tabla_iteracion);
        disp(M);
        t=t+1;
        disp(' ');
    else
        v=0; % Se activa cuando ya no hay elementos negativos en la fila de 
             % la Función Objetivo
    end
end
%% Se indica el número de iteraciones 
n_iteraciones=['Iteraciones totales realizadas: ',num2str(t)]; 
disp(n_iteraciones);
disp(' ');

%% Se guarda y se muestra el valor óptimo encontrado
Z=M(1,size(M,2));
Solucion_Optima=['El valor óptimo del problema es Z= ', num2str(Z)];
disp(Solucion_Optima);
disp(' ');
disp('Para alcanzar el valor óptimo se deben considerar para cada variable: ');

%% Mediante este ciclo se encuentran los valores finales  de las variables
%% de decisión del problema y luego, son mostrados en pantalla.

for i=2:size(M,1);
    a=1;
    %% Se ubicarán las posiciones dentro de la matriz en donde se encuentran 
    %% las variables de interés y así, se sabrá cual valor final corresponde
    %% a x1,x2,x3, etc.

    while a<var+2
        if M(i,a)==1
            j=a;
            a=var+2;
            %% Los valores finales de las variables de decisión son mostradas
            %% en pantalla.
            disp(' ');
            X=M(i, size(M,2));
            Variables_Final=['X', num2str(j-1), '=', num2str(X)];
            disp(Variables_Final);
        else
            a=a+1;
        end
    end
end




        

       













