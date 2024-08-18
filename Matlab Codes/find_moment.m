function [ M ] = find_moment( xi,e,ns,np,nw,nm,xs,xpf,xsw,xew,xm,sf,pf,w,m )
%FIND_MOMENT Finds moment at a particular point from shear force
%   
    M = 0;
    x = [0:e:xi];
    for i=1:length(x)
        V = find_shear( x(i),ns,np,nw,xs,xpf,xsw,xew,sf,pf,w );
        M = M - V*e;
    end
    
    for i=1:nm
        if xm(i) <= xi
            M = M - m;
        end
    end
 

end

