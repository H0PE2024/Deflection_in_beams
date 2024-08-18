function [ xchanges_def, def_func,xchanges_slope, slope_func] = find_deflection_func( ns,xs,M_func,xchanges_M, E,I )
%FIND_DEFLECTION_FUNC Finds piecewise function of deflection and its slopes along with xcoordinates where function changes its definition (constants of
%integration not found out yet

    syms t;
    syms a;
    syms b;
    xchanges_def = []; % stores x coordinates where functions change their definition
    xchanges_slope = []; %stores xcoordinates where slope function changes its definition
    def_func = []; %stores the expressions in piecewise definitions of the function definitions
    slope_func = []; %stores the function form of slope
    
    xchanges_def = xchanges_M; %As function changes value when M changes its value
    xchanges_slope = xchanges_def; %As function changes value when M changes its value
    
    %[xchanges_slope, slope_func] = find_slope_func(ns,xs,M_func,xchanges_M, E, I);
    n = length(xchanges_def); %length of varying arrays
    
    values = zeros(n,1); %C1x + C2
    A = zeros(n,n); %matrix for helping to find first constant of integration
    C1 = zeros(n,1); %Second constant of integration after integrating Slope
    
    %%%%%%%%%%%%%%%%%%%% FINDING DOUBLE INTEGRATION OF MOMENT PART ONLY OF DEFLECTION   %%%%%%%%%%%%%%%%%%%% 
    syms t;
    for i = 1:n
        def_func = [def_func int(int(M_func(i),t),t)];
    end
    
    %%%%%%%%%%%%%%%%%%%% FINDING SINGLE INTEGRATION OF MOMENT PART ONLY OF DEFLECTION SLOPE  %%%%%%%%%%%%%%%%%%%% 
    syms t;
    for i = 1:n
        slope_func = [slope_func int(M_func(i),t)];
    end
    
    %%%%%%%%%%%%%%%%%%%%% FINDING FIRST CONSTANT OF INTEGRATION  %%%%%%%%%%%%%%%%%%%%%
    xstart = xs(1);
    xend = xs(ns);
    istart = 0; %stores index of first support coordinate
    iend = 0; %stores index of last support coordinate
    
    for i=1:n
        if (xchanges_def(i) == xstart)
            istart = i;
        end
        if (xchanges_def(i) == xend)
            iend = i;
        end
    end
    
    n2 = iend - istart; %sub part of beam from which support starts and till it ends    
    
    A = zeros(n2,n2)+t*zeros(n2,n2);
    C1 = zeros(n2,1)+t*zeros(n2,1);
    B = zeros(n2,1)+t*zeros(n2,1);
    msum = 0;
    
    for i=istart:iend-1
        syms t;
        A(1,i - istart + 1) = xchanges_def(i+1) - xchanges_def(i);
        
        func = def_func(i);
        t = xchanges_def(i+1);
        msum = msum + subs(func);
        syms t;
        t = xchanges_def(i);
        msum = msum - subs(func);
        
        A(i - istart + 2,i - istart + 1) = 1;
        A(i - istart + 2,i - istart + 2) = -1;
        
        syms t;
        func1 = slope_func(i+1);
        func2 = slope_func(i);
        t = xchanges_def(i+1);
        val1 = subs(func1);
        val2 = subs(func2);
        
        B(i - istart + 2,1) = val1 - val2;
    end
    B(1,1) = - msum;   
    
    C1 = inv(A) * B;
    
    
    %including deflection and slope function using first constant of integration
    for i=istart:iend-1
        syms t;
        slope_func(i) = slope_func(i) + C1(i-istart+1);
        def_func(i) = def_func(i) + C1(i-istart+1) * t;
    end
    %A*C1 = B
    
       
    %finding constants if any after remaining part of the beam for the deflection
    
    istart2 = iend;
    iend2 = n;
    
    if 1 < istart2 <= iend2
        for i=istart2:iend2
            func1 = slope_func(i-1);
            func2 = slope_func(i);
            t = xchanges_def(i);
            val = subs(func1) - subs(func2);
            slope_func(i) = slope_func(i) + val;
            syms t;
            def_func(i) = def_func(i) + val*t;
            
            %Ensuring continuity of deflection equation
            syms t;
            func1 = def_func(i-1);
            func2 = def_func(i);
            val = 0;
            if istart2 == iend
                t = xchanges_def(i);
                val = subs(-func2);
            else
                t = xchanges_def(i);
                val = subs(func1) - subs(func2);
            end          
            def_func(i) = def_func(i) + val;
        end
    end
    
    
    %finding constants if any for previous part of start of the beam
    istart2 = istart - 1;
    iend2 = 1;
    i = istart2;
    while i >=iend2
        i
        func1 = slope_func(i+1);
        func2 = slope_func(i);
        t = xchanges_def(i+1);
        val = subs(func1) - subs(func2);
        slope_func(i) = slope_func(i) + val;
        syms t;
        def_func(i) = def_func(i) + val*t;
        
        %ensuring continuity of the deflection function
        
        syms t;
        func1 = def_func(i+1);
        func2 = def_func(i);
        i+1
        if (i+1 == istart)
            t = xchanges_def(i+1);
            val = subs(-func2);
        else
            t = xchanges_def(i+1);
            val = subs(func1) - subs(func2);
        end
        
        def_func(i) = def_func(i) + val;
        
        i = i - 1;
    end
    
    %Ensuring continuity of deflection between supports (from start of
    %first support till end of first support
    for i=istart:iend
            syms t;
            if i == istart
                func1 = 0;
            else
                func1 = def_func(i-1);
            end
            
            func2 = def_func(i);
            %func2 = 0;
            if i==istart
                t = xchanges_def(i);
                val = - subs(func2);
            else
                t = xchanges_def(i);
                val = subs(func1) - subs(func2);
            end
            
            def_func(i) = def_func(i) + val;
    end
        
    
    slope_func = slope_func/(E*I);
    def_func = def_func/(E*I);
%     slope_func = convert_decimal_expression(slope_func);
%     def_func = convert_decimal_expression(def_func);
       
end

