function angleBetweenVectors_test()

if ~isequal(angleBetweenVectors([0 1 0],[1 0 0]),90)
    error()
end

if ~isequal(angleBetweenVectors([0 1],[1 0]),90)
    error('2 x 2d, 90 deg')
end

if ~isequal(angleBetweenVectors([0 1],[0 1]),0)
    error('2 x 2d, 0 deg')
end

if ~isequal(angleBetweenVectors([0 1 0],[0 1 0]),0)
     error('2 x 3d, zero deg')
end

if ~(abs(angleBetweenVectors([1 2 3],[3 2 1])-44.42)<0.01)
     error('2 x 3d (44deg)')
end

if ~(abs(angleBetweenVectors([1000 2 3],[3 2 1000])-89.66)<0.01)
       error('2 x 3d')
end

if ~isequal(angleBetweenVectors([-1 -2 -3],[1 2 3]),180)
       error('2x3d vector')
end

if ~isequal(round(angleBetweenVectors([-1 -2],[1 2])),180)
    error('2 2d vectors 180')
end

if ~(length(angleBetweenVectors([-1 -2 -3; -1 -2 -2; -2 2 -2],[1 2 3]))==3)
       error('3x3d + 1x 3d vector')
end

disp([mfilename ':  NO ERRORs']);
end