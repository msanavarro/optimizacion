function [output] = crossintray(x,y)
%CROSSINTRAY Summary of this function goes here
%   Detailed explanation goes here
output = -0.0001*(abs(sin(x)*sin(y)*exp(abs(100-(sqrt(x^2+y^2)/pi))))+1)^(0.1);
end

