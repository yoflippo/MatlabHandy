function files = findFilesWithExtension(path,ext)
if not(exist('ext','var'))
    ext = '';
end
if exist('path','var')
    files = dir([path filesep '**' filesep '*' ext]);
else
    warning([newline mfilename ': ' newline 'no inputparameter "path" given' newline]);
    files = [];
end
end