function [indices,t0,v0] = findZeroCrossings(v,t)

% indices = find(diff(sign(v))); %% simplest version
addpath(genpath(fullfile(fileparts(mfilename('fullpath')),'crossing')));

if nargin == 1
    indices = crossing(v);
    t0 = [];
    s0 = [];
end
if nargin == 2
    [indices,t0,v0] = crossing(v,t);
end
