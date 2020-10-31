function runAllTests()
clc;
commandWindowLine()
[ap.thisFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile);
addpath(genpath(ap.thisFile));

results = runtests(pwd,'IncludeSubfolders',true);
rt = table(results);
sortrows(rt, 'Duration')
rmpath(genpath(ap.thisFile));
commandWindowLine()

    function commandWindowLine()
        disp(['======================== ' mfilename ' ========================']);
    end
end
