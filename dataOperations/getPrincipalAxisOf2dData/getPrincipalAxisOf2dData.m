function [areaEllipse] = getPrincipalAxisOf2dData(mat)
% ------------------------------------------------------------------------
%    Copyright (C) 2020  M. Schrauwen (markschrauwen@gmail.com)
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------
%
% DESCRIPTION:
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               -X:   x data vector
%               -Y:   y data vector
%               -PLOT: optional, some plots of the data, ellipse and
%               eigenvectors.
%
% RETURN:
%               
%
% EXAMPLES:
%               
%


%% Check format data
[r, c] = size(mat);
if r > 2 && c > 2
    mat = MakeColumnVector(mat);
end

%% Determining the Ellipse based on principal component analysis
%source: http://iopscience.iop.org/article/10.1088/0967-3334/17/4/008/meta
xdatanorm = xdata-mean(xdata);
ydatanorm = ydata-mean(ydata);

A = [xdatanorm ydatanorm];
covariance = cov(A);

[eigenvector, diagonal] = eig(covariance);
eigenvalue1 = max(diagonal(:,1)); % The diagonal contains the variance
eigenvalue2 = max(diagonal(:,2));
pax = scaleEigenvectors(norminv(0.99));
areaEllipse = round(pi*sqrt(pax.x1^2+pax.y1^2)*sqrt(pax.x2^2+pax.y2^2));

%% Plot the data
apFig = [plotName '.png'];
if ~exist(apFig,'file') && (blPlotEllipse || blSavePlot)
    h=figure('units','normalized','outerposition',[0.5 0.5 0.5 0.5]);
    if ~blPlotEllipse
        set(h, 'Visible', 'off')
    end
    
    plot(xdatanorm,ydatanorm,'Color',0.9*[1 1 1],'LineWidth',0.5); 
    hold on;
    drawEllipseQuiver(0,0,pax.x1,pax.y1); 
    drawEllipseQuiver(0,0,pax.x2,pax.y2);
    drawFilledEllipse('red');
    
    cmap = jet(length(xdatanorm)); % Make 1000 colors.
    scatter(xdatanorm, ydatanorm, 40, cmap,'.')
    grid on;
    grid minor;
    axis equal;
    
    if blSavePlot
        apFig = [plotName '.png'];
        saveas(gcf,apFig);
        close all
    end
end

    function drawEllipseQuiver(x1,y1,x2,y2)
        lengthQuiver = sqrt((abs(x2-x1)^2)+(abs(y2-y1)^2));
        quiver(x1,y1,x2,y2,'LineWidth',1,'MaxHeadSize',5/lengthQuiver,'Color',[0 0 0]);
    end

    function drawFilledEllipse(color)
        [X,Y] = calculateEllipse(0,0,sqrt(pax.x1^2+pax.y1^2), ...
            sqrt(pax.x2^2+pax.y2^2), ...
            90+atand(eigenvector(1,1)/eigenvector(1,2)),50);
        patch(X,Y,color,'FaceAlpha',.1);
        plot(X,Y,'k','LineWidth',1);
        axis equal;
    end

    function pax = scaleEigenvectors(z)
        pax.x2 = eigenvector(1,2)*sqrt(eigenvalue2)*z;
        pax.y2 = eigenvector(2,2)*sqrt(eigenvalue2)*z;
        pax.x1 = eigenvector(1,1)*sqrt(eigenvalue1)*z;
        pax.y1 = eigenvector(2,1)*sqrt(eigenvalue1)*z;
    end
end%function