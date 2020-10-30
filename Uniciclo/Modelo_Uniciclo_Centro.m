clc  % Clear Command Window
clear %Remove items from workspace, freeing up system memory
close all % Remove specified figure

ts=0.1; % sample time
t=0:ts:30; % vector time

ur=0.1*ones(1,length(t)); % linear velocity (right wheel)
ul=0.1*ones(1,length(t));% linear velocity (left wheel)


hx(1)=0;   % initial position (x axis) in m
hy(1)=0;   % initial position (y axis) in m
phi(1)=0;  % initial orientation in rad

d=0.5; % distance between wheels

for k=1:length(t)  % Loop simulation
   
     % Kinematic Model
    hxp(k)=((ur(k)+ul(k))/2)*cos(phi(k));
    hyp(k)=((ur(k)+ul(k))/2)*sin(phi(k));
    phip(k)=(ur(k)-ul(k))/d;
    
    %numerical integral (Euler Method)
    hx(k+1)=hx(k)+ts*hxp(k);
    hy(k+1)=hy(k)+ts*hyp(k);
    phi(k+1)=phi(k)+ts*phip(k);
    
end

scene=figure;  % new figure
tam=get(0,'ScreenSize');
set(scene,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
axis equal; % Set axis aspect ratios
axis([-2 4 -2 2 -0.5 1]); % Set axis limits 
view([135 35]);
grid on; % Display axes grid lines

MobileRobot; % Parameters of robot
M1=MobilePlot(hx(1),hy(1),phi(1)); % Plot robot in initial position hx,hy and phi orientation
hold on; % Retain current plot when adding new plot
M2=plot3(hx(1),hy(2),zeros(1),'r'); % plot trayectory.
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Label axis
camlight right

step=10; % position step

for i=1:step:length(t) % Loop emulation
    delete (M1)
     M1=MobilePlot(hx(i),hy(i),phi(i)); hold on
     plot3(hx(1:i),hy(1:i),zeros(1,i),'b','LineWidth',2); % plot trayectory.
    pause(ts)
end