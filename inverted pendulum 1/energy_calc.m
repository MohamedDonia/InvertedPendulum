function [] = energy_calc(T, X)
  M=1.5;
  m=0.5;
  l=1.2;
  k1=1;  % linear velocity friction coefficient 
  k2=0.05;  % rotional velocity friction coefficint
  g=9.81;
  
  
  PE = zeros(length(X(:,1)), 1);
  KE = zeros(length(X(:,1)), 1);
  E = zeros(length(X(:,1)), 1);
  
  for i=1:length(X(:,1))
    PE(i,1) = m*g*l*cos(X(i,3));
    KE(i,1) = 1/2*M*X(i,2).^2 + 1/2*m*((l*cos(X(i,3))*X(i,4)).^2+(-l*sin(X(i,3))*X(i,4)).^2);
    E(i,1) = KE(i,1) + PE(i,1);
  
end

figure;
plot(T,PE,'k-','lineWidth',2, T,KE,'k--','lineWidth',2, T,E,'k-.','lineWidth',3);
legend('PE','KE','E');
grid on;

  
  
end
