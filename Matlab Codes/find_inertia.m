function [ I ] = find_inertia( type, args )
%FIND_INERTIA Summary of this function goes here
%   Detailed explanation goes here

    I = 0;
    if strcmp(type,'RECT')
        b = args(1);
        d = args(2);
        I = find_rect_inertia(b,d);
    else
        if strcmp(type,'CIRCLE')
            r = args(1);
            I = find_circle_inertia(r);
        else
            if strcmp(type,'I')
                b1 = args(1);
                h1 = args(2);
                b2 = args(3);
                h2 = args(4);
                b3 = args(5);
                h3 = args(6);
                I = find_i_inertia(b1,h1,b2,h2,b3,h3); 
            end
        end
    end



end

