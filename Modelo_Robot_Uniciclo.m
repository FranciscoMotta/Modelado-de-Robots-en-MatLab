clc % Limpiamos la ventana de comandos 
clear all % Removemos los items del work space
close all % Cerramos las ventanas que esten abiertas
%%%%%%%%%%%%%%%%%%%%%% SOLO EN UNA POSICIÓN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%Definimos la posición deseada
hx=-1;
hy=-0.5;
phi=0;

fig=figure; %Creamos una nueva figura
set(fig,'position',[10 60 980 600]); %Posición en la ventana
axis('image'); %Seteamos los ejes en realción a las medidas de los objetos 

axis([-2 2 -2 2 -0.1 1]); %Ponemos los limites de los ejes
grid on; %Activamos las cuadriculas de los ejes

MobileRobot; % Añadimos los parámetros del robot
M1=MobilePlot(hx,hy,phi); % Ploteamos al robot en la posición deseada
hold on; %Mantenemos los gráficos anteriores y añadimos los nuevos
plot(hx,hy,'Or'); %Dibujamos un circulo en la posición deseada
xlabel('x(m)'); ylabel('x(m)'); zlabel('z(m)'); % Etiquetas de los ejes
camlight('right'); %Introducimos una luz artificial

%%%%%%%%%%%%%%%%%%%%%%%%Vectores de posicion%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
ts=0.1; %Tiempo de muestreo
tf=2; %Tiempo final
vectorTiempo=0:ts:tf;

%Posición y orientamiento del robot
hx=0.5*vectorTiempo;
hy=0.6*ones(1,lenght(vectorTiempo));
phi=-pi/4*ones(1, lenght(vectorTiempo));

fig=figure;
set(fig,'position',[10 60 980 600]);
axis equal;
axis([-1 3 -2 2 -0.2 1]); %Ponemos los limites de los ejes
grid on;

MobileRobot; % Añadimos los parámetros del robot
M1=MobilePlot(hx(1),hy(1),phi(1)); % Ploteamos al robot en la posición deseada
hold on; %Mantenemos los gráficos anteriores y añadimos los nuevos
plot(hx,hy,'b','LineWidth',2); %Dibujamos un circulo en la posición deseada
xlabel('x(m)'); ylabel('x(m)'); zlabel('z(m)'); % Etiquetas de los ejes
camlight('right'); %Introducimos una luz artificial

step = 1;

for i=1:step:length(vectorTiempo)
    delete(M1)
    M1 = MobilePlot(hx(i),hy(i), phi(i)); hold on
    
    pause(ts)
end
%%