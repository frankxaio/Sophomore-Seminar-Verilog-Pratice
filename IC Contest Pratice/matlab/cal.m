
% 讀取標的物位置
targets = loadTargets('img1.txt');

center = [1,0];
counter = 0;


fprintf("=======================================\n");
fprintf("Distance of every point\n");
fprintf("=======================================\n");
for i = 1:size(targets, 1)
        target_x = targets(i, 1);
        target_y = targets(i, 2);
        distance_x = abs(target_x-center(1));
        distance_y = abs(target_y-center(2));
        fprintf("%d, %d\n", distance_x, distance_y);
%         fprintf("%d, %d\n",target_x, target_y);
end

fprintf("=======================================\n");
fprintf("In the circle\n");
fprintf("=======================================\n");
for i = 1:size(targets, 1)
        target_x = targets(i, 1);
        target_y = targets(i, 2);
        distance_x = abs(target_x-center(1));
        distance_y = abs(target_y-center(2));
        if (distance_x + distance_y <= 4) 
            counter = counter + 1;
            fprintf("%d, %d\n", distance_x, distance_y); 
        elseif (distance_x==2 && distance_y==3 )
            counter = counter + 1;
            fprintf("%d, %d\n", distance_x, distance_y); 
        elseif (distance_x==3 && distance_y==2)
            counter = counter + 1;
            fprintf("%d, %d\n", distance_x, distance_y); 
        end  
end

fprintf("counter = %d\n", counter);

% 讀取標的物位置的函式
function targets = loadTargets(filename)
    % 讀取標的物位置檔案
    file = fopen(filename, 'r');
    data = textscan(file, '%f %f');
    fclose(file);
    
    % 儲存標的物位置
    targets = [data{1}, data{2}];
end
        


