clear all; close all; clc;
[currPath, nmCurrFile] = fileparts(mfilename('fullpath'));
cd(currPath)
nmCur = replace(nmCurrFile,'_test','');
nmOri = 'src_data';
apOri = fullfile(currPath,nmOri);


% % TEST 0
% load(fullfile(apOri,'source1.mat'))
% tst = feval(nmCur,'X',x,'Y',y,'PLOT');
% drawEllipseOnXYdata('X',x','Y',y')

% TEST 1
% Create some random data
s = [2 2];
x = randn(334,1);
y1 = normrnd(s(1).*x,1);
y2 = normrnd(s(2).*x,1);
drawEllipseOnXYdata(y1,y2);