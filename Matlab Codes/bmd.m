function [ M, x ] = bmd( l,e,ns,np,nw,nm,xs,xpf,xsw,xew,xm,sf,pf,w,m  )
%BMD Makes bending moment diagram from various parameters given
%  

    x = [0:e:l];
    M = [];
    for i=1:length(x)
        M = [M find_moment(x(i),e,ns,np,nw,nm,xs,xpf,xsw,xew,xm,sf,pf,w,m)];
    end
    plot(x,M);


end

