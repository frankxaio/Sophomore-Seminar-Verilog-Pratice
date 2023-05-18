clear;
clc;
close all; 

load weight;
load input;

for i  = 1:10
    x = input(i,:) * weight + bias;
    x(x<0) = 0;
    y = x * weight2 + bias2;
    [a,b] = max(y);
    ans(i) = b; 
end 

fid = fopen('weight.txt','wt');   % data.txt為寫入檔名
matrix = weight;                     % M為要儲存的矩陣
[m,n]=size(matrix);                      
 for i=1:1:m
   for j=1:1:n
      if j==n
        fprintf(fid,',%d\n',matrix(i,j));
     else
       fprintf(fid,',%d\t',matrix(i,j));
      end
   end
end
fclose(fid);


fid = fopen('input.txt','wt');   % data.txt為寫入檔名
matrix = input;                     % M為要儲存的矩陣
[m,n]=size(matrix);                      
 for i=1:1:m
   for j=1:1:n
      if j==n
        fprintf(fid,'%x\n',matrix(i,j));
     else
       fprintf(fid,'%x\t',matrix(i,j));
      end
   end
end
fclose(fid);

