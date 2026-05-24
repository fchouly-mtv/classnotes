% TD Statistiques no.2 : la régression linéaire. Suite.

% Recupère les données

load rgdata_ref

% *** 1er jeu de données

% Calcul des indicateurs statistiques

LS1.phimoy = sum (rg.phi1) / length(rg.phi1);

LS1.dpmoy  = sum (rg.deltap1n) / length (rg.deltap1n);

LS1.phivar = 1/length(rg.phi1) * sum(rg.phi1.^2) - LS1.phimoy^2;

LS1.dpvar  = 1/length(rg.deltap1n) * sum(rg.deltap1n.^2) - LS1.dpmoy^2;

LS1.covpdp = 1/length(rg.phi1) * sum (rg.phi1.*rg.deltap1n) - LS1.phimoy*LS1.dpmoy;

LS1.rpdp   = LS1.covpdp / sqrt(LS1.phivar * LS1.dpvar);

LS1.beta1  = rg.deltap1(end) / rg.phi1(end);

LS1.beta0  = 0;

LS1.beta1e = LS1.covpdp / LS1.phivar;

LS1.beta0e = LS1.dpmoy - LS1.beta1e * LS1.phimoy;

LS1.error2  = LS1.dpvar * ( 1 - LS1.rpdp^2 );

LS1.error1  = sqrt ( LS1.error2 );

% On trace la droite des moindres carrés

figure, hold on, grid on;

plot ( rg.phi1 , rg.deltap1n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

LS1.phiLS = 0:0.1:7;

LS1.dpLS = LS1.dpmoy + LS1.covpdp / LS1.phivar .* ( LS1.phiLS - LS1.phimoy );
   
plot ( LS1.phiLS , LS1.dpLS , 'marker' , 'none', 'linewidth' , 2 , 'color' , [ 1 0 1 ] );
   
xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

% On affiche et on sauve les calculs

LS1

save LS1data LS1

% *** 2e jeu de données

% 1re tentative : régression avec le modèle y = b1 x + b0

% Calcul des indicateurs statistiques

LS2.phimoy = sum (rg.phi2) / length(rg.phi2);

LS2.dpmoy  = sum (rg.deltap2n) / length (rg.deltap2n);

LS2.phivar = 1/length(rg.phi2) * sum(rg.phi2.^2) - LS2.phimoy^2;

LS2.dpvar  = 1/length(rg.deltap2n) * sum(rg.deltap2n.^2) - LS2.dpmoy^2;

LS2.covpdp = 1/length(rg.phi2) * sum (rg.phi2.*rg.deltap2n) - LS2.phimoy*LS2.dpmoy;

LS2.rpdp   = LS2.covpdp / sqrt(LS2.phivar * LS2.dpvar);

LS2.beta1  = rg.deltap2(end) / rg.phi2(end);

LS2.beta0  = 0;

LS2.beta1e = LS2.covpdp / LS2.phivar;

LS2.beta0e = LS2.dpmoy - LS2.beta1e * LS2.phimoy;

LS2.error1 = LS2.dpvar * ( 1 - LS2.rpdp^2 );

LS2.error2  = sqrt ( LS2.error1 );

% 2e tentative : régression avec le modèle y = b1 x^2 + b0

% Changement de variable préliminaire

rg.phi2s = rg.phi2.^2;

% Calcul des indicateurs statistiques

LS3.phimoy = sum (rg.phi2s) / length(rg.phi2s);

LS3.dpmoy  = sum (rg.deltap2n) / length (rg.deltap2n);

LS3.phivar = 1/length(rg.phi2s) * sum(rg.phi2s.^2) - LS3.phimoy^2;

LS3.dpvar  = 1/length(rg.deltap2n) * sum(rg.deltap2n.^2) - LS3.dpmoy^2;

LS3.covpdp = 1/length(rg.phi2s) * sum (rg.phi2s.*rg.deltap2n) - LS3.phimoy*LS3.dpmoy;

LS3.rpdp   = LS3.covpdp / sqrt(LS3.phivar * LS3.dpvar);

LS3.beta1  = rg.deltap2(end) / rg.phi2s(end);

LS3.beta0  = 0;

LS3.beta1e = LS3.covpdp / LS3.phivar;

LS3.beta0e = LS3.dpmoy - LS3.beta1e * LS3.phimoy;

LS3.error1 = LS3.dpvar * ( 1 - LS3.rpdp^2 );

LS3.error2  = sqrt ( LS3.error1 );

% On trace la courbe des moindres carrés pour les modèles 1 & 2

figure, hold on, grid on;

plot ( rg.phi2 , rg.deltap2n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

LS2.phiLS = 0:0.2:14;

LS2.dpLS  = LS2.dpmoy + LS2.covpdp / LS2.phivar .* ( LS2.phiLS - LS2.phimoy );
   
plot ( LS2.phiLS , LS2.dpLS , 'marker' , 'none', 'linewidth' , 2 , 'color' , [ 1 0 1 ] );
   
LS3.phiLS = 0:0.2:14;

LS3.dpLS  = LS3.dpmoy + LS3.covpdp / LS3.phivar .* ( LS3.phiLS.^2 - LS3.phimoy );
   
plot ( LS3.phiLS , LS3.dpLS , 'marker' , 'none', 'linewidth' , 2 , 'color' , [ 0 1 1 ] );

xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

% On affiche et on sauve les calculs

LS2

save LS2data LS2

LS3

save LS3data LS3

% *** 3e jeu de données

% Calcul des indicateurs statistiques

LS4.phimoy = sum (rg.phi1) / length(rg.phi1);

LS4.dpmoy  = sum (rg.deltap3n) / length (rg.deltap3n);

LS4.phivar = 1/length(rg.phi1) * sum(rg.phi1.^2) - LS4.phimoy^2;

LS4.dpvar  = 1/length(rg.deltap3n) * sum(rg.deltap3n.^2) - LS4.dpmoy^2;

LS4.covpdp = 1/length(rg.phi1) * sum (rg.phi1.*rg.deltap3n) - LS4.phimoy*LS4.dpmoy;

LS4.rpdp   = LS4.covpdp / sqrt(LS4.phivar * LS4.dpvar);

LS4.beta1  = rg.deltap3(end) / rg.phi1(end);

LS4.beta0  = 0;

LS4.beta1e = LS4.covpdp / LS4.phivar;

LS4.beta0e = LS4.dpmoy - LS4.beta1e * LS4.phimoy;

LS4.error2 = LS4.dpvar * ( 1 - LS4.rpdp^2 );

LS4.error1  = sqrt ( LS4.error2 );

% On trace la droite des moindres carrés

figure, hold on, grid on;

plot ( rg.phi1 , rg.deltap3n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

LS4.phiLS = 0:0.1:7;

LS4.dpLS = LS4.dpmoy + LS4.covpdp / LS4.phivar .* ( LS4.phiLS - LS4.phimoy );
   
plot ( LS4.phiLS , LS4.dpLS , 'marker' , 'none', 'linewidth' , 2 , 'color' , [ 1 0 1 ] );
   
xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

% On affiche et on sauve les calculs

LS4

save LS4data LS4









