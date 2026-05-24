x = 0:0.01:1;

pi3 = x .* (x-1/2) .* (x-1);

figure, hold on, grid on;

plot ( x , pi3 );

xlabel('x');
ylabel('\Pi_3(x)');

title('\Pi_3');

x = 1/2 - sqrt(3)/6;

pi3 = x .* (x-1/2) .* (x-1)

x = 1/2 + sqrt(3)/6;

pi3 = x .* (x-1/2) .* (x-1)

x = 0:0.01:1;

pi4 = x .* (x-1/3) .* (x-1/2) .* (x-2/3) .* (x-1);

figure, hold on, grid on;

plot ( x , pi4 );

xlabel('x');
ylabel('\Pi_4(x)');

title('\Pi_4');
