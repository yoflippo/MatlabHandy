function setGraphPlotAttributes_test()
close all; 
setGraphPlotAttributes()
t = 0:0.1:10;
y = sin(2*pi*t)+randn(size(t));
plot(t,y)
end