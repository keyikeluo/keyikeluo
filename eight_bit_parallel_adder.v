`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:42:21
// Design Name: 
// Module Name: eight_bit_parallel_adder
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

module eight_bit_parallel_adder (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire c_out4;

    four_bit_parallel_adder adder0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c_out4)
    );

    four_bit_parallel_adder adder1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c_out4),
        .sum(sum[7:4]),
        .cout(cout)
    );

endmodule