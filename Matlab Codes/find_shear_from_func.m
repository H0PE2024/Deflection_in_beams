function [ V ] = find_shear_from_func( x, V_func, xchanges_V )
%FIND_SHEAR_FROM_FUNC Finds shear from the expression form of the shear
%force at a particular x coordinate
%   
    V = 0;
    syms t;
    
    n = length(xchanges_V); %number of points where the function fluctuates
    
    for i=1:n
        if i < n && xchanges_V(i) <= x && x < xchanges_V(i+1)
            t = x;
            V = subs(V_func(i));
        else
            if i == n && x >= xchanges_V(i)
                t = x;
                V = subs(V_func(i));
            end
        end
    end

end

