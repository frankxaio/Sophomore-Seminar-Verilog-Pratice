# Homework 9
參考 Matlab code，將完整運算過程轉成電路。
```matlab
clear;
clc;
close all; 

load weight;
load input;

for i  = 1:10
    x = input(i,:) * weight  + bias;
    x(x<0) = 0;
    y = x * weight2 + bias2;
    [a,b] = max(y);
    arr_max_index(i) = b; 
    arr_max(i) = a;
end 
```

## Demo
### Matlab Result
![image](https://github.com/frankxaio/Seminar/assets/13852250/3051da4d-1b45-43e2-a92d-65dec757e06a)
### Simulation
![image](https://github.com/frankxaio/Seminar/assets/13852250/68d30a98-f207-4cbb-bcae-f73d6233ea34)


## Note
- input 只能是一維的該怎麼處理？
