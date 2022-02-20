function dx=pendulum_eom(t,x, K, r0)
% pendulum parameters 
M=1.5;
m=0.5;
l=1.2;
k1=1;  % linear velocity friction coefficient 
k2=0.05;  % rotional velocity friction coefficint
g=9.81;

F=-K*(x-r0);    % force applied to the cart
%-----%

dx=zeros(4,1);  % system states
% equation of motion 
%{
dx(1)=x(2);
dx(2)=1/(M+m-m*cos(x(3))^2)*(m*l*x(4)^2*sin(x(3))-m*g*sin(x(3))*...
        cos(x(3))+k2*x(4)*cos(x(3))-k1*x(2)+F);
dx(3)=x(4);
dx(4)=-1/(m*l*(M+m-m*cos(x(3))^2))*(l*m^2*x(4)^2*sin(2*x(3))/2-M*m*g*sin(x(3))-k1*m*x(2)*cos(x(3)) ...
        -m^2*g*sin(x(3))+F*m*cos(x(3))+k2*M*x(4)+k2*m*x(4));
%}

dx(1) = x(2);
dx(2) = 1/(-m*l+l*(m+M)*sec(x(3))^2) * (l*(F-k1*x(2))*sec(x(3))^2 -g*l*m*tan(x(3))+x(4)*sec(x(3))*(k2+l^2*m*x(4)*tan(x(3))));
dx(3) = x(4);
dx(4) = -1/(l^2*m*(m+M-m*cos(x(3))^2))*((m+M)*(k2*x(4)-g*l*m*sin(x(3))) + l*m*cos(x(3))*(F-k1*x(2)+l*m*x(4)^2*sin(x(3))));

end




