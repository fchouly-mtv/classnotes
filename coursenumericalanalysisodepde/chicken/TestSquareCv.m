% Test of the 2D FE code of Martin Gander & Felix Kwok
% Solve the Poisson's Problem in a unit square.
% - \Delta u = 1, u = 0.
% ***

% Double precision
format long

% Create a square mesh
[N,T,P]=NewMesh(0);
% Refine the intial mesh
for i=1:1
  [N,T]=RefineMesh(N,T);
end
% Plot the initial mesh
figure; 
PlotMesh(N,T,P);

% Define a constant source term 'f' and a zero Dirichlet boundary condition 'g'
f = @(x,y) ones(size(x));
g = @(x,y) zeros(size(x));

% Store the computation time
Utime = [];
% Store the degrees of freedom
Uddl = [];
% Store the values of Umax
UmaxVal = [];
% Loop for different levels of refinement
Nref = 8;
for i=1:Nref
  disp ('*** Refinement level')
  i
  % Time
  tic
  % Build and solve the FE problem
  U=FEPoisson(f,g,N,T);
  t=toc
  % Store the values
  Utime = [ Utime t ];
  Uddl = [ Uddl length(U) ];
  UmaxVal = [ UmaxVal max(U) ];
  % Refine the mesh
  if i<Nref [N,T]=RefineMesh(N,T); end;
end

% Display the values
Utime
Uddl
UmaxVal


% Plot the final solution
figure;
PlotSolution3D(U,N,T);
