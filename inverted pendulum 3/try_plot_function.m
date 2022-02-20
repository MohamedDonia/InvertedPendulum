close all
l = 1.2;
t = linspace(0, 10, 200);
position = linspace(0, 2, 200);
angle1 = linspace(-pi/2, pi/2, 200);
angle2 = linspace(-pi/2, pi/2, 200);
angle3 = linspace(-pi/2, pi/2, 200);
pendulum(l,t,position,angle1,angle2, angle3)