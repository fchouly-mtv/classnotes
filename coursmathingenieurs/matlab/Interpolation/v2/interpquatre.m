function f = interpquatre ( x )
    
    f = abs( sin(pi/2*x) - ...
        x .* ( 1.5 + (x-1/3) .* ( -0.5147 + (x-1/2) .* ...
     ( -0.5290 + (x-2/3) * 0.1753 ) ) ) );
    
    
    