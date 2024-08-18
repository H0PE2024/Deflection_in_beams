function [ f ] = convert_decimal_expression( exp )
%CONVERT_DECIMAL_EXPRESSION Converts expressions to approximate forms
%   Made to convert weird fractions to decimals in the expressions

    f = []; %stores decimal form of expressions
    n = length(exp);
    
    for i=1:n
        f = [f vpa(exp(i))]; %making the array of expressions
    end

end

