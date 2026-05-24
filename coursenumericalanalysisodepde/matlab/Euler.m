% Forward Euler scheme to solve an ODE
% *************************************

% *** Initialization

% To increase the numerical precision
format long;

% Time interval to solve
T = 2;
% Subdivision of the interval
N = 10000;
% Time step
tau = T/N;

% Initial value
y0 = 1; 
% Function for the ODE : y' = f(y,t)
function ydot = fOde (y, t)
  ydot = -1.5*y;
endfunction

% Discretization of the time interval
TInt = 0:tau:T;

% *** 1 : closed-form solution
yexact = y0*exp(-1.5*TInt)';

% *** 2 : Octave solver
yoctave = lsode('fOde',y0,TInt);

% *** 3 : forward Euler solver
yEuler = zeros(1,N+1);
yEuler(1) = y0;
for n=1:N 
   yEuler(n+1) = yEuler(n) + tau*fOde(yEuler(n),TInt(n));
end

% *** Final display
figure, hold on, grid on
plot(TInt,yexact);
plot(TInt,yoctave);
plot(TInt,yEuler);
legend('Closed form solution','Octave solution','forward Euler solution')
xlabel('t'), ylabel('y(t)')
title('Solution of linear ODE y''=alpha*y')

% *** Error at time T
disp('Numerical error at time T : Octave solution')
abs(yexact(end)-yoctave(end))
disp('Numerical error at time T : forward Euler solution')
abs(yexact(end)-yEuler(end))

