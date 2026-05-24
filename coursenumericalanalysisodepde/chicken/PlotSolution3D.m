function PlotSolution3D(u,N,T);
% PLOTSOLUTION3D plots a solution given on a triangular mesh
%   PlotSolution3D(u,N,T); plots in 3D the solution vector u on the mesh
%   given by nodes N and triangles T also coding u as z=u(x,y)
trisurf(T(:,1:3),N(:,1),N(:,2),u','facecolor','interp');
%view(10,40);
title('FE solution to an elliptic problem')
