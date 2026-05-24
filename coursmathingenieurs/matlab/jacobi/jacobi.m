% Résolution de systèmes linéaires - Méthode de Jacobi

% Matrice et second membre
A = [ -2 1 1 ; 1 -2 0 ; 1 0 -2 ];

B = [ 1 ; 1 ; 1 ];

% Solution exacte
X = A\B;

% Nombre d'itérations
nit = 10;

% Matrices M et N pour la méthode de Jacobi
M = diag ( diag(A) );
N = M - A;

% 1re approximation de la solution
XJ = [ 0 ; 0 ; 0 ];

% Erreur et résidu
R = zeros(1,nit);
Err = zeros(1,nit);

% Itérations de Jacobi
for i = 1:10
   
    disp (['*** Iteration de Jacobi ',num2str(i)]); 
    
    % Calcul du résidu
    disp ('Résidu');
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

% Affiche l'évolution de l'erreur et du résidu

figure, hold on, grid on;
plot(R);
xlabel('Nombre d''itérations');
ylabel('Résidu');

figure, hold on, grid on;
plot(Err);
xlabel('Nombre d''itérations');
ylabel('Erreur');



