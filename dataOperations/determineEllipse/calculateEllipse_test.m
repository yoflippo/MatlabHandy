close all; clear all;
   %# This functions returns points to draw an ellipse
    %#
    %#  @param x     X coordinate
    %#  @param y     Y coordinate
    %#  @param a     Semimajor axis
    %#  @param b     Semiminor axis
    %#  @param angle Angle of the ellipse (in degrees)
    %#
minxax = 0:0.1:10;
minyax = minxax;

rx = 5;
ry = 10;

[X,Y] = calculateEllipse(0,0,rx,ry,0,50);
plot(X,Y); axis equal; hold on;
quiver(0,0,0,ry);
quiver(0,0,rx,0);

%% Draw horizontal line
plot([0 rx],[0 0],'r');
plot([0 0],[0 ry],'r');