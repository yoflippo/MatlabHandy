function angleBetweenVectors_test()

if ~isequal(angleBetweenVectors([0 1 0],[1 0 0]),90)
    error()
end

if ~isequal(angleBetweenVectors([0 1 0],[0 1 0]),0)
    error()
end

if ~(abs(angleBetweenVectors([1 2 3],[3 2 1])-44.42)<0.01)
    error()
end

if ~(abs(angleBetweenVectors([1000 2 3],[3 2 1000])-89.66)<0.01)
    error()
end

if ~isequal(angleBetweenVectors([-1 -2 -3],[1 2 3]),180)
    error()
end

if ~(length(angleBetweenVectors([-1 -2 -3; -1 -2 -2; -2 2 -2],[1 2 3]))==3)
    error()
end

disp([mfilename ':  NO ERRORs']);
end