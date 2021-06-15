% CALCULATERELATIVEDISTANCE
% BY: 2020  M. Schrauwen (markschrauwen@gmail.com)
function [relativeDistance] = calculateTrajectDistance(vector)
rowVector =  transposeToRowVector(vector);
reference = rowVector(1,:);
elementWiseDifference = diff(reference-rowVector);
squaredDifferences = elementWiseDifference.^2;
relativeDistanceElements = sqrt(sum(squaredDifferences,2));
relativeDistance = sum(relativeDistanceElements);

    function [rowVector] = transposeToRowVector(vector)
        [rows,cols] = size(vector);
        if cols>rows
            rowVector = vector';
        else
            rowVector = vector;
        end
    end

end

