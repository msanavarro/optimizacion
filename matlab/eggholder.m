function [output] = eggholder(x, y)
%EGGHOLDER Summary of this function goes here
%   Detailed explanation goes here
output = -(y+47)*sin(sqrt(abs(x/2+y+47)))-x*sin(sqrt(abs(x-y-47)));
end

