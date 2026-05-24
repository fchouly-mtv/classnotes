% TD Statistiques no.2 : la régression linéaire.

rg = [];

% Débits
rg.phi1 = 0:7;
rg.phi2 = rg.phi1 * 2;

% Pressions (without noise)
rg.deltap1 = rg.phi1 * 25;
rg.deltap2 = rg.phi2.^2;
rg.deltap3 = rg.phi1 * 25;

% Add noise

rg.deltap1n = round (rg.deltap1 + randn(1,length(rg.phi1)) * 10);
rg.deltap2n = round (rg.deltap2 + randn(1,length(rg.phi1)) * 10);
rg.deltap3n = round (rg.deltap3 + randn(1,length(rg.phi1)) * 200);

% Plot the data

figure, hold on, grid on;

plot ( rg.phi1 , rg.deltap1n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

title ('Patient no. 1');

figure, hold on, grid on;

plot ( rg.phi2 , rg.deltap2n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

title ('Patient no. 2');

% Plot the data

figure, hold on, grid on;

plot ( rg.phi1 , rg.deltap3n , ...
       'marker', '+' , 'markersize', 15 , 'linestyle' , 'none' , ...
       'linewidth' , 3 );

xlabel ('\Phi [l/min]');
ylabel ('\Delta P [Pa]');

title ('Patient no. 3');

% Save the data

save rgdata rg



