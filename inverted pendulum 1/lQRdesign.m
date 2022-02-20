clc;
close all;
clear all;

% LQR design controller with Kalamn Filter
%% system inputs ::
M=1.5;
m=0.5;
l=1.2;
k1=1;  % linear velocity friction coefficient 
k2=.05;  % rotional velocity friction coefficint
g=9.81;
Ic= [0 0 -10*pi/180 0];
%% system matrix & control matrix 
A=[0    1       0           0;...
   0   -k1/M   -m*g/M       k2/l/M;...
   0    0       0           1;...
   0    k1/l/M  g*(M+m)/l/M -k2*(M+m)/l^2/M/m];
B=[0;...
    1/M;...
    0;...
    -1/l/M];
C=[1 0 1 0];
D=0;
eigen_val=eig(A);  % unstable system 
sys=ss(A,B,C,D);
% check obvervability and controllability
rank(ctrb(A,B));
rank(obsv(A,C));
% WO=gram(sys,'o');
% to check obsevability gramian to determine how far it is observable
% the gram command cannot be used for un stable dynamics so we must
% eliminate ubstable pole 
% Aaug=A(2:4,2:4);
% Baug=B(2:4,:);
% Caug=C(:,2:4);
% Daug=zeros(size(Caug,1),size(Baug,2));
% sysaug=ss(Aaug,Baug,Caug,Daug);
% WO=gram(sysaug,'o');
% det(WO)

% we will design controller based on LQR algorithem
Q=[(10/3)^2 0        0           0;...
   0     (1/3)^2   0           0;...
   0     0        (1/pi)^2  0;...
   0     0        0           (1/pi)^2];
R=[(10/40)^2]; 
% this Q,R Matrices based on maximum limits for every state and input
[Kr,S,E]=lqr(A,B,Q,R)
sys=ss(A-B*Kr,B,C,D);


%%
% then design observer based on x measure ment only 
% covariance of disturbance and noise based on 1000 measurement to get
% disturbance and noise .
Wd=0.05*randn(1000,4);   %effect of noise is less than disturbance 
Wn=.5*randn(1000,1);

Vd=cov(Wd);
Vn=cov(Wn);

% then we will design kalman filter 
Kf=(lqr(A',C',Vd,Vn))';
% then build kalman filter system 
sysKF=ss(A-Kf*C,[B Kf],eye(4),0*[B Kf]);
step(sys);