
% [X,Y] = meshgrid(-512:10:512);                                
% Z = eggholder(X,Y);
% surf(X,Y,Z)

% [X,Y] = meshgrid(-10:.2:10);
% Z = crossintray(X,Y);
% % Z = real(crossintray(X,Y));
% surf(X,Y,Z)

[X,Y] = meshgrid(-1.2:.01:1.2);
Z = (ackley(X,Y));
surf(X,Y,Z)