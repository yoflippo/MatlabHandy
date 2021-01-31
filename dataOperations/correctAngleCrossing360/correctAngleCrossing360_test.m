function correctAngleCrossing360_test()
load('anglesexample.mat');

subplot(2,1,1);
plot(angles); grid on; grid minor;

subplot(2,1,2);
angles1 = correctAngleCrossing360(angles);
angles2 = correctAngleCrossing360(-angles);
plot(angles1); hold on;
plot(angles2); 

angles1 = 2*correctAngleCrossing360(angles);
angles2 = 2*correctAngleCrossing360(-angles);
plot(angles1); hold on;
plot(angles2); grid on; grid minor;
end