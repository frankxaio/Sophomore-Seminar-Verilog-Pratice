clear;
clc;
close all; 

load weight;
load input;
arr1 = [0,0,0,0,0,0,0,0,0,0];
for i  = 1:10
    x = input(i,:) * weight + bias;
    x(x<0) = 0;
    y = x * weight2 + bias2;
    [a,b] = max(y);
    arr1(i) = b; 
end