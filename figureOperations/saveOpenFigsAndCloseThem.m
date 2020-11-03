function saveOpenFigsAndCloseThem(title,apFigure,varargin)

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
    pause(timeForMaxFigure);
end

figHandles = findobj('Type', 'figure');

for nH = 1:length(figHandles)
    if length(figHandles) > 1
        nNumFig = ['_' num2str(nH)];
    else
        nNumFig = '';
    end
    h = figHandles(nH);
    pause(1);
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

