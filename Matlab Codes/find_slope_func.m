function [ xchanges_slope,slope_func ] = find_slope_func( ns,xs,M_func,xchanges_M, E, I )
%FIND_SLOPE_FUNC Finds the slope in the curvatures of the beam by
%integrating the funcs
%   
    syms t;
    
    xchanges_slope = []; %stores coordinates where the slope function changes its definition
    slope_func = []; %stores expressions of the slopes of the functions
    n = length(xchanges_M); %stores length of arrays
    
    xchanges_slope = xchanges_M; %as slope definition will change where moment definition changes
    
    %Adding integrated forms of moment functions
    for i=1:n
        slope_func = [slope_func int(M_func(i))];
    end
    
    %converting to relevant coordinates
    for i=1:n-1
        syms t;
        func = slope_func(i+1);
        t = xchanges_slope(i);
        val = subs(func);
        slope_func(i+1) = func - val;        
    end
    
%     %ensuring continuity in slopes
%     for i = 1:n-1
%         syms t;
%         func1 = slope_func(i);
%         func2 = slope_func(2);
%         t = xchanges_slope(i);
%         val1 = subs(func1);
%         val2 = subs(func2);
%         
%     end
    
    
    slope_func = slope_func/(E*I); %EIdv/dx = -Mx + c

end

