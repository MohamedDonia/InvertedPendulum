clear all;
close all;
clc
control_switch =1;       %[ 1--> control work   0---> control doesn`t work]
%% ---options---%
reltol=1e-5;
abstol=[1 1 1 1e-1 1 1e-1]*1e-5;
options=odeset('RelTol',reltol,'AbsTol',abstol);
%----IC-------%
t_solve=0:.05:8;
Ic= [0 0 -5*pi/180 0 0*pi/180 0];
%% ----control-----%
r0=[1;0;0;0;0;0];                                  %reference point    

%place :
%
%K=[1.8711   15.8049 -475.3885  -21.0505  885.6593  232.7376]*control_switch;          %p=[-.2-0.1*i -.2+0.1*i -5-4*i -5+4*i -6+5i -6-5i]
%K=[6.3619   32.8036 -486.4752   -1.3720  978.0265  267.3809]*control_switch;          %p=[-.4-0.1*i -.4+0.1*i -5-4*i -5+4*i -6+5i -6-5i]
%K=1000*[0.0378    0.0919   -0.4991    0.0674    1.2941    0.3826]*control_switch;     %p=[-1-0.1*i -1+0.1*i -5-4*i -5+4*i -6+5i -6-5i]
%K=1000*[0.0846    0.1505   -0.4860    0.1359    1.6023    0.4917]*control_switch;     %p=[-1.5-0.1*i -1.5+0.1*i -5-4*i -5+4*i -6+5i -6-5i]
% lqr :
%K=1000*[0.3333    0.4985   -1.0300    0.5109    4.6413    1.4655]*control_switch;     %R=[(1/100)^2]
%K=1000*[0.1667    0.2539   -0.6778    0.2436    2.5380    0.7947]*control_switch;     %R=[(1/50)^2]
%K=1000*[.1000    0.1557   -0.5313    0.1365    1.6858    0.5232]*control_switch;     %R=[(1/30)^2]
%K=1000*[0.0833    0.1310   -0.4932    0.1098    1.4700    0.4544]*control_switch;     %R=[(1/25)^2]
K=[33.3333   56.2147 -369.1853   29.1378  803.2926  242.5991]*control_switch;        %R=[(1/10)^2]


%% ----solve----%
[T,YY]=ode45(@(t,y) pendulum_eom(t,y,K,r0),t_solve,Ic,options);

pendulum(T(:,1), YY(:,1), 1.2, 1.2, YY(:,3), YY(:,5));

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


energy_calc(T, YY)
mechanical_power(T, YY, K, r0)