% Test of the 2D FE code of Martin Gander & Felix Kwok
% Solve a scalar elliptic problem in the microwave with a chicken.
% -c u - div (P grad( u ) ) = 0, u = 1. % (Helmholtz) 
% ***

% Create a square mesh
[N,T,P]=NewMeshChicken(4);
% Refine the mesh
for i=1:3
  [N,T,P]=RefineMesh(N,T,P);
   %N=SmoothMesh(N,T);
end
% Plot the mesh
figure; 
PlotMesh(N,T,P);

% Define a constant source term 'f' and a zero Dirichlet boundary condition 'g'
f = @(x,y) zeros(size(x));
g = @(x,y) ones(size(x));

% Build and solve the FE problem
U=FEElliptic(f,g,N,T,P,-1000);

% Plot the solution
figure;
PlotSolution3D(U,N,T);
