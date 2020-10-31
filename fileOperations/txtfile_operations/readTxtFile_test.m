clear all; close all; clc;

%% Expect a file called 'data.txt' in close proximity, get abs. path
testCase.pathThisFile = fileparts(mfilename('fullpath'));
testCase.apData = fullfile(testCase.pathThisFile,'TEST_DATA','data.txt');
runTests(testCase)



%% Place tests BELOW

function readFileWithNoSeparatorTest(testCase)
[TXTFILE BELOW] = readTxtFile(testCase.apData);
assert(isempty(BELOW))
end



function readFileWithSeparatorTest(testCase)
[TXTFILE BELOW] = readTxtFile(testCase.apData,'%~>');
assert(~isempty(BELOW))
assert(isequal('textbelowseparator',BELOW));
end


function readSeparatorWithEmptyFile(testCase)
apEmpty = fullfile(testCase.pathThisFile,'TEST_DATA','empty.txt');
[TXTFILE BELOW] = readTxtFile(apEmpty,'%~>');
assert(isempty(TXTFILE))
assert(isempty(BELOW))
end

%% Place tests ABOVE






















function runTests(testCase)
localfunctionsVar = localfunctions;
for nT = 1:length(localfunctionsVar)-3
    currentFunction = localfunctionsVar{nT};
    currentFunction(testCase);
end
disp([mfilename ' Tests runned succesfull']);
end

function isError(infoTxt)
error([newline mfilename mfilename ': ' newline blanks(30) infoTxt ': LOOK HERE' newline]);
end

function name = nameCaller()
    stack = dbstack;
    name = stack(2).name;
end