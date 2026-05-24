function N=SmoothMesh(N,T,bn);
% SMOOTHMESH smooth mesh closer to improve mesh quality
%   Nr=SmootheMesh(N,T,bn); modify node positions iteratively to get
%   closer to a Delauny triangulation, by iteratively assigning to
%   nodes the averages of neighboring nodes. Node numbers in bn are
%   not allowed to have their position be modified

nn=size(N,1);
Nn=zeros(nn,1);
nt=size(T,1);                    % number of triangles
if nargin<3
  bn=[];
end
for i=1:nt                       % first find boundary nodes
  for j=1:3
    if T(i,3+j)==1 || T(i,mod(3+j+1,3)+4)==1 
      if isempty(find(bn==T(i,j)))
        bn=[bn T(i,j)];
      end
    end    
  end    
end    
for i=1:nt                       % construct neigboring node list
  for j=1:3
    if isempty(find(bn==T(i,j))) % not a boundary node
      for k=1:2                  % add neigboring nodes from triangle
        id=find(Nn(T(i,j),2:Nn(T(i,j),1)+1)==T(i,mod(j+k-1,3)+1));
        if isempty(id)
          Nn(T(i,j),1)=Nn(T(i,j),1)+1;
          Nn(T(i,j),Nn(T(i,j),1)+1)=T(i,mod(j+k-1,3)+1);
        end
      end
    end
  end
end  
for i=1:10
  for j=1:nn
    if Nn(j,1)>0
      N(j,:)=mean(N(Nn(j,2:Nn(j,1)+1),:));
    end
  end
end