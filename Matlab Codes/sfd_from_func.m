function [ V, x ] = sfd_from_func( l,e,V_func,xchanges_V )
%SFD_FROM_FUNC Plots the shear force diagram by using the shear force functions 
%   e--> discrete values of x to be taken
    syms t;
    x = [0:e:l];
    V = [];
    ichanges = 1;
    for i=1:length(x)
        syms t;
        if ichanges < length(xchanges_V)
			
            if xchanges_V(ichanges) <= x(i)  && x(i) < xchanges_V(ichanges + 1)
                func = V_func(ichanges);
                t = x(i);
                val = subs(func);
                V = [V val];
            else
                ichanges = ichanges + 1;
                if ichanges <= length(xchanges_V)
                    syms t;
                    func = V_func(ichanges);
                    t = x(i);
                    val = subs(func);
                    V = [V val];
                
                end
            end
        end
        %clc
    end
    plot(x,V);
    title('Shear function');
end