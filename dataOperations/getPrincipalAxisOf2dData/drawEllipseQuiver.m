function drawEllipseQuiver(x1,y1,x2,y2)
lengthQuiver = sqrt((abs(x2-x1)^2)+(abs(y2-y1)^2));
quiver(x1,y1,x2,y2,'LineWidth',1,'MaxHeadSize',5/lengthQuiver);
end