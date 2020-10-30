clc  % Clear Command Window
clear %Remove items from workspace, freeing up system memory
close all % Remove specified figure

ts=0.1; % sample time
t=0:ts:20; % vector time

d=0.5; % distance between wheels
a=0.35; % distance a


ur=0.1*ones(1,length(t)); % linear velocity (right wheel)
ul=-0.1*ones(1,length(t)); % linear velocity (left wheel)

% initial center position of robot
x1(1)=0;   % initial position (x axis) in m/s
y1(1)=0;   % initial position (y axis) in rad/s
phi(1)=0;  % initial orientation in rad

% initial point control of robot
hx(1)=x1(1)+a*cos(phi(1));
hy(1)=y1(1)+a*sin(phi(1));


for k=1:length(t)  % Loop simulation
   
    % Kinematic Model
    hxp(k)=((ur(k)+ul(k))/2)*cos(phi(k))-a*((ur(k)-ul(k))/d)*sin(phi(k));
    hyp(k)=((ur(k)+ul(k))/2)*sin(phi(k))+a*((ur(k)-ul(k))/d)*cos(phi(k));
    phip(k)=(ur(k)-ul(k))/d;
    
    %numerical integral (Euler Method)
    hx(k+1)=hx(k)+ts*hxp(k);
    hy(k+1)=hy(k)+ts*hyp(k);
    phi(k+1)=phi(k)+ts*phip(k);
    
    %center position of robot
    x1(k+1)=hx(k+1)-a*cos(phi(k+1));
    y1(k+1)=hy(k+1)-a*sin(phi(k+1));
    
end

scene=figure;  % new figure
tam=get(0,'ScreenSize');
set(scene,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen

axis equal; % Set axis aspect ratios
axis([-4 4 -2 2 -0.1 1]); % Set axis limits 
grid on; % Display axes grid lines

MobileRobot; % Parameters of robot
M1=MobilePlot(x1(1),y1(1),phi(1)); % Plot robot in initial position hx,hy and phi orientation
hold on; % Retain current plot when adding new plot
M2=plot(hx(1),hy(2),'r'); % plot trayectory.

xlabel('x(m)'); ylabel('y(m)'); zlabel('z(x)'); % Label axis
camlight('rigth');
step=10; % position step

for i=1:step:length(t) % Loop emulation
    
    delete (M1)
    M1=MobilePlot(x1(i),y1(i),phi(i)); hold on
     plot(hx(1:i),hy(1:i),'b','LineWidth',2); % plot trayectory.
    pause(ts)
end



