function [ I ] = find_i_inertia( b1,h1,b2,h2,b3,h3 )
%FIND_I_INERTIA Finds second moment of inertia of IBeam
%   A2 is the top part, where 0 is initially
    I = 0;
    A1 = b1*h1;
    A2 = b2*h2;
    A3 = b3*h3;
    
    N = (h3/2*A3 + (h3 + (h1/2)) * A1 + (h3 + h1 + (h2/2)))/(A1+A2+A3);
    
    I1 = find_rect_inertia(b1,h1) + A1*((h1/2)+h3 - N)^2; %middle
    I2 = find_rect_inertia(b2,h2) + A2*(h3 + h1 + (h2/2) - N)^2; %top
    I3 = find_rect_inertia(b3,h3) + A3*((h3/2) - N)^2; %bottom
    
    I = I1 + I2 + I3;
    
    %b1, h1 --> middle part of Ibeam
    %b2, h2 --> top part of ibeam
    %b3, h3 --> bottom part of the beam
    
    


end

