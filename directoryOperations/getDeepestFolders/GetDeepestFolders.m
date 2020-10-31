function dirs = GetDeepestFolders(apStartDir)
dirs = [];
listWithSubDirs = dir(fullfile(apStartDir,'**'));
listWithSubDirs = removeParentFoldersAndFilesFromDirOutput(listWithSubDirs);

if length(listWithSubDirs) == 1
    dirs = apStartDir;
    return ;
end
    
for nD = 1:length(listWithSubDirs)
    csd = listWithSubDirs(nD);
    currentdir = fullfile(csd.folder,csd.name);
    subdirs = dir(currentdir);
    subdirs = removeParentFoldersAndFilesFromDirOutput(subdirs);
    if isempty(subdirs)
        dirs = [dirs; {currentdir}];
    end
end

    function dirOutput = removeParentFoldersAndFilesFromDirOutput(dirOutput)
        dirOutput(contains({dirOutput.name},'.')) = [];
        dirOutput(not([dirOutput.isdir])) = [];
    end
end
