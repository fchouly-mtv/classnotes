function [N,T,P]=NewMesh(G);
% NEWMESH generates a simple new mesh for predefined domains
%   [N,T,P]=NewMesh(G); generates an initial coarse triangular
%   mesh. Use G=0 for the default square, G=1 for a triangle, G=2 for
%   a space shuttle and G=3 for an empty micro wave oven, and G=4 for a
%   chicken in a micro wave oven. The result is a table of triangles T
%   which points into a table of nodes N containing x and y
%   coordinates.  The triangle contains in entries 4 to 6 a 1 if its
%   corresponding edges are real boundaries. P can contain for each
%   triangle a material property.
  
P=[];                                               % default no material 
if G==1,                                            % triangle
  N=[0 0; 1 0; 0.5 1];
  T=[1 2 3 1 1 1];
elseif G==2                                         % space shuttle
  N=[0.07 0; 1 0; 1 0.4; 0.8 0.23; 0.25 0.23; 0.15 0.16; 0.07 0.15; 0 0.1 
    0 0.05; 0.93 0.4; 0.5 0; 1 0.1; 1 0.15; 1.12 0.08; 1.12 0.17; 0.15 0
    0.07 0.07; 0.8 0; 0.25 0; 0.9 0.1];
  T=[1 17 9 0 0 1; 9 17 8 0 0 1; 8 17 7 0 0 1; 1 16 17 1 0 0; 17 6 7 0 1 0
     16 6 17 0 0 0; 16 19 6 1 0 0; 19 5 6 0 1 0; 19 11 5 1 0 0; 5 11 4 0 0 1
     11 18 4 1 0 0; 18 20 4 0 0 0; 18 2 20 1 0 0; 2 12 20 1 0 0
     20 12 13 0 0 0; 20 13 4 0 0 0; 4 13 10 0 0 1; 10 13 3 0 1 1; 
     12 14 13 1 0 0; 14 15 13 1 1 0];
elseif G==3                                         % empty microwave
  N=[0 0; 5 0; 0 3; 5 3];
  T=[1 2 4 1 1 0; 1 4 3 0 1 1];
  P=ones(1,2);
elseif G==4                                         % chicken in a microwave
  N=[0.8 0.9; 1.4 0.4; 2   0.3; 3   0.3; 3.5 0.4    % inside
     4   1  ; 3.5 1.6; 3   2  ; 2.5 2.2; 2   2.4 
     1.4 2.4; 1   2  ; 0.5 2  ; 0.3 2.2; 0.2 1.9 
     0.3 1.6; 0.5 1.8; 1   1.8; 1.3 1.4; 1.5 1.8
     2   2  ; 1.5 1  ; 2   1  ; 3   1  ; 3.5 1  
     0   0  ; 1   0  ; 2   0  ; 3   0  ; 4   0      % outside
     5   0  ; 5   3  ; 4   3  ; 2.5 3  ; 1.5 3
     0.8 3  ; 0   3  ; 0   1.9; 0   1  ; 5   1.5];
  T=[13 14 15 0 0 0; 15 16 17 0 0 0; 15 17 13 0 0 0; 17 12 13 0 0 0
     17 18 12 0 0 0; 18 20 12 0 0 0; 18 19 20 0 0 0; 12 20 11 0 0 0
     20 21 11 0 0 0; 21 10 11 0 0 0; 21  9 10 0 0 0;  1 22 19 0 0 0
     22 20 19 0 0 0; 22 23 20 0 0 0;  2 22  1 0 0 0;  2 23 22 0 0 0
     20 23 21 0 0 0; 23  9 21 0 0 0;  2  3 23 0 0 0;  3 24 23 0 0 0
     23 24  9 0 0 0;  3  4 24 0 0 0; 24  8  9 0 0 0; 24  7  8 0 0 0 
     24 25  7 0 0 0; 24  5 25 0 0 0;  4  5 24 0 0 0;  5  6 25 0 0 0
      6  7 25 0 0 0; 26 27  1 1 0 0; 27  2  1 0 0 0; 27 28  2 1 0 0 
     28  3  2 0 0 0; 28 29  3 1 0 0; 29  4  3 0 0 0; 29 30  4 1 0 0
     30  5  4 0 0 0; 30  6  5 0 0 0; 30 31  6 1 0 0; 31 40  6 1 0 0
     32 33 40 1 0 1; 33  7  6 0 0 0; 33  8  7 0 0 0; 33 34  8 1 0 0
     34  9  8 0 0 0; 34 10  9 0 0 0; 34 35 10 1 0 0; 35 11 10 0 0 0
     35 36 11 1 0 0; 36 12 11 0 0 0; 36 13 12 0 0 0; 36 14 13 0 0 0
     36 37 14 1 0 0; 37 38 14 1 0 0; 38 15 14 0 0 0; 38 16 15 0 0 0
     38 39 16 1 0 0; 39  1 16 0 0 0;  1 17 16 0 0 0;  1 18 17 0 0 0
      1 19 18 0 0 0; 39 26  1 1 0 0; 40 33  6 0 0 0];  
  P=[5*ones(1,29) ones(1,34)];
else                                                % default square
  N=[0 0; 1 0; 0 1; 1 1];
  T=[1 2 4 1 1 0; 1 4 3 0 1 1];
end;  
