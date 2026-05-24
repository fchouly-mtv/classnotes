% Test of the 2D FE code of Martin Gander & Felix Kwok
% Solve the Poisson's Problem in a unit square.
% - \Delta u = 1, u = 0.
% ***

% Create a square mesh
[N,T,P]=NewMesh(0);
% Refine the mesh
[N,T]=RefineMesh(N,T);
%[N,T]=RefineMesh(N,T);
%[N,T]=RefineMesh(N,T);
%[N,T]=RefineMesh(N,T);
% Plot the mesh
figure; 
PlotMesh(N,T,P);

% Define a constant source term 'f' and a zero Dirichlet boundary condition 'g'
f = @(x,y) ones(size(x));
g = @(x,y) zeros(size(x));

% Build and solve the FE problem
U=FEPoisson(f,g,N,T);

% Plot the solution
figure;
PlotSolution3D(U,N,T);
