function [ def, x ] = def_d_from_func( l,e,def_func,xchanges_def )
%BMD_FROM_FUNC Plots the slope diagram by using the bending slope functions 
%   e--> discrete values of x to be taken
    syms t;
    x = [0:e:l];
    def = [];
    ichanges = 1;
    for i=1:length(x)
        syms t;
        if ichanges < length(xchanges_def)
			
            if xchanges_def(ichanges) <= x(i)  && x(i) < xchanges_def(ichanges + 1)
                func = def_func(ichanges);
                t = x(i);
                val = subs(func);
                def= [def val];
            else
                ichanges = ichanges + 1;
                if ichanges <= length(xchanges_def)
                    syms t;
                    func = def_func(ichanges);
                    t = x(i);
                    val = subs(func);
                    def = [def val];
                
                end
            end
        end
        %clc
    end
    plot(x,def);
    title('Deflection graph');
end