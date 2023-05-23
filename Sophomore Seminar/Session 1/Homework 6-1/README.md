# Homework 6-1  0-999 Counter

使用七段顯示器做一個讀秒器，從 0000 開始讀數讀到 0999 之後往回倒數回到 0000。

## Demo

[![IMAGE ALT TEXT](https://img.youtube.com/vi/B_E9Y4HUxIg/hqdefault.jpg)](https://youtu.be/B_E9Y4HUxIg)



## Note

### One second counter 
One second counter 的另一種寫法， 令 `[24:0] reg delay` 一開始為零，只要碰到 clock 就加一。加到 `delay` 的 25-bit 都為 1 的時候約**略為 0.5 秒**，
此時把所有 `delay` 的 1 做 AND，此時 `test` 產生 posedge。約略每 1 秒產生一個 posedge，如此產生 1 Hz clock。

> **為甚麼是約略 0.5 秒？**
> 
> 25'b1_1111_1111_1111_1111_1111_1111 等於 25'd33_554_431，所以用此方法產生的 1 秒是不精確的。

<details>
<summary>Code</summary>

```verilog
always @ (posedge clock or posedge reset) begin
		if (reset)
			delay <= 0;
		else
			delay <= delay + 1; 
end
 
assign test = &delay; // bitwise AND
```
</details>

### Accumulator 
使用 behavior model 寫 accumulator，若使用加法電路與F/F的觀點，會產生許多 latch，且不容易 debug。所以使用 behavior model，以下是不好的示範。

<details>
<summary>Code</summary>

```verilog
...
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            acc1 <= 0;
        else 
            acc1 <= acc1_n;
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            acc3 <= 0;
        else 
            acc3 <= acc3_n;
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            acc2 <= 0;
        else 
            acc2 <= acc2_n;
    end

    always @( *) begin
        case (mode)
            1'b0: 
                if (time_cnt == TIME_ONESEC) begin
                    if (acc1 == 9) begin
                        acc1_n = 0;
                        if (acc2 == 9) begin
                            acc2_n = 0;
                            if (acc3 == 9) 
                                acc3_n = 0;
                            else
                                acc3_n = acc3 + 1;
                                acc2_n = acc2;
                        end
                        else 
                            acc2_n = acc2 + 1;
                            acc3_n = acc3;
                    end
                    else 
                        acc1_n = acc1 + 1;
                        acc2_n = acc2;
                        acc3_n = acc3;
                end
                else begin                    
                    acc1_n = acc1;
                    acc2_n = acc2;
                    acc3_n = acc3;
                end
            1'b1: 
                if (time_cnt == TIME_ONESEC) begin
                    if (acc1 == 0) begin
                        acc1_n = 9;
                        if (acc2 == 0)
                            acc3_n = acc3 - 1;
                        else 
                            acc2_n = acc2 - 1;
                    end
                    else 
                        acc1_n = acc1 - 1;
                end
                else begin                    
                    acc1_n = acc1;
                    acc2_n = acc2;
                    acc3_n = acc3;
                end
        endcase
    end
...
```
</details>
