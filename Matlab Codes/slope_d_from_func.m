function [ slope, x ] = slope_d_from_func( l,e,slope_func,xchanges_slope )
%BMD_FROM_FUNC Plots the slope diagram by using the bending slope functions 
%   e--> discrete values of x to be taken
    
    syms t;
    x = [];
    slope = [];
    n = length(xchanges_slope);
    
    for i=1:n
        if i < n
            x1 = [xchanges_slope(i):e:xchanges_slope(i+1)];
        else
            x1 = [xchanges_slope(i)];
        end
        x = [x x1];
        n2 = length(x1);
        for j=1:n2
            syms t;
            t = x1(j);
            slope = [slope subs(slope_func(i))];
        end
    end
    
    plot(x,slope);
    title('Slope graph');
end