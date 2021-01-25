function out = randWithinBounds(lowerbound,upperbound,numrows,numcols)
rng('shuffle');

if not(exist('numrows','var'))
    numrows = 1;
end
if not(exist('numcols','var'))
    numcols = 1;
end

out = (upperbound-lowerbound).*rand(numrows,numcols) + lowerbound;
end