close all;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

nm.rawData = 'DATA_RAW';
nm.testData = 'DATA_TEST';
ap.rawData = fullfile(ap.thisFile,nm.rawData);
ap.testData = fullfile(ap.thisFile,nm.testData);
try
    rmdir(nm.testData,'s');
catch end

mkdir(nm.testData);
copyfile([nm.rawData filesep '*'],nm.testData);

%% Do some testing
try
    % TEST 1
    cellExt2Keep = {'.m' '.mlx' '.txt' '.csv'};
    removeFilesFromDirs(ap.testData,cellExt2Keep);
    cd(ap.testData);
    stcAllFile = dir(['**' filesep '*']);
    stcFilesToKeep = stcAllFile(~[stcAllFile.isdir]);
    stcFilesToKeep = stcFilesToKeep(~contains({stcFilesToKeep.name}',cellExt2Keep));
    if ~isempty(stcFilesToKeep)
        error(['Test 1 of: ' mfilename ' Failed miserably']);
    end
    disp(['Test 1 of: ' mfilename ' succeeded']);
    cd(ap.thisFile);
    
    % TEST 2
    nm.Empty = 'empty';
    mkdir(nm.Empty);
    ap.Empty = fullfile(ap.thisFile,nm.Empty);
    
    cellExt2Keep = {'.m' '.mlx' '.txt' '.csv'};
    removeFilesFromDirs(ap.Empty,cellExt2Keep);
    cd(ap.Empty );
    stcAllFile = dir(['**' filesep '*']);
    stcFilesToKeep = stcAllFile(~[stcAllFile.isdir]);
    stcFilesToKeep = stcFilesToKeep(~contains({stcFilesToKeep.name}',cellExt2Keep));
    if ~isempty(stcFilesToKeep)
        error(['Test 2 of: ' mfilename ' Failed miserably']);
    end
    disp(['Test 2 of: ' mfilename ' succeeded']);
    cd(ap.thisFile);
    rmdir(ap.Empty,'s');
    
catch err
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([newline mfilename ': ' newline err.message newline txterror]);
    cd(ap.thisFile);
    rmdir(nm.testData,'s');
end
cd(ap.thisFile);
rmdir(ap.testData,'s');