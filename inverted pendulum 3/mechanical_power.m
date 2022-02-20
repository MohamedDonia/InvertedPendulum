function [] = mechanical_power(T, X, K, r0)
  
  F = zeros(length(X(:,1)), 1);
  W = zeros(length(X(:,1)), 1);
  
  for i=1:length(X(:,1))
    F(i,1) = -K*(X(i,:)' - r0);
    W(i,1) = abs(F(i,1) * X(i,1));
    
  end
  
E = trapz(T, W)

figure;
plot(T,F,'k-','lineWidth',2, T,W,'k--','lineWidth',3);
legend('F', 'W');
grid on;
end
