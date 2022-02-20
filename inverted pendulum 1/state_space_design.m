clc;
close all;
clear all;

%% system inputs ::
M=1.5;
m=0.5;
l=1.2;
k1=1;  % linear velocity friction coefficient 
k2=0.05;  % rotional velocity friction coefficint
g=9.81;
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
eigen_val=eig(A);  % un stable system 
%% plot root locus :
sys = ss(A,B,C,D);
P_old = pole(sys)
rlocus(sys)
grid on;
Image = getframe(gcf);
imwrite(Image.cdata, 'rlocus_open.jpg', "Quality", 100);


%% design control law  of unstable system
p=[-.2-0.1*i -.2+0.1*i -5-4*i -5+4*i];  % desired  eigen values 
K=place(A,B,p)

A_new=A-B*K;
sys_new = ss(A_new,B,C,D);
P = pole(sys_new)
figure;
rlocus(sys_new)
Image = getframe(gcf);
imwrite(Image.cdata, 'rlocus_closed.jpg', "Quality", 100);


