function [Nr,Tr,Pr]=RefineMesh(N,T,P);
% REFINEMESH refines the mesh by a factor of 4
%   [Nr,Tr,Pr]=RefineMesh(N,T,P); refines the mesh given by the nodes N and
%   the triangles T and physical property P on each triangle by cutting each 
%   triangle into four smaller ones. The boundary is traced so that the new 
%   triangles still contain the information that they are touching the 
%   boundary.

Nr=N;                            % new node list starts with old one
nn=size(N,1);
Tr=zeros(size(T,1)*4,6);         % triangles start from scratch
nt=0;
if nargin==3
  Pr=zeros(1,length(P)*4);
else 
  Pr=[];
end;
NewNid=sparse(nn,nn);
Nid=[1 2;1 3;2 3];
for j=1:size(T,1),               % quadrisect all old triangles
  i=T(j,1:3); n=N(i,:);          % old nodes of current triangle
  for k=1:3
    i1=Nid(k,1);i2=Nid(k,2);
    if i(i1)>i(i2), tmp=i1; i1=i2; i2=tmp; end;   % to only store once  
    if NewNid(i(i1),i(i2))==0
      nn=nn+1; Nr(nn,:)=(n(i1,:)+n(i2,:))/2;
      i(k+3)=nn; NewNid(i(i1),i(i2))=nn;          % store node
    else
      i(k+3)=NewNid(i(i1),i(i2));
    end  
  end
  Tr(nt+1,:)=[i(1) i(4) i(5) T(j,4) 0 T(j,6)];   % insert 4 new triangles
  Tr(nt+2,:)=[i(5) i(4) i(6) 0 0 0];  
  Tr(nt+3,:)=[i(6) i(4) i(2) 0 T(j,4) T(j,5)];  
  Tr(nt+4,:)=[i(6) i(3) i(5) T(j,5) T(j,6) 0];  
  if nargin==3
    Pr(nt+1:nt+4)=P(j);
  end  
  nt=nt+4;
end;

