function testDifferentiateIntegrate()
close all;

fs = 100;
dt = 1/fs;
te = 20;
t = 0:dt:te;
% x = sin(2*pi*fs.*t) - 0.1*cos(t*10) + randn(1,length(t));
x = sin(2*pi*fs.*t) - 0.1*cos(t*10);

xg = gradient(x,dt);
xgc = cumtrapz(t,xg);

figure('units','normalized','outerposition',[0.2 0.2 0.8 0.8])
subplot(3,1,1);
plot(t,x,'g','LineWidth',1); grid on; grid minor; title('basic signal x');
subplot(3,1,2);
plot(t,xg,'m','LineWidth',1); grid on; grid minor; title('derivative of signal x');
subplot(3,1,3);
plot(t,xgc,'b','LineWidth',1); grid on; grid minor; title('integration of derivation (back to x)');

end

% % Exact Solution
% a = -1; b = 1;
% Iab = 1/4*(b^4-a^4 ) + 2/3*(b^3-a^3 ) - 1/2*(b^2-a^2 ) + 3*(b-a)
% % Method 1
% avg_y = y(1:length(x)-1) + diff(y)/2;
% A1 = sum(diff(x).*avg_y)
% % Method 2
% A2 = quad(@myfunc, -1,1)
% % Method 3
% A3 = quadl(@myfunc, -1,1)