# Homework 6-2 Button control counter
利用按鍵控制數值加 1、減 1、歸零。在加滿 10 之後再加 1 時,數值為歸零;而數值為零時,再減一後數值為 10。

## Demo
效果如 Example 影片所示。

https://github.com/frankxaio/Seminar/assets/13852250/644edfdc-e962-4a12-9bb6-ae70424bf9b3

## Note
- 按鈕為 **low**，當按鈕按下時為 **high**
- Accumulator: 進行加一與減一，並檢測加總的上限與下限
- Dividor: 除頻器，負責將 50 MHz 的 clk 訊號分頻，除頻後的訊號送去 Accumulator 作為 clk 判斷是否按鈕已經按下
- Debounce_circuit: 防按鈕彈跳
- seven_segment_display: 負責七段顯示器輸出

### Top
![image](https://github.com/frankxaio/Seminar/assets/13852250/55b60d19-16c6-48ee-ac82-c11b679e20b3)

### Accumulator
![image](https://github.com/frankxaio/Seminar/assets/13852250/19e5eba2-a052-41c4-bf54-5edbde1e56d7)

