function [ M_func, xchanges_M ] = find_moment_func( l,nm,xm,m,V_func,xchanges_V )
%FIND_MOMENT_FUNC_FUNCTION Finds the functional form of bending moment
%
  syms t;
  syms a;
  syms b;
  
  M_func = []; %stores the functions of bending moments
  xchanges_M = []; %stores the coordinates where bending moment function changes its definition
  im = 1; %stores iterates over the moments supplied externally
  iv = 1; %stores iterates ovr the shear force functions
  val1 = 0; %stores helps in converting the integrated shear functions to the relevant coordinates
  n = 0; %stores length of the varying arrays
  
  xchanges_M = sort([xchanges_V xm]);
  xchanges_M = unique(xchanges_M,'sorted');
  
  n = length(xchanges_M); %number of points where m changes
  
  
  %integrating shear functions
  iv = 1;
  if length(xchanges_V) > 0
      for i=1:n
          if iv < length(xchanges_V)
              if xchanges_M(i) >= xchanges_V(iv) && xchanges_M(i) < xchanges_V(iv+1)
                  M_func = [M_func int(-V_func(iv),t)];
              else
                  iv = iv + 1;
                  M_func = [M_func int(-V_func(iv),t)];
              end
          else
              if xchanges_M(i) >= xchanges_V(iv)
                  M_func = [M_func int(-V_func(iv),t)];
              end

          end      
      end
  else
      for i=1:n
          M_func = [M_func 0]; 
      end
  end
  
  %converting to relevant coordinates t --> x
  for i=1:n
      syms t;
      func = M_func(i);
      t = xchanges_M(i);
      val = subs(func);
      M_func(i) = func - val;
  end
  
  %Adding effects due to externally applied moments
  
  im = 1;
  if length(xm) > 0
    for i = 1:n
        if im <= length(xm)
            if xchanges_M(i) == xm(im)
                M_func(i) = M_func(i) - m(im);
                im = im + 1;
            end
        end
    end
  end
  
  %adding effects due to previous moments
  for i = 1:n-1
      syms t;
      func = M_func(i);
      t = xchanges_M(i+1);
      val = subs(func);
      M_func(i+1) = M_func(i+1) + val;
  end

  %M_func = convert_decimal_expression(M_func);
  
end 
    

