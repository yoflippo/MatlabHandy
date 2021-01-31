function indices = findZeroCrossings_test()
close all;
figure('units','normalized','outerposition',[0.1 0.1 0.9 0.9])
t = 0:0.01:15;
y = sin(2*pi*t)+2*cos(t.^2);

idxs = findZeroCrossings(y);
subplot(2,1,1);
plot(t,y); hold on;
plot(t(idxs),y(idxs),'ro');
plot(t,linspace(0,0,length(t)),'k');
subplot(2,1,2);

[idxs,t0,v0] = findZeroCrossings(y,t);
plot(t,y); hold on;
plot(t0,v0,'ro'); hold on;
plot(t,linspace(0,0,length(t)),'k');
end

