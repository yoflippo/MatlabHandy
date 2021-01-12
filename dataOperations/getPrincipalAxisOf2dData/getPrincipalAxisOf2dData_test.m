function getAreaOf2dCloudPoints_test()
close all; clearvars;
load(mfilename)
usedData = tableData2;
dataMatrix = [usedData.SpineBase_X usedData.SpineBase_Z];
[area,pgon] = getAreaOf2dCloudPoints(dataMatrix);
plot(pgon);
hold on;
scatter(dataMatrix(:,1),dataMatrix(:,2));
grid on; grid minor;
title(['Area: ' num2str(round(area,1))]);
end

