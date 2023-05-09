# Homework 5

使用指撥開關分別控制，四個七段顯示器顯示 ABCD。

## Example 

效果如 Example 影片中所示

https://github.com/frankxaio/Seminar/assets/13852250/90bf776c-4b28-4364-ac32-11d0d86ffabd

## Note

- scan_led_hex_disp: 將七段顯示器快速切換輸出，造成人眼的視覺佔留，就可以達成同時顯示的效果。
  - 使用計數器對 clock 進行分頻，當 `regN` 累加到 $2^{15}$ 後，若 `regN` 再加 1，就會使用第一顆 七段顯示器輸出。再加 1，就會使用第二顆七段顯示器輸出。再加 1，就會使用第三顆七段顯示器輸出。再加 1，就會使用第四顆七段顯示器輸出。再加 1，`regN` 就要重新從 $0$ 數至 $2^{15}$。
  - `define` `parameter` `localparam` 三者的[差別](https://blog.csdn.net/m0_46345246/article/details/119336267)
- Display_ABCD: 使用指撥開關輸出 ABCD 至七段顯示器
