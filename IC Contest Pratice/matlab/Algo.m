% 16x16面積的範圍
area_width = 16;
area_height = 16;

% 標的物數量和半徑
target_count = 40;
target_radius = 0;

% 讀取標的物位置
targets = loadTargets('targets.txt');

% 初始化圓一和圓二的半徑和圓心位置
radius1 = 4;
radius2 = 4;
center1 = [0, 0];
center2 = [0, 0];

% 計算初始覆蓋量
coverage = calculateCoverage(center1, radius1, center2, radius2, targets);

% 重覆執行直到結果收斂
converged = false;
while ~converged
    % 保留前一次的圓心位置
    prev_center1 = center1;
    prev_center2 = center2;
    
    % 進行圓二位置的優化
    center2 = optimizeCenter2(center1, radius1, targets);
    
    % 進行圓一位置的優化
    center1 = optimizeCenter1(center2, radius2, targets);
    
    % 計算新的覆蓋量
    new_coverage = calculateCoverage(center1, radius1, center2, radius2, targets);
    
    % 檢查是否收斂
    if new_coverage == coverage
        converged = true;
    end
    
    % 更新覆蓋量
    coverage = new_coverage;
end

% 輸出結果
disp("最大覆蓋數量: " + coverage);
disp("最佳圓一圓心位置: (" + center1(1) + ", " + center1(2) + ")");
disp("最佳圓二圓心位置: (" + center2(1) + ", " + center2(2) + ")");

% 讀取標的物位置的函式
function targets = loadTargets(filename)
    % 讀取標的物位置檔案
    file = fopen(filename, 'r');
    data = textscan(file, '%f %f');
    fclose(file);
    
    % 儲存標的物位置
    targets = [data{1}, data{2}];
end

% 計算覆蓋量的函式
function coverage = calculateCoverage(center1, radius1, center2, radius2, targets)
    coverage = 0;
    for i = 1:size(targets, 1)
        target_x = targets(i, 1);
        target_y = targets(i, 2);
        
        % 檢查每個標的物是否在兩個圓的範圍內
        % distance1 = sqrt((target_x - center1(1))^2 + (target_y - center1(2))^2);
        % distance2 = sqrt((target_x - center2(1))^2 + (target_y - center2(2))^2)
        distance1 = abs(target_x-center1(1) + target_y - center1(2));
        distance2 = abs(target_x-center2(1) + target_y - center2(2));
        
        if (distance1 <= radius1 || distance2 <= radius2 )
            coverage = coverage + 1;
        % 原因請看 fig. 1 
        elseif abs(target_x-center1(1))==3 && abs(target_y-center1(2))==2 
            coverage = coverage + 1;
        elseif abs(target_x-center1(1))==2 && abs(target_y-center1(2))==3
            coverage = coverage + 1;
        elseif abs(target_x-center2(1))==3 && abs(target_y-center2(2))==2
            coverage = coverage + 1;
        elseif abs(target_x-center2(1))==2 && abs(target_y-center2(2))==3
            coverage = coverage + 1;
        end
    end
end

% 優化圓二位置的函式
function center2 = optimizeCenter2(center1, radius1, targets)
    max_coverage = 0;
    best_center2 = [1, 1];
    
    for x = 1:size(targets, 1)
        for y = 1:size(targets, 2)
            % 計算目前圓二位置的覆蓋量
            coverage = calculateCoverage(center1, radius1, [targets(x, 1), targets(x, 2)], radius1, targets);
            
            % 更新最大覆蓋量和最佳圓二圓心位置
            if coverage > max_coverage
                max_coverage = coverage;
                best_center2 = [targets(x, 1), targets(x, 2)];
            end
        end
    end
    
    center2 = best_center2;
end

% 優化圓一位置的函式
function center1 = optimizeCenter1(center2, radius2, targets)
    max_coverage = 0;
    best_center1 = [1, 1];
    
    for x = 1:size(targets, 1)
        for y = 1:size(targets, 2)
            % 計算目前圓一位置的覆蓋量
            coverage = calculateCoverage([targets(x, 1), targets(x, 2)], radius2, center2, radius2, targets);
            
            % 更新最大覆蓋量和最佳圓一圓心位置
            if coverage > max_coverage
                max_coverage = coverage;
                best_center1 = [targets(x, 1), targets(x, 2)];
            end
        end
    end
    
    center1 = best_center1;
end
