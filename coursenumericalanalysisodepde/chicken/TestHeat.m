% Test of the 2D FE code of Martin Gander & Felix Kwok
% Solve the Heat equation in a unit square.
% d_t u - \Delta u = 1, u(Boundary) = 0, u(0)=0.
% ***

% Double precision
format long

% Time step
tau = 0.05;

% Create a square mesh
[N,T,P]=NewMesh(0);
% Refine the intial mesh
for i=1:3
  [N,T]=RefineMesh(N,T);
end
% Plot the initial mesh
figure; 
PlotMesh(N,T,P);

% Define a constant source term 'f' and a zero Dirichlet boundary condition 'g'
f = @(x,y) ones(size(x));
g = @(x,y) zeros(size(x));

% Store the values of Umax
UmaxVal = [];

% Initial condition
U = zeros(size(N,1),1);
UmaxVal(1) = max(U);

% Compute the mass and stiffness matrices, and the RHS
[K,M,b] = FEHeat(f,g,N,T);
% The global matrix for the heat
Aheat = inv(M+tau*K);

% Loop for time integration (backward Euler)
Nt = 10;
for i=1:Nt
  disp ('*** Time')
  i*tau
  % Solve the FE problem
  U = Aheat*(tau*b+M*U);
  % Store the values
  UmaxVal(i+1) = max(U);
  disp ('*** Uc')
  max(U)
end

% Plot the final solution
figure;
PlotSolution3D(U,N,T);

% Plot the evolution of the temperature at the center
figure;
plot(0:tau:Nt*tau,UmaxVal);
xlabel('t');
ylabel('Umax');
title('Temperature at the center of the domain');
