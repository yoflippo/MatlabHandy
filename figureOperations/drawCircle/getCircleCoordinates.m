function [x,y] = getCircleCoordinates(radius,offsetX,offsetY,steps)
if not(exist('steps','var'))
    steps = 360;
end

if not(exist('offsetX','var'))
    offsetX = 0;
end

if not(exist('offsetY','var'))
    offsetY = 0;
end

p = linspace(0,2*pi,steps);
x = radius * cos(p) + offsetX;
y = radius * sin(p) + offsetY;
end

