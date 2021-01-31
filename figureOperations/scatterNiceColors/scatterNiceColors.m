function scatterNiceColors(x,y)
cmap = hsv(length(x));
scatter(x, y, 100, cmap,'x', 'LineWidth',2); hold on;
scatter(x, y, 100,'k.', 'LineWidth',1);
end