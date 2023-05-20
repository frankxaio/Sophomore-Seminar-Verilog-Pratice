# Homework 9 Image Processing Circuits
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
### Waveform Simulation
![image](https://github.com/frankxaio/Seminar/assets/13852250/56b53564-05fa-481e-a3ae-975f75a053f8)
> 使用 ISE 可以看到 module 內部的訊號。

## Note
### How input a matrix?
module 的輸入與輸出只能是**一維陣列**，先以一維陣列輸入，再將一維陣列轉成二維陣列。舉 matrix_mutiply1 中的 code 為例。
- `reg [29:0] A1 [0:9][0:49];`: 宣告了一個深度為 30-bit，擁有 10 個 row 與 50 column 的二維陣列。
- `{A1[0][0],A1[0][1], ..., A1[9][49]} = image;`: 將輸入的一維陣列轉成二維陣列的方式儲存，並進行運算。

### Matrix multiplication
以 3*3 的矩陣乘法為例，利用三層迴圈 i, j, k **複製**乘法與加法電路。index i 控制 A1 的 row，index j 控制 B1 的 column，index k 控制 A1 的 column 與 B1 的 row 做相乘。
![image](https://github.com/frankxaio/Seminar/assets/13852250/2c077c42-f9cc-4584-b9c1-44c928b86777)

#### Code
<details>
<summary> Matrix_multiplication </summary>

```verilog
`timescale 1ns / 1ps

module Calculator(A,B,Result);

	input [143:0] A;
	input [143:0] B;
	output [143:0] Result;
	
	reg [143:0] Result;
	reg [15:0] A1 [0:2][0:2];
	reg [15:0] B1 [0:2][0:2];
	reg [15:0] Res1 [0:2][0:2];
	
	integer i,j,k;
	
	always@ (A or B)
	begin
		//We convert the 1D arrays into 2D
		{A1[0][0],A1[0][1],A1[0][2],A1[1][0],A1[1][1],A1[1][2],A1[2][0],A1[2][1],A1[2][2]} = A;
		{B1[0][0],B1[0][1],B1[0][2],B1[1][0],B1[1][1],B1[1][2],B1[2][0],B1[2][1],B1[2][2]} = B;
		{Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]} = 144'd0;
		
		i=0; j=0; k=0;
		
		//$display ("Multiplying");
		
		for(i=0;i<3;i=i+1)
		begin
			for(j=0;j<3;j=j+1)
			begin
				for(k=0;k<3;k=k+1)
				begin
					Res1[i][j]=Res1[i][j]+ (A1[i][k]*B1[k][j]);
				end
			end
		end
		
		Result = {Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]};
	end

endmodule
```
</details>

<details>
<summary> Matrix_multiply_Testbench </summary>

```verilog
`timescale 1ns / 1ps

module test_bench;
	
	reg [143:0] A;
	reg [143:0] B;
	
	wire [143:0] Answer;
	
	Calculator calculator(.A(A), .B(B), .Result(Answer));
	
	initial begin
		
		//Initial inputs
		A={16'd1,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd8,16'd9};
		B={16'd7,16'd3,16'd5,16'd12,16'd11,16'd17,16'd20,16'd3,16'd0};
		
	end
    
   
endmodule
```
</details>

### Maximum 
register 只能儲存 unsigned number, 所以利用 MSB == 1 來判斷負數。

### Tips
處理 mat 中的 data 小技巧
<details>
<summary> Replace string </summary>

```python
username = " na me "
username = username.replace(' ','')
print(username)
```
</details>

<details>
<summary> Print increment reg  </summary>

```python
for i in range(20):
    for j in range(10):
        print("B1[%d][%d]" %(i,j), end=",")
```
</details>

<details>
<summary> Save mat to txt in Matlab </summary>
 
```matlab
fid = fopen('data.txt','wt');   % data.txt為寫入檔名
matrix = M;                 % M 為要儲存的矩陣
[m,n]=size(matrix);                      
 for i=1:1:m
   for j=1:1:n
      if j==n
        fprintf(fid,'%d\n',matrix(i,j));
     else
       fprintf(fid,'%d\t',matrix(i,j));
      end
   end
end
fclose(fid);
```
</details>

