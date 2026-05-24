% Interpolation de Lagrange de la fonction sin(pi/2 x)

% Tracé de la fonction

x = 0:0.01:1;

f = sin(pi/2*x);

figure, hold on, grid on

plot ( x , f , 'linestyle' , '-');

% Le polynôme d'ordre 1

p1 = x;

plot ( x , p1 , 'linestyle' , '--' );

% Le polynôme d'ordre 2

p2 = x .* ( sqrt(2) + (x-0.5) * (2-2*sqrt(2)) );

plot ( x , p2 , 'linestyle' , '-.' );

% Le polynôme d'ordre 4

p4 = x .* ( 1.5 + (x-1/3) .* ( -0.5147 + (x-1/2) .* ...
     ( -0.5290 + (x-2/3) * 0.1753 ) ) ); 

plot ( x , p4 , 'linestyle' , ':' );
 
% Fin de l'affichage

xlabel('x');
ylabel('y');

legend('f','p1','p2','p4');

title('La fonction f et ses interpolees d''ordre 1,2 et 4');

% Erreur L1 d'interpolation

erreur1 = quad(@interpun,0,1)
erreur2 = quad(@interpdeux,0,1)
erreur4 = quad(@interpquatre,0,1)




