function saveOpenFigsAndCloseThem(title,apFigure,varargin)
% SAVEOPENFIGSANDCLOSETHEM <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)

% $Revision: 0.0.0 $  $Date: 2019-05-27 $
% Creation of this function.
% $Revision: 0.0.1 $  $Date: 2019-06-25 $
% Add functionality for saving output as Matlab Fig file. MS2019


% Test for right input
minargin = 2;
maxargin = minargin+4;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end
blTightPlot = false;
blCreateFig = false;
blMaxFig = false;
timeForMaxFigure = 2;
if nargin > minargin
    for narg = 1:nargin
        try
            sc = upper(varargin{narg});
            switch sc
                case {'TIGHT','T'}
                case {'FIG','F'}
                    blCreateFig = true;
                case {'MAXFIG','M','MAXIMUMSIZEFIGURE'}
                    blMaxFig = true;
                case {'TIMETOMAX','T2M'}
                    timeForMaxFigure = varargin{narg+1};
                otherwise
            end
        catch
        end
    end
end

if ~exist(apFigure,'dir')
    mkdir(apFigure)
end

if blMaxFig
    set(findall(gcf,'type','Figure'),'windowstate', 'fullscreen');
    pause(timeForMaxFigure); % Give some time to maximize
end

figHandles = findobj('Type', 'figure');

for nH = 1:length(figHandles)
    if length(figHandles) > 1
        nNumFig = ['_' num2str(nH)];
    else
        nNumFig = '';
    end
    h = figHandles(nH);
    pause(2); % Give some time to maximize
    try
        if blTightPlot
            saveTightFigure(h,fullfile(apFigure,[title nNumFig '_.png']));
        else
            saveas(h,fullfile(apFigure,[title nNumFig '_.png']));
        end
        if blCreateFig
            saveas(h,fullfile(apFigure,[title nNumFig]));
        end
    catch err
        txterror = ['' newline];
        txterror = [txterror '' newline];
        error([mfilename ': ' newline err.message newline txterror]);
    end
end
close all;

