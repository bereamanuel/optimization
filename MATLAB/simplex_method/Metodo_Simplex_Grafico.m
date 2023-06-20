%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                   MÉTODO GRÁFICO PARA EL SIMPLEX                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PROF. ANDRÉS PÉREZ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
%% Dimensiones de los ejes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=0:60;
y=0:35;
%% Restricciones %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Primera Restricción
y=40-x;                                             
plot(x,y,'LineWidth',3,'Color','r')                    % Grafica Función 1
hold on;                                % Se dejan los gráficos anteriores
% Segunda Restricción
y=30-(1/2).*x;                                         
plot(x,y,'LineWidth',3,'Color','g')                    % Grafica Función 2
hold on;                                % Se dejan los gráficos anteriores

%% Nota: En caso de agregar una tercera restricción, se podría anexar:
% Tercera Restricción
% y=0.5.*x;                                             
% plot(x,y,'LineWidth',3,'Color','m')                  % Grafica Función 3
% hold on;                              % Se dejan los gráficos anteriores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Nota: Depende de las intersecciones de nuestras gráficas los puntos a 
%%       graficar
%% Puntos a Graficar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(40,0,'O')                                         % Grafica de puntos
plot(20,20,'O')                                        % Grafica de puntos
plot(0,0,'O')                                          % Grafica de puntos
plot(0,30,'O')                                         % Grafica de puntos

hold on;                                % Se dejan los gráficos anteriores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% REDIMENSIONAMIENTO DE LA PRESENTACIÓN DEL GRÁFICO %%%%%%%%%%%%%%%%%%%%%
axis([-5 65 -2 45])
grid on                        % Se agrega malla para apreciar los límites

plot([-2 65],[0 0])                                    % Grafica del eje x
title('Gráfico de Soluciones Factibles')              % Nombre del Gráfico
xlabel('Neveras utilitarias')                           % Nombre del Eje x
ylabel('Neveras de Lujo')                               % Nombre del Eje y

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gráfica de la Región Factible %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Para pintar el área interna de la región factible empleamos:
x=0:20;
y=0:20;
y=30-0.5.*x;                                         % Segunda Restricción
area(x,y)         %Define el Área 1 para la región de soluciones factibles
colormap Lines                                        % Pintamos el Área 1

x=20:40;
y=20:40;
y=40-x;                                              % Primera Restricción
area(x,y)        % Define el Área 2 para la región de soluciones factibles
colormap Lines                                        % Pintamos el Área 2

sym x
solve(30-0.5.*x,40-x)















