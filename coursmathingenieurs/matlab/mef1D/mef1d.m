% Exemple membrane 1D. MEF P1 avec maillage uniforme
% ***

% Maillage
N = 5;
h = 1/(N+1);
x = 0:h:1;

% Matrice K (rigidité) et vecteur F (densité de forces)
K = zeros(N);
K(1,1)=2; 
if (N>1) 
  K(1,2)=-1;
end
for i=2:N-1
	K(i,i-1)=-1;
	K(i,i)=2;
	K(i,i+1)=-1;
end
if (N>1) 
	K(N,N-1)=-1; K(N,N)=2; 
end
K = 1/h * K;

F = h*ones(N,1);

% Décomposition LU de la matrice de rigidité
[LK,UK]=lu(K);

K,LK,UK

% Solution du système et affichages
U = K\F

udisp  = [0 U' 0];
xexact = 0:0.001:1;
uexact = 1/2*xexact.*(1-xexact);
figure, hold on, grid on
plot(xexact,uexact,'linestyle','-.','color','r');
plot(x,udisp,'linewidth',2);
xlabel('x');
ylabel('u');
legend('exact','MEF');

