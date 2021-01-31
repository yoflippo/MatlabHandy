function blIsLeft = isLeft(pointA,pointB,pointC)
%% Function to determine if one vector is greater than 180 deg.
blIsLeft = (pointB(1)-pointA(1)) * (pointC(2)-pointA(2)) - ...
           (pointB(2)-pointA(2)) * (pointC(1)-pointA(1)) > 0;
end