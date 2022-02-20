function K=control_design(p)
% linearized model control design 

%% system inputs ::
M=1.5;
m1=1;
m2=.5;
l1=1.2;
l2=1;
k1=0;  % linear velocity friction coefficient 
k2=.05;  % rotional velocity friction coefficint
k3=.05;
g=9.81;
%% system matrix & control matrix 
A=[0 1 0 0 0 0;...
   0 -k1 / M -g * (m1 + m2) / M k2 / M / l1 0 0;...
   0 0 0 1 0 0;...
   0 0.1e1 / l1 / M * k1 g / l1 * (M * m1 + M * m2 + m1 ^ 2 + m1 * m2) / M / m1 -k2 * (M + m1) / l1 ^ 2 / M / m1 -0.1e1 / l1 / m1 * g * m2 0.1e1 / l1 / m1 * k3 / l2;...
   0 0 0 0 0 1;...
   0 0 -g / l2 * (m1 + m2) / m1 k2 / l2 / m1 / l1 g / l2 * (m1 + m2) / m1 -k3 * (m1 + m2) / l2 ^ 2 / m1 / m2;];

B=[0;...
    11/M;...
    0;...
    -1/l1/M;...
    0;...
    0];
C=[1 0 1 0 1 0];
D=0;
eigen_val=eig(A);  % un stable system 
%% design control law  of unstable system
K=place(A,B,p);
A_new=A-B*K;

end


