function [ wnet ] = nForce_dL( w, xStart, xEnd )
%NETFORCE_DISTRIBUTEDLOADS Calculates the net force acting in the given range of distributed load 
%   Takes input as the distributed load value and the range in which it
%   acts

wnet = w*abs((xEnd - xStart));


end

