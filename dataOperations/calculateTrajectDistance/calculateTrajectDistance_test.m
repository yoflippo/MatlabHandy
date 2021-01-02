%% Setup test values
testCase.value1 = [0 0;
                1 1;
                2 2; ];
testCase.value2 = [testCase.value1;
                3 3; ];
testCase.values3D = [0 0 0;
                1 1 1;
                2 2 2;
                3 3 3;
                4 4 4;
                5 5 5; ];

runTests(testCase)

%% Place tests BELOW
function testSimpleValues1(testCase)
    value = calculateTrajectDistance(testCase.value1);
    if not(isequal(value, sqrt(2) * 2))
        isError('testSimpleValues1: value not correct')
    end
end

function testSimpleValues2(testCase)
    value = calculateTrajectDistance(testCase.value2);
    if not(isequal(value, sqrt(2) * 3))
        isError(nameCaller())
    end
end

function testSimpleValues2_Transposed(testCase)
    value = calculateTrajectDistance(testCase.value2');
    if not(isequal(value, sqrt(2) * 3))
        isError(nameCaller())
    end
end

function test3DVector(testCase)
    value = calculateTrajectDistance(testCase.values3D);
    if not(isequal(value, sqrt(3) * (length(testCase.values3D) - 1)))
        isError(nameCaller())
    end
end

%% Place tests ABOVE

function runTests(testCase)
    localfunctionsVar = localfunctions;
    for nT = 1:length(localfunctionsVar) - 3
        currentFunction = localfunctionsVar{nT};
        currentFunction(testCase);
    end
    disp([mfilename ' tests runned succesfull']);
end

function isError(infoTxt)
    error([newline newline mfilename ': ' newline blanks(30) infoTxt newline]);
end

function name = nameCaller()
    stack = dbstack;
    name = stack(2).name;
end