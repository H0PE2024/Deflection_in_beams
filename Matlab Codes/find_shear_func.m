function [ V_func, xchanges_V ] = find_shear_func( l,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w )
%FIND_SHEAR_FUNCTION Finds the functional form of shear force
%
    syms t;
    V_func = [];
    xchanges_V = []; % coordinates of x where shear value fluctuates
    xchanges_V = sort([xs xpf xsw xew]);
    
    if (xchanges_V(length(xchanges_V))~=l)
        xchanges_V = [xchanges_V l];        
    end
    if (xchanges_V(1)~=0)
        xchanges_V = [0 xchanges_V];
    end
    
    xchanges_V = unique(xchanges_V,'sorted');
    n = length(xchanges_V); % total number of coordinates where x changes
    
    for i=1:n
        V_func = [V_func (find_shear(xchanges_V(i),ns,np,nw,xs,xpf,xsw,xew,sf,pf,w)+t*0)]; %finds value of shears only due to support and point forces
    end
    %superimposing effects of distributed loads
    iw = 1;
    for i=1:n
        if iw <= nw
            if xchanges_V(i)==xsw(iw)
                V_func(i) = V_func(i) - w(iw)*(t - xchanges_V(i));
            else
                if xchanges_V(i) > xsw(iw) && xchanges_V(i) < xew(iw)
                    V_func(i) = V_func(i) - w(iw)*(t - xchanges_V(i));
                else
                    if xchanges_V(i) >= xew(iw)
                        iw = iw+1;
                    end                
                end
            end
                
        end
        
   %V_func = convert_decimal_expression(V_func);
   V_func(length(V_func)) = 0;
end

