testdata = rand(8,3);
if not(isequal(MakeColumnVector(testdata), MakeColumnVector(testdata')))
    error([newline mfilename ': ' newline 'Not equal' newline]);
end

testdata = rand(8,2);
if not(isequal(MakeColumnVector(testdata), MakeColumnVector(testdata')))
    error([newline mfilename ': ' newline 'Not equal' newline]);
end


testdata = rand(8,1);
if not(isequal(MakeColumnVector(testdata), MakeColumnVector(testdata')))
    error([newline mfilename ': ' newline 'Not equal' newline]);
end

disp('No errors');