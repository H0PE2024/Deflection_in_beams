function [ p ] = find_fixed_pin_moments( slope_func, xchanges_slope, def_func, xchanges_def )
%FIND_FIXEDENDS_MOMENTS Finds unknown values of moments at the ends of the
%fixed ends
%   Uses the fact that at ends, slope is 0 and deflection is 0

    syms t;
    syms a;
     
    
    
    t = 0;
    s1 = subs(slope_func(1)); %slope at end 1 %fixed
    sa1 = subs(diff(s1,a));   
    
    a = 0;
    b = 0;
    sc1 = subs(s1);
    syms a;
    syms b;
    
    %Since slopes are zero at the ends of the beam
    if sa1 ~=0
        a = -sc1/sa1;
    end
    p = a;
    
end

