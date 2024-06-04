`timescale 1ns / 1ps  
  
module parallel_carry_adder_4bit_with_enable(    
    input  [3:0] a,    
    input  [3:0] b,    
    input cin,    
    input enable,    
    output [3:0] sum,    
    output cout    
);    
// 进位生成和进位传播信号  
    wire [2:0] g, p;  
    wire [3:0] c;  
  wire[3:0]tempsum;
    // 计算进位生成和进位传播  
    assign g[0] = a[0] & b[0];  
    assign p[0] = a[0] | b[0];  
    assign g[1] = a[1] & b[1];  
    assign p[1] = a[1] | b[1];  
    assign g[2] = a[2] & b[2];  
    assign p[2] = a[2] | b[2];  
  
    // 进位计算  
    assign c[0] = cin;  
    assign c[1] = g[0] | (p[0] & cin);  
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);  
    assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & g[0]))) | (p[2] & p[1] & p[0] & cin);  
  
  
// 实例化全加器    
full_adder_with_enable fa0(.a(a[0]), .b(b[0]), .cin(cin), .enable(enable), .sum(tempsum[0]), .cout());    
full_adder_with_enable fa1(.a(a[1]), .b(b[1]), .cin(c[1]), .enable(enable), .sum(tempsum[1]), .cout());    
full_adder_with_enable fa2(.a(a[2]), .b(b[2]), .cin(c[2]), .enable(enable), .sum(tempsum[2]), .cout());    
full_adder_with_enable fa3(.a(a[3]), .b(b[3]), .cin(c[3]), .enable(enable), .sum(tempsum[3]), .cout(cout));    
  
  assign sum= enable ? 4'bz: tempsum;
endmodule
