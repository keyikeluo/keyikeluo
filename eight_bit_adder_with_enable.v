`timescale 1ns / 1ps
module eight_bit_adder_with_enable(
    input wire Cin0,
    input wire Enable,
    input wire [7:0] A,
    input wire [7:0] B,
    output reg [7:0] Sum,
    output wire Cout8
);

wire [7:0] temp_Sum_wire;
wire C1, C2, C3, C4, C5, C6, C7;

full_adder_with_enable u0(
    .enable(Enable),
    .a(A[0]),
    .b(B[0]),
    .cin(Cin0),
    .sum(temp_Sum_wire[0]),
    .cout(C1)
);

full_adder_with_enable u1(
    .enable(Enable),
    .a(A[1]),
    .b(B[1]),
    .cin(C1),
    .sum(temp_Sum_wire[1]),
    .cout(C2)
);

full_adder_with_enable u2(
    .enable(Enable),
    .a(A[2]),
    .b(B[2]),
    .cin(C2),
    .sum(temp_Sum_wire[2]),
    .cout(C3)
);

full_adder_with_enable u3(
    .enable(Enable),
    .a(A[3]),
    .b(B[3]),
    .cin(C3),
    .sum(temp_Sum_wire[3]),
    .cout(C4)
);

full_adder_with_enable u4(
    .enable(Enable),
    .a(A[4]),
    .b(B[4]),
    .cin(C4),
    .sum(temp_Sum_wire[4]),
    .cout(C5)
);

full_adder_with_enable u5(
    .enable(Enable),
    .a(A[5]),
    .b(B[5]),
    .cin(C5),
    .sum(temp_Sum_wire[5]),
    .cout(C6)
);

full_adder_with_enable u6(
    .enable(Enable),
    .a(A[6]),
    .b(B[6]),
    .cin(C6),
    .sum(temp_Sum_wire[6]),
    .cout(C7)
);

full_adder_with_enable u7(
    .enable(Enable),
    .a(A[7]),
    .b(B[7]),
    .cin(C7),
    .sum(temp_Sum_wire[7]),
    .cout(Cout8)
);
always @* begin
    if (!Enable)
        Sum = temp_Sum_wire;
    else
        Sum = 8'bz; // or any other default value
end

endmodule 
