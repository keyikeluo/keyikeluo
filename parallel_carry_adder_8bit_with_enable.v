`timescale 1ns / 1ps
module parallel_carry_adder_8bit_with_enable(
    input [7:0] a,
    input [7:0] b,
    input cin,
    input enable,
    output [7:0] sum,
    output cout
);

wire  c1;
wire cout1;

// Instantiate two 4-bit parallel carry adders with enable
parallel_carry_adder_4bit_with_enable adder1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .enable(enable), .sum(sum[3:0]), .cout(c1));
parallel_carry_adder_4bit_with_enable adder2(.a(a[7:4]), .b(b[7:4]), .cin(c1), .enable(enable), .sum(sum[7:4]), .cout(cout));


endmodule
