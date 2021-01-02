function [X,Y] = draw2DCovarianceEllipse(P,xy)
if not(exist('xy','var'))
    xy = [0 0];
end
n = 50;
alpha  = 2*pi/n*(0:n);
circle = [cos(alpha);sin(alpha)];
try %chol() must be positive definite
    C = chol(P)';
    ellip = C*circle; X = ellip(1,:)+xy(1); Y = ellip(2,:)+xy(2);
    fill(X,Y,'green','FaceAlpha',.1); axis equal;
catch
end
end

