function [X,Y] = draw2DCovarianceEllipse(P)
n = 50;
alpha  = 2*pi/n*(0:n); 
circle = [cos(alpha);sin(alpha)];
C = chol(P)'; 
ellip = C*circle; X = ellip(1,:); Y = ellip(2,:);
patch(X,Y,'red','FaceAlpha',.1); axis equal;
end

