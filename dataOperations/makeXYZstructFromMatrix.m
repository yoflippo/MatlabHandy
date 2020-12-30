function sxyz = makeXYZstructFromMatrix(matrix)
[r,c] = size(matrix);
if not(r==3 || c==3)
    error([newline mfilename ': ' newline ...
        blanks(30) ': LOOK HERE' newline ...
        blanks(30) 'Not a matrix with dimension of 3' newline]);
end
if c > r
    mat = matrix';
else
    mat = matrix;
end
sxyz.x = mat(:,1);
sxyz.y = mat(:,2);
sxyz.z = mat(:,3);
end