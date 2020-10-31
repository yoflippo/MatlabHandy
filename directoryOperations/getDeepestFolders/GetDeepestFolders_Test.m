%% Setup test values
clearvars; close all; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)
ap.testdirs = fullfile(ap.thisFile,'testdirs');
mkdir(ap.testdirs);
addpath(genpath(ap.thisFile));
addpath(genpath(ap.testdirs));
testCase.dir = ap.testdirs;
warning off
runTests(testCase)
warning on
rmpath(genpath(ap.testdirs));
cd(ap.thisFile)
pause(1);
rmdir(ap.testdirs,'s');
rmpath(genpath(ap.thisFile));


%% Place tests BELOW

function checkDepthOf1DeepestFolderSimple_test(testCase)
testDir1 = fullfile(testCase.dir,makeDirs(testCase.dir));
cd(testDir1);
try
    dirs = GetDeepestFolders(testDir1);
    assert(~isempty(dirs));
    assert(length(dirs) == 1);
catch err
    isError([nameCaller() ' ' err.message])
    rmdir(testDir1,'s');
end
cd(testCase.dir);
rmpath(genpath(testDir1));
pause(1);
rmdir(testDir1,'s');
end


function checkDepthOf2DeepestFolderSimple_test(testCase)
testDir1 = fullfile(testCase.dir,makeDirs(testCase.dir));
cd(testDir1);
makeDirs(testDir1);
try
    dirs = GetDeepestFolders(testDir1);
    assert(~isempty(dirs));
    assert(length(dirs) == 2);
catch err
    isError([nameCaller() ' ' err.message])
    rmdir(testDir1,'s');
end
cd(testCase.dir);
rmpath(genpath(testDir1));
pause(1);
rmdir(testDir1,'s');
end



%% Place tests ABOVE




function rootdir = makeDirs(apOriginal)
rootdir = num2str(randi(1000));
dirname = fullfile(apOriginal,rootdir);
for n = 1:5
    mkdir(dirname);
    cd(dirname);
    dirname = num2str(n*randi(1000));
end
cd(apOriginal)
end

















function runTests(testCase)
localfunctionsVar = localfunctions;
if not(isempty(localfunctionsVar))
    for nT = 1:length(localfunctionsVar)
        currentFunction = localfunctionsVar{nT};
        currentFunctionName = functions(currentFunction).function;
        if isUnitTestMethod(currentFunctionName)
            currentFunction(testCase);
        end
    end
    disp([mfilename ' Tests runned succesfull']);
else
    disp([mfilename ' Tests NOT runned!!']);
end
end

function bl = isUnitTestMethod(currentFunctionName)
bl = contains(currentFunctionName,'test','IgnoreCase',true) && ...
    not(isequal(currentFunctionName,'runTests')) && ...
    not(contains(currentFunctionName,'isUnitTestMethod'));
end

function isError(infoTxt)
error([newline mfilename ': ' newline blanks(30) infoTxt ': LOOK HERE' newline]);
end

function name = nameCaller()
stack = dbstack;
name = stack(2).name;
end