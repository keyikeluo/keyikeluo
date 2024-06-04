`timescale 1ns / 1ps

module add_subtract_tb;

    // 输入
    reg [7:0] a;
    reg [7:0] b;
    reg add_sub;
    reg enable;

    // 输出
    wire [11:0] bcd_result;
    wire cout;
    wire sign_flag;

    // 实例化待测试模块
    add_subtract uut (
        .a(a),
        .b(b),
        .add_sub(add_sub),
        .enable(enable),
        .bcd_result(bcd_result),
        .cout(cout),
        .sign_flag(sign_flag)
    );

    initial begin
        // 初始化输入
        a = 0;
        b = 0;
        add_sub = 0;
        enable = 1;

        // 等待全局复位
        #10;
        
        // 加法测试: 100 + 27
        a = 8'b00000001;
        b = 8'b00000010;
        add_sub = 0; // 加法
        enable = 0; // 使能低电平
        #10;
        
        // 显示结果
        $display("加法: %d + %d = %d, BCD Result: %d, Carry Out: %b, Sign Flag: %b", a, b, a + b, bcd_result, cout, sign_flag);
        
          
        // 加法测试: 100 + 27
        a = 8'b00000001;
        b = 8'b00000010;
        add_sub = 1; // 加法
        enable = 0; // 使能低电平
        #10;
        
        // 显示结果
        $display("加法: %d + %d = %d, BCD Result: %d, Carry Out: %b, Sign Flag: %b", a, b, a + b, bcd_result, cout, sign_flag);
        
        // 减法测试: 150 - 75
        a = 8'b00000010;
        b = 8'b000000001;
        add_sub = 1; // 减法
        enable = 0; // 使能低电平
        #10;
        
        $finish;
    end
endmodule