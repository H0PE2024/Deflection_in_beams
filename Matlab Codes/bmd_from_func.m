function [ M, x ] = bmd_from_func( l,e,M_func,xchanges_M )
%BMD_FROM_FUNC Plots the bending diagram by using the bending moment functions 
%   e--> discrete values of x to be taken
    syms t;
    x = [0:e:l];
    M = [];
    ichanges = 1;
    for i=1:length(x)
        syms t;
        if ichanges < length(xchanges_M)
            if xchanges_M(ichanges) <= x(i) && x(i) < xchanges_M(ichanges + 1)
                func = M_func(ichanges);
                t = x(i);
                val = subs(func);
                M = [M val];
            else
                ichanges = ichanges + 1;
                if ichanges <= length(xchanges_M)
                    syms t;
                    func = M_func(ichanges);
                    t = x(i);
                    val = subs(func);
                    M = [M val];
                
                end
            end
        end
        %clc
    end
    
    plot(x,M);
    title('Bending Moment Diagram');
end