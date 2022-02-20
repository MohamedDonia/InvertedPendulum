clear all;
close all;
clc
control_switch =1;       %[ 1--> control work   0---> control doesn`t work]
%% ---options---%
reltol=1e-5;
abstol=[1 1 1 1e-1 1 1e-1 1 1e-1]*1e-5;
options=odeset('RelTol',reltol,'AbsTol',abstol);
%----IC-------%
t_solve=0:.05:8;
Ic= [0 0 -4*pi/180 0 1*pi/180 0 0 0];
%% ----control-----%
r0=[1;0;0;0;0;0;0;0];                                  %reference point    

%place :

%K=1000*[-0.0372   -0.1654   -1.6992   -0.2759    7.5788    0.6235   -8.3649   -2.0303]*control_switch; % -0.0715   -0.2432   -1.7710   -0.3700    7.8562    0.5554   -9.0876   -2.2511
K=1000*[-0.0833   -0.1715   -1.5200   -0.2784    5.5283    0.4368   -5.7797   -1.4307]*control_switch;


%% ----solve----%
[T,YY]=ode45(@(t,y) pendulum_eom(t,y,K,r0),t_solve,Ic,options);

pendulum(1.2, T(:,1), YY(:,1), YY(:,3), YY(:,5), YY(:,7));

figure;
plot(T,YY(:,1),T,YY(:,2),'LineWidth',2);
legend('position','velocity');
grid on;
figure;
plot(T,YY(:,3),T,YY(:,4),'lineWidth',2);
legend('theta 1','theta 1 dot');
grid on;
figure;
plot(T,YY(:,5),T,YY(:,6),'LineWidth',2);
legend('theta 2','theta 2 dot');
grid on;
figure;
plot(T,YY(:,7),T,YY(:,8),'LineWidth',2);
legend('theta 3','theta 3 dot');
grid on;
