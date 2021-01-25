function x = normalizeAngleRadian_test(x)
x =[];
for i = 0:0.01:100
    x = [x normalizeAngleRadian(i)];
end

plot(x)

