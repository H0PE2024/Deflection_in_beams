function [ V, x ] = sfd( l,e,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w )
%SFD Plots the shear force diagram 
%   Detailed explanation goes here
    x = [0:e:l];
    V = [];
    for i=1:length(x)
        V = [V find_shear(x(i),ns,np,nw,xs,xpf,xsw,xew,sf,pf,w)];
    end
    plot(x,V);

end

