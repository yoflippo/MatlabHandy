function getPrincipalAxisOf2dData_test()
close all; clearvars;
load(mfilename)
usedData = tableData2;
dataMatrix = [usedData.SpineBase_X usedData.SpineBase_Z];
scatter(dataMatrix(:,1),dataMatrix(:,2));
grid on; grid minor;
% title(['Area: ' num2str(round(area,1))]);
[PA] = getPrincipalAxisOf2dData(dataMatrix);
hold on;
meanX = mean(dataMatrix(:,1));
meanY = mean(dataMatrix(:,2));
drawEllipseQuiver(meanX,meanY,PA.x1,PA.y1);
drawEllipseQuiver(meanX,meanY,PA.x2,PA.y2);
axis equal
end

