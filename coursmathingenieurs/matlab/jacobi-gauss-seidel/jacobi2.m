% Rsolution de systmes linaires - Mthode de Jacobi

% Matrice et second membre
A = [ 3 -1 0 ; -1 3 -1 ; 0 -1 3 ];

B = [ 7 ; -6 ; 4 ];

% Solution exacte
X = A\B;

% Nombre d'itrations
nit = 10;

% Matrices M et N pour la methode de Jacobi
M = diag ( diag(A) );
N = M - A;

% 1re approximation de la solution
XJ = [ 0 ; 0 ; 0 ];

% Erreur et residu
R = zeros(1,nit);
Err = zeros(1,nit);

% Iterations de Jacobi
for i = 1:10
   
    disp (['*** Iteration de Jacobi ',num2str(i)]); 
    
    % Calcul du residu
    disp ('Residu');
    RIt = norm ( B - A*XJ )
    R(i) = RIt;
    
    % Calcul de l'erreur
    disp ('Erreur');
    ErrIt = norm ( X - XJ )
    Err(i) = ErrIt;
    
    % Nouvelle approximation par la formule de Jacobi
    disp ('Approximation de la solution');
    XJ = M\(N*XJ+B)
    
end

% Affiche l'volution de l'erreur et du rsidu

figure, hold on, grid on;
plot(R);
xlabel('Nombre d''iterations');
ylabel('Rsidu');

figure, hold on, grid on;
plot(Err);
xlabel('Nombre d''iterations');
ylabel('Erreur');



