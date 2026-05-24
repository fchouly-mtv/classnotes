function [K,M,b]=FEHeat(f,g,N,T);
% FEHeat returns the appropriate matrices and vector to solve the heat equation
% with a constant in time source term

n=size(T,1); m=size(N,1);
bn=zeros(m,1);
K=sparse(m,m); M=sparse(m,m);
for i=1:n,
  Ke=ComputeElementStiffnessMatrix([N(T(i,1),:); N(T(i,2),:); N(T(i,3),:)]);
  Me=ComputeElementMassMatrix([N(T(i,1),:); N(T(i,2),:); N(T(i,3),:)]);
  bn(T(i,1))=bn(T(i,1)) || T(i,4) || T(i,6);          % on the boundary
  bn(T(i,2))=bn(T(i,2)) || T(i,4) || T(i,5);
  bn(T(i,3))=bn(T(i,3)) || T(i,5) || T(i,6);
  K(T(i,1:3),T(i,1:3))=K(T(i,1:3),T(i,1:3))+Ke;     % assemble
  M(T(i,1:3),T(i,1:3))=M(T(i,1:3),T(i,1:3))+Me;
end;
b=M*feval(f,N(:,1),N(:,2));                         % right hand side and
%full(b)
for i=1:m,                                          % boundary conditions
  if bn(i)>0,
    b(i)=feval(g,N(i,1),N(i,2));
    K(i,:)=zeros(1,m); K(i,i)=1;
    M(i,:)=zeros(1,m); 
  end;
end;
