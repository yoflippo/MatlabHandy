%% Setup test values
close all; clc;
testCase.data1 = randi(10,1000,1);
testCase.data2 = randn(1000,1)*10;
runTests(testCase)


%% Place tests BELOW
function integerDataRandom_Test(testCase)
try
    figure;
    violinplot(testCase.data1,{'testdata'});
    strMedian = giveStringFromFunction(@median,testCase.data1);
    strMean = giveStringFromFunction(@mean,testCase.data1);
    title(['Median: ' strMedian ', Mean: ' strMean]);
catch err
    isError([nameCaller() ' ' err.message])
end
end

function randomData_Test(testCase)
try
    data = testCase.data2 + 5;
    figure;
    violinplot(data,{'testdata'});
    strMedian = giveStringFromFunction(@median,data);
    strMean = giveStringFromFunction(@mean,data);
    title(['Median: ' strMedian ', Mean: ' strMean]);
catch err
    isError([nameCaller() ' ' err.message])
end
end


%% Place tests ABOVE

function str = giveStringFromFunction(functionHandle,vector)
str = num2str(round(functionHandle(vector),1));
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