function [output, dirs] = findSubFolderPath(absolutePath,rootFolder,nameFolder)
if ~contains(absolutePath,rootFolder)
    error([newline mfilename ': ' newline 'Rootfolder not within absolutePath' newline]);
end
startDir = fullfile(extractBefore(absolutePath,rootFolder),rootFolder);
dirs = dir([startDir filesep '**' filesep '*']);
dirs(~[dirs.isdir])=[];
dirs(contains({dirs.name},'.'))=[];
dirs(~contains({dirs.name},nameFolder))=[];
    warning on
if length(dirs) > 1
    warning([newline mfilename ': ' newline 'Multiple possible folders found' newline]);
    output = dirs;
elseif length(dirs) == 0
    warning([newline mfilename ': ' newline 'No directory found!' newline]);
    output = [];
    return
end
output = fullfile(dirs(1).folder,dirs(1).name);
end
