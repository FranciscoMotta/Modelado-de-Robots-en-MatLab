ts=0.3; %Tiempo de muestreo
tf=10; %Tiempo final
t=0:ts:tf;

%Posición y orientamiento del robot
hx=0.5*t;
hy=0.6*sin(pi*t);
phi=(-pi)/2*ones(1,length(t));

fig=figure;
set(fig,'position',[10 60 980 600]);
axis equal;
axis([-1 9 -2 10 0 1]); %Ponemos los limites de los ejes
grid on;

MobileRobot; % Añadimos los parámetros del robot
M1=MobilePlot(hx(1),hy(1),phi(1)); % Ploteamos al robot en la posición deseada
hold on; %Mantenemos los gráficos anteriores y añadimos los nuevos
plot(hx,hy,'b','LineWidth',2); %Dibujamos un circulo en la posición deseada
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Etiquetas de los ejes
camlight('right'); %Introducimos una luz artificial

step = 1;

for i=1:step:length(vectorTiempo)
    delete(M1)
    M1 = MobilePlot(hx(i),hy(i), phi(i)); hold on 
    pause(ts)
end