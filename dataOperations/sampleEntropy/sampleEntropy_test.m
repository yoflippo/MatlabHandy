%% Setup test values
testCase.testSinus = sin([0:1/100:100]);
testCase.line = linspace(1,1,1000);
testCase.random = 10*randn(1,1000);
testCase.random2 = 10*randn(1,1000);
runTests(testCase)

%% Place tests BELOW
function testSinusLowRegularityExpectLowValue(testCase)
value = sampleEntropy(testCase.testSinus,1, 0.2);
if value > 0.1
   isError(nameCaller());
end
end

function testLineLogRegularity(testCase)
value = sampleEntropy(testCase.line,1, 0.2);
if value > 1e-3
   isError(nameCaller());
end
end

function testVeryRandomData(testCase)
value = sampleEntropy(testCase.random ,1, 0.2);
if value < 2
   isError(nameCaller());
end
end


%% Place tests ABOVE
% 
% function runTests(testCase)
% localfunctionsVar = localfunctions;
% for nT = 1:length(localfunctionsVar)-3
%     currentFunction = localfunctionsVar{nT};
%     currentFunction(testCase);
% end
% disp([mfilename ' Tests runned succesfull']);
% end
% 
% function isError(infoTxt)
% error([newline mfilename mfilename ': ' newline blanks(30) infoTxt ': LOOK HERE' newline]);
% end
% 
% function name = nameCaller()
%     stack = dbstack;
%     name = stack(2).name;
% end

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