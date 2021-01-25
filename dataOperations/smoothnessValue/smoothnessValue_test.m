function smoothnessValue_test()
%% WIP
%% Setup test values
d.sine = sin([0:1/100:100]);
d.line = linspace(1,100,1000);
d.random = 10*randn(1,1000);
d.random2 = 10*randn(1,100000);
d.random3 = 100*randn(1,1000);
d.random4 = 100*randn(1,100000);

figure('units','normalized','outerposition',[0.1 0.1 0.9 0.9])
subplot(3,2,1)
plotSmoothness(d.sine)
subplot(3,2,2)
plotSmoothness(d.line)
subplot(3,2,3)
plotSmoothness(d.random)
subplot(3,2,4)
plotSmoothness(d.random2)
subplot(3,2,5)
plotSmoothness(d.random3)
subplot(3,2,6)
plotSmoothness(d.random4)


end

function plotSmoothness(vector)
d1 = smoothnessValue(vector);
plot(vector); title(['Smoothness: ' num2str(round(d1,1)) ', n=' num2str(length(vector))]);
grid on; grid minor;
end