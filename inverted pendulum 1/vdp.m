function [dydt] = vdp(t, y)
  mu = 5;
  dydt = [y(2)+0.001 mu*(1-y(1)^2)*y(2) - y(1)] 
endfunction