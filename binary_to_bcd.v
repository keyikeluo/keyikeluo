`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 15:59:00
// Design Name: 
// Module Name: binary_to_bcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module binary_to_bcd (
    input [8:0] binary,
    output reg [11:0] bcd
);
    integer i;

    always @(binary) begin
        // 初始化 BCD 结果
        bcd = 12'b0;

        // 将二进制数转换为 BCD
        for (i = 8; i >= 0; i = i - 1) begin
            // 如果任何 BCD 数字 >= 5，则加 3
            if (bcd[3:0] >= 5)
                bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5)
                bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5)
                bcd[11:8] = bcd[11:8] + 3;

            // 左移一位
            bcd = {bcd[10:0], binary[i]};
        end
    end
endmodule