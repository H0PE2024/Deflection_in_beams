function [ X ] = diff_points( m, n, x_ref, x_com )
%DIFF_POINTS Calculates difference of elements in reference array (x_ref) with every other element
%of the other array (x_com) and returns a matrix
% Parameters passed are the dimensions of the matrix to be formed. The array of
% elements supplied is also a parameter
syms a; syms b;
X = zeros(m,n);

for i=1:m
    for j=1:n
        X(i,j) = x_com(j) - x_ref(i);
    end
end

end

