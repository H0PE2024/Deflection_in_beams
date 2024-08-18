function [ F ] = sf_fixed(ns,np,nw,xs,xpf,xwnet,pf,w,wnet,mnet)
%SF_FIXED Calculates support forces in case of all fixed supports 
%   Takes parameters as ns,np,nw,xs,xpf,xwnet,p,w,m
syms a;
syms b;
F = [];
X_pf = diff_points(ns,np,xs,xpf) %Forming the difference between points of the matrix for point forces
X_s = diff_points(ns,ns,xs,xs) %Forming the difference between points of the matrix for support forces (unknown for now)
X_w = diff_points(ns,nw,xs,xwnet) %Forming the difference between points of the matrix for distributed forces with the help of net forces found

A = [];

% X_s*F' + X_pf*P' + X_df*W' + M = 0
% F' = - X_s^-1 * (X_pf*P' + X_df*W' + M) --> Equations used
if np~=0
    A = X_pf * pf';
end
if nw~=0
    if length(A)~=0
        A = A + X_w * wnet';
        %disp('case1');
    else
        A = X_w * wnet';
        %disp('case2');
    end
end

if length(A)~=0
    A = A + mnet*ones(ns,1);
else
    A = mnet*ones(ns,1);
end

F = - pinv(X_s) * (A);

end

