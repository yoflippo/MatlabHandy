function angles = correctAngleCrossing360(angles)
%% Function to stop  0-360 crossings and let them smoothly continue
diffAngles = [0; diff(angles)];
detectNegativeCrossing = (diffAngles > 350)*-360;
detectPositiveCrossing = (diffAngles < -350)*360;
angles = angles + cumsum(detectNegativeCrossing) + cumsum(detectPositiveCrossing);
end