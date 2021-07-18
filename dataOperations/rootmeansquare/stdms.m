function [rms] = stdms(differencevector)
[r,c] = size(differencevector);
if r>1 && c>1
    error([newline mfilename mfilename ': ' newline blanks(30) ...
        ': Input "vector" is not a vector' newline]);
end
if any(isnan(differencevector))
    warning([newline mfilename ': ' newline 'NaN values detected' newline]);
    differencevector(isnan(differencevector))=[];
end
rms = sqrt(sum((differencevector-mean(differencevector)).^2)/length(differencevector));
end

