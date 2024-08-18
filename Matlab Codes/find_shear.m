function [ V ] = find_shear( x,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w )
%FIND_SHEAR Finds shear at a point
%   Takes various parameters as input
    
    V = 0;
    
    %Adding effects due to point forces
    for i=1:np
        if xpf(i) <= x
            V = V - pf(i);
        end
    end
        
    %Adding effects due to support forces
    for i=1:ns
        if xs(i) <= x
            V = V - sf(i);
        end
    end
    
    %Adding effects due to distributed forces
    for i=1:nw
        if xsw(i) <= x
            %calculating net force which has to be taken 
            if xew(i) <= x
                xtaken = xew(i);
            else
                xtaken = x;
            end
            V = V - nForce_dL( w(i), xsw(i), xtaken );
        end
    end
    V
end

