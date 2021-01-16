function tightAxis(ax)
% TIGHTAXIS draw the given axis as tight as possible
%
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

% $Revision: 0.0.0 $  $Date: 2020-04-27 $
% Creation of this function.

if ~exist('ax','var')
    ax = gca;
end

set(ax, 'units', 'normalized');
Tight = get(ax, 'TightInset');
acc = 0.001;
set(ax, 'Position', [Tight(1)+acc Tight(2)+acc 1-Tight(1)-Tight(3)-2*acc 1-Tight(2)-Tight(4)-acc]);
end %function
