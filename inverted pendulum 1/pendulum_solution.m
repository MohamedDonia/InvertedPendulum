clear all;
close all;
clc

control_switch =1;       %[ 1--> control work   0---> control doesn`t work]
%% ---options---%
reltol=1e-5;
abstol=[1 1 1 1e-1]*1e-5;
options=odeset('RelTol',reltol,'AbsTol',abstol);
%----IC-------%
t_solve=.05:.05:10;
Ic= [0 0 -20*pi/180 0];
%% ----control-----%
r0=[1;0;0;0];                                  %reference point    
% control input designed using pole placement
% place
%K =[-0.3761   -4.1041 -101.4201  -22.2783]*control_switch;         % p=[-.2-1*i -.2+1*i -5-4*i -5+4*i];      %  E=1.0583 
%K =[-1.9560   -9.0166 -114.9032  -29.2533]*control_switch;         % p=[-.5+0.1*i -.5-0.1*i -5-4*i -5+4*i];  %  E =1.1045
%K =[-7.5982  -17.9636 -141.7694  -41.7897]*control_switch;         % p=[-1+0.1*i -1-0.1*i -5-4*i -5+4*i];    %  E=1.5391
%K =[-30.1670  -38.7058 -211.9805  -70.2803]*control_switch;        % p=[-2+0.1*i -2-0.1*i -5-4*i -5+4*i];    % E=4.3186
%K =[-120.4422  -91.5828 -418.3172 -140.9326]*control_switch;       % p=[-4+0.1*i -4-0.1*i -5-4*i -5+4*i];    % E=26.042
%K =[-270.9009 -159.6499 -712.5399 -229.8132]*control_switch;       % p=[-6+0.1*i -6-0.1*i -5-4*i -5+4*i];    % unstable


% lqr
%K =[-0.3333   -2.7421  -49.4148  -15.2510]*control_switch;         % R=[1^2]    % E=2.5335
%K =[-3.3333   -7.0928  -71.3021  -23.0695]*control_switch;         % R=[(1/10)^2]    % E=2.4715
K =[-13.3333  -19.0408 -133.0988  -46.0356]*control_switch;         % R=[(1/40)^2]    % E=3.1659             % optimal case
%K =[-16.6667  -22.9713 -154.0385  -53.8904]*control_switch;         % R=[(1/50)^2]    % E=3.2757
%K =[-33.3333  -42.6968 -260.5963  -93.9197]*control_switch;         % R=[(1/100)^2]    % E=3.2757
%K =1000*[-0.3333   -0.3999   -2.2144   -0.8280]*control_switch;     % R=[(1/1000)^2]    % E=3.1476


%% ----solve----%
[T,YY]=ode45(@(t,y) pendulum_eom(t,y, K, r0),t_solve,Ic, options);
% plot the results

pendulum_plot(1.2,T(:,1),YY(:,1),YY(:,3));
figure;
plot(T,YY(:,3),'lineWidth',2, T,YY(:,4),'lineWidth',2);
legend('theta','theta dot');
grid on;
figure;
plot(T,YY(:,1),'lineWidth',2, T,YY(:,2),'LineWidth',2);
legend('position','velocity');
grid on;


energy_calc(T, YY)
mechanical_power(T, YY, K, r0)

