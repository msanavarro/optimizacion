function [output] = ackley(x,y)
%ACKLEY Summary of this function goes here
%   Detailed explanation goes here
output = -20*exp(-.2*sqrt(abs(.5*(x^2+y^2)))) - exp(.5*(cos(2*pi*x)+cos(2*pi*y))) + exp(1) + 20;
end

