function Ke=ComputeElementStiffnessMatrix(t);
% COMPUTEELEMENTSTIFFNESSMATRIX element stiffness matrix for a triangle
%   Ke=ComputeElementStiffnessMatrix(t); computes the element stiffness matrix
%   for the triangular element described by the three nodal coordinates
%   in t=[x1 y1;x2 y2;x3 y3]. Note that the labelling must be counter clock
%   wise

x1=t(1,1); y1=t(1,2);
x2=t(2,1); y2=t(2,2);
x3=t(3,1); y3=t(3,2);

Jd=-x1*y3-x2*y1+x2*y3+x1*y2+x3*y1-x3*y2;       % formulas from Maple
Ke=1/Jd/2*[(x2-x3)^2+(y2-y3)^2 ...
           -(x2-x3)*(x1-x3)-(y2-y3)*(y1-y3) ...
           (x2-x3)*(x1-x2)+(y2-y3)*(y1-y2)
           -(x2-x3)*(x1-x3)-(y2-y3)*(y1-y3) ...
           (x1-x3)^2+(y1-y3)^2 ...
           -(x1-x3)*(x1-x2)-(y1-y3)*(y1-y2)
           (x2-x3)*(x1-x2)+(y2-y3)*(y1-y2) ...
           -(x1-x3)*(x1-x2)-(y1-y3)*(y1-y2) ...
           (x1-x2)^2+(y1-y2)^2];