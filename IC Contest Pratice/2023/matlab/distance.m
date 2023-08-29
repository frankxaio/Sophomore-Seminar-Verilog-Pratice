% 建立整數座標軸範圍
x = 0:15;
y = 0:15;

% 建立座標矩陣
[X, Y] = meshgrid(x, y);

% 繪製整數座標點
scatter(X(:), Y(:), 'filled', 'black');
grid on;

% 繪製圓

center = [12, 0];
radius = 4;
viscircles(center, radius, 'Color', '#0072BD');

% center = [12, 2];
% radius = 4;
% viscircles(center, radius, 'Color', '#D95319');

center = [12, 2];
radius = 4;
viscircles(center, radius, 'Color', '#EDB120');

center = [8, 5];
radius = 4;
viscircles(center, radius, 'Color', '#D95319');

center = [12, 7];
radius = 4;
viscircles(center, radius, 'Color', '#0072BD');

center = [3, 10];
radius = 4;
viscircles(center, radius, 'Color', '#D95319');

% center = [0, 12];
% radius = 4;
% viscircles(center, radius, 'Color', '#EDB120');



% 反轉座標系統到第四象限
set(gca, 'YDir', 'reverse');

% 設定座標軸範圍
xlim([min(x)-1, max(x)+1]);
ylim([min(y)-1, max(y)+1]);

% 設定座標軸標籤
xlabel('x');
ylabel('y');
