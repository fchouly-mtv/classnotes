% Dérivée numérique de la fonction 'u(x) = cos(x/3)'

% Valeur exacte de la dérivée seconde 'u''(x)=-1/9*cos(x/3)'

disp 'Valeur exacte de u''''(0)'
ue = -1/9

% Différents pas d'espace h

h = [ 1e0 1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 ];

% Approximation numérique de la dérivée en 0 : 
% 1/h^2 * (u(-h) - 2u(0) + u(h)) = 2/h^2 * ( cos(h/3) - 1 )

disp 'Valeurs approchées de u''''(0)'
ua = 2./h.^2 .* (cos(h/3) - 1)

% Erreurs d'approximation

disp 'Erreurs d''approximation'
abs(ue-ua)

disp 'Erreurs d''approximation (log)'
log10(abs(ue-ua))


