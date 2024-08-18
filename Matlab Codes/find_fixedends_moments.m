function [ p, q ] = find_fixedends_moments( slope_func, xchanges_slope, def_func, xchanges_def )
%FIND_FIXEDENDS_MOMENTS Finds unknown values of moments at the ends of the
%fixed ends
%   Uses the fact that at ends, slope is 0 and deflection is 0

    syms t;
    syms a;
    syms b;
    
    
    
    t = 0;
    s1 = subs(slope_func(1)); %slope expression at end1
    d1 = subs(def_func(1)); %deflection at end1
    sa1 = subs(diff(s1,a)); %coefficient of a in s1
    da1 = subs(diff(d1,a)); %coefficient of a in d1
    sb1 = subs(diff(s1,b)); %coefficient of b in s1
    db1 = subs(diff(d1,b)); %coefficient of b in d1
    
    t = xchanges_slope(length(xchanges_slope));
    s2 = subs(subs(slope_func(length(slope_func)))); %slope expression at end
    d2 = subs(subs(def_func(length(def_func)))); %deflection at end2  
    sa2 = subs(diff(s2,a)); %coefficient of a in s2    
    da2 = subs(diff(d2,a)); %coefficient of a in d2    
    sb2 = subs(diff(s2,b)); %coefficient of b in s2    
    db2 = subs(diff(d2,b)); %coefficient of b in d2
    
    a = 0;
    b = 0;
    sc1 = subs(s1); %constants leftover in slope at end 1
    sc2 = subs(s2); %constants leftover in slope at end 2
    dc1 = subs(d1); %constants leftover in deflection at end 1
    dc2 = subs(d2); %constants leftover in deflection at end 1
    
    %Since slopes are zero at the ends of the beam
    A = [sa1 sb1; sa2 sb2];
    C = [sc1; sc2];
    %A*B + C = 0
    B = -pinv(A)*C;
    
    a = B(1);
    b = B(2);
    
    p = a;
    q = b;
end

