function [] = energy_calc(T, X)
  M=1.5;
  m1=1;
  m2=.5;
  l1=1.2;
  l2=1.2;
  k=0.01;  % linear velocity friction coefficient 
  k1=.05;  % rotional velocity friction coefficint
  k2=.05;
  g=9.81;
  
  PE = zeros(length(X(:,1)), 1);
  KE = zeros(length(X(:,1)), 1);
  E = zeros(length(X(:,1)), 1);
  
  for i=1:length(X(:,1))
    PE(i,1) = m1*g*l1*cos(X(i,3)) + m2*g*l2*cos(X(i,5));
    KE(i,1) = 1/2*M*X(i,2).^2 + 1/2*m1*((l1*cos(X(i,3))*X(i,4)).^2+(-l1*sin(X(i,3))*X(i,4)).^2)+ 1/2*m2*((l2*cos(X(i,5))*X(i,6)).^2+(-l2*sin(X(i,5))*X(i,6)).^2);
    E(i,1) = KE(i,1) + PE(i,1);
  
end

figure;
plot(T,PE,'k-','lineWidth',2, T,KE,'k--','lineWidth',2, T,E,'k-.','lineWidth',3);
legend('PE','KE','E');
grid on;

  
  
end
