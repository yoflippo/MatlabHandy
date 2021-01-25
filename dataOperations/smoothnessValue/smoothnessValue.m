function [value] = smoothnessValue(vector)
%% WIP
value = mean(xcorr(vector(2:end),vector(1:end-1)));
% value = std(diff(vector))/abs(mean(diff(vector)));
end

