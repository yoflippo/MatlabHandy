function [pax] = getPrincipalAxisOf2dData(mat)
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

%% Check format data
[r, c] = size(mat);
if r > 2 && c > 2
    mat = MakeColumnVector(mat);
end

%% Determining the Ellipse based on principal component analysis
%source: http://iopscience.iop.org/article/10.1088/0967-3334/17/4/008/meta
xdata = mat(:,1);
ydata = mat(:,2);
xdatanorm = xdata-mean(xdata);
ydatanorm = ydata-mean(ydata);

A = [xdatanorm ydatanorm];
covariance = cov(A);

[eigenvector, diagonal] = eig(covariance);
eigenvalue1 = max(diagonal(:,1)); % The diagonal contains the variance
eigenvalue2 = max(diagonal(:,2));
pax = scaleEigenvectors(norminv(0.99));

    function pax = scaleEigenvectors(z)
        pax.x2 = eigenvector(1,2)*sqrt(eigenvalue2)*z;
        pax.y2 = eigenvector(2,2)*sqrt(eigenvalue2)*z;
        pax.x1 = eigenvector(1,1)*sqrt(eigenvalue1)*z;
        pax.y1 = eigenvector(2,1)*sqrt(eigenvalue1)*z;
    end
end%function