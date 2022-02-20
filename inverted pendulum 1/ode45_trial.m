%{
Simple ODEs that have a single solution component can be specified as an anonymous 
function in the call to the solver. The anonymous function must accept two inputs (t,y), 
even if one of the inputs is not used in the function.

Solve the ODE:
  y′=2t
  
  we now that the solution of this ode is y = t^2 + c      
  where c is a constant and can ge obtained from initial condition
%}
t_span = linspace(0, 26.1, 1000);
[t, y] = ode45(@vdp, t_span, [0 0]);

plot(y(:, 1), y(:,2))
grid('on')
grid('minor')
axis('equal')