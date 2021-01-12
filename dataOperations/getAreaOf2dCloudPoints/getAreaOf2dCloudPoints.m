function [areaCoM,pgon] = getAreaOf2dCloudPoints(mat)
[r,c] = size(mat);
if r > 2 && c > 2
    error([newline mfilename ': ' newline 'Expected a 2D matrix' newline]);
end

mat = unique(mat,'rows');
idx = boundary(mat(:,1),mat(:,2));
outerPoints = mat(idx,[1 2]);

warning off
pgon = polyshape(outerPoints(1:end-1,1),outerPoints(1:end-1,2));
warning on
areaCoM = area(pgon);
end