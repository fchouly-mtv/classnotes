function PlotMesh(N,T,P);
% PLOTMESH plots a triangular mesh
%   PlotMesh(N,T,P); plots the mesh given by the nodes N and triangles
%   T. The real boundaries are drawn in bold and for small meshes
%   the node numbers are added as well. If P is given as an input argument,
%   P contains an element by element physical property

clf; axis('equal');
if nargin==3 && ~isempty(P),                     % display material property
  for i=1:size(T,1),                            
    patch(N(T(i,1:3),1),N(T(i,1:3),2),P(i));
  end
end
for i=1:size(T,1),                              % plot mesh
  for j=1:3,
    line([N(T(i,j),1) N(T(i,mod(j,3)+1),1)], ...
      [N(T(i,j),2) N(T(i,mod(j,3)+1),2)],'LineWidth',T(i,j+3)*3+1);
  end
end
m=size(N,1);                                    
if m<100,                                       % dislay mesh nodes for
  for i=1:m,                                    % small meshes
    text(N(i,1)+.01,N(i,2)+.02,num2str(i));
  end
end