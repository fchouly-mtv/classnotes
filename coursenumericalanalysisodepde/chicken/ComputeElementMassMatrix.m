function Me=ComputeElementMassMatrix(t);
% COMPUTEELEMENTMASSMATRIX element mass matrix for a triangle
%   Me=ComputeElementMassMatrix(t); computes the element mass matrix
%   for the triangular element described by the three nodal coordinates
%   in t=[x1 y1;x2 y2;x3 y3], where the nodes are labeled counter clock
%   wise

x1=t(1,1); y1=t(1,2);
x2=t(2,1); y2=t(2,2);
x3=t(3,1); y3=t(3,2);

Jd=-x1*y3-x2*y1+x2*y3+x1*y2+x3*y1-x3*y2;       % formulas from Maple
Me=Jd/24*[2 1 1; 1 2 1; 1 1 2];