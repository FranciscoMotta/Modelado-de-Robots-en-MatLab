clc  % Clear Command Window
clear %Remove items from workspace, freeing up system memory
close all % Remove specified figure

%%%%%%%%%%%%%%%%%%% Only position %%%%%%%%%%%%%%%%%%%
%%
% Position and orientation robot
hx=-1;
hy=2;
phi=pi/2;


scene=figure;  % new figure
tam=get(0,'ScreenSize');
set(scene,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
axis('image'); % Set axis aspect ratios

axis([-2 2 -2 5 -0.1 1]); % Set axis limits 
grid on; % Display axes grid lines


MobileRobot; % Parameters of robot
MobilePlot(hx,hy,phi); % Plot robot in position hx,hy and phi orientation
hold on; % Retain current plot when adding new plot
plot(hx,hy,'Or'); % plot circle in point control.
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Label axis
camlight('rigth');
%%%%%%%%%%%%%%%%%%% vector position %%%%%%%%%%%%%%%%%%%
%%

ts=0.1; %sample time
tf=6; % final time
t=0:ts:tf; % vector time

% Position and orientation robot
hx=0.5*t;
hy=0.6*ones(1,length(t));
phi=pi/4*ones(1,length(t));

scene=figure;  % new figure
tam=get(0,'ScreenSize');
set(scene,'position',[tam(1) tam(2) tam(3) tam(4)]); % position and size figure in the screen
axis equal; % Set axis aspect ratios
axis([-1 4 -2 2 -0.2 1]); % Set axis limits 
grid on; % Display axes grid lines

MobileRobot; % Parameters of robot
M1=MobilePlot(hx(1),hy(1),phi(1)); % Plot robot in initial position hx,hy and phi orientation
hold on; % Retain current plot when adding new plot
plot(hx,hy,'b','LineWidth',2); % plot trayectory.
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Label axis
camlight('rigth');

step=5;

for i=1:step:length(t) % Loop emulation
    delete (M1)
    M1=MobilePlot(hx(i),hy(i),phi(i)); hold on
    pause(ts)
end

