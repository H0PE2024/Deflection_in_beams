function [ exp ] = find_expressions_from_symbols( p, q, f )
%FIND_EXPRESSIONS_FROM_SYMBOLS Summary of this function goes here
%   Detailed explanation goes here
    syms a;
    syms b;
    
    a = p;
    b = q;
    n = length(f);
    
    exp = [];
    
    for i=1:n
        exp = [exp subs(f(i))];
    end

end

