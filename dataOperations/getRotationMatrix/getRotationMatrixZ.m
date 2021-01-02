function rotmat = getRotationMatrixZ(angleDegree)
rotmat = [1 0 0;
    0 cosd(angleDegree) -sind(angleDegree);
    0 sind(angleDegree)  cosd(angleDegree);];
end

