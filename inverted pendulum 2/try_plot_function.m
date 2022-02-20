close all
l1 = 1.2;
l2 = 1.2;
t = linspace(0, 10, 200);
position = linspace(0, 2, 200);
angle1 = linspace(-pi/2, pi/2, 200);
angle2 = linspace(-pi/2, pi/2, 200);
pendulum(t,position,l1,l2,angle1,angle2)