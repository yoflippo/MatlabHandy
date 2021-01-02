function rotmat = getRotationMatrixY(angleDegree)
rotmat = [cosd(angleDegree) 0 sind(angleDegree);
    0 1 0;
    -sind(angleDegree) 0  cosd(angleDegree);];
end

