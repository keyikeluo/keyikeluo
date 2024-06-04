`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:41:43
// Design Name: 
// Module Name: add_subtract
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

module add_subtract (
    input [7:0] a,
    input [7:0] b,
    input add_sub, // 低电平: 加法, 高电平: 减法
    input enable, // 低电平有效
    output reg [11:0] bcd_result,
    output reg cout,
    output reg sign_flag
);
    wire [7:0] b_xor;
    wire carry_in;
    wire [7:0] binary_result;
    wire internal_cout;
    wire [11:0] internal_bcd_result;
    wire [11:0] extended_bcd_result;
    reg [7:0] abs_result; // 绝对值结果

    assign b_xor = b ^ {8{add_sub}};
    assign carry_in = add_sub; // 减法时cin=1, 加法时cin=0

    eight_bit_parallel_adder adder (
        .a(a),
        .b(b_xor),
        .cin(carry_in),
        .sum(binary_result),
        .cout(internal_cout)
    );

    // 将二进制结果转换为BCD码
    binary_to_bcd bcd_converter (
        .binary({1'b0, abs_result}),
        .bcd(internal_bcd_result)
    );

    // 将二进制结果转换为BCD码，包括可能的进位
    binary_to_bcd bcd_converter_extended (
        .binary({internal_cout, binary_result}),
        .bcd(extended_bcd_result)
    );

    always @(*) begin
        if (!enable) begin
            if (add_sub) begin
                // 减法操作
                if (binary_result[7]) begin
                    // 负数处理
                    abs_result = ~binary_result + 1; // 求绝对值
                    sign_flag = 1'b1; // 负数标志
                end else begin
                    // 正数处理
                    abs_result = binary_result;
                    sign_flag = 1'b0; // 正数标志
                end
                cout = 1'b0;
                bcd_result = internal_bcd_result; // 转换后的BCD结果
            end else begin
                // 加法操作
                abs_result = binary_result;
                if (internal_cout) begin
                    // 处理溢出情况
                    bcd_result = extended_bcd_result;
                    cout = 1'b1;
                end else begin
                    bcd_result = internal_bcd_result;
                    cout = 1'b0;
                end
                sign_flag = 1'b0; // 正数标志
            end
        end else begin
            bcd_result = 12'bz;
            cout = 1'bz;
            sign_flag = 1'bz;
        end
    end
endmodule