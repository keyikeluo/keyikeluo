`timescale 1ns / 1ps

module eight_bit_adder_with_enable_tb;

reg Cin0, Enable;
reg [7:0] A, B;
wire [7:0] Sum;
wire Cout8;

// Instantiate the DUT
eight_bit_adder_with_enable dut (
    .Cin0(Cin0),
    .Enable(Enable),
    .A(A),
    .B(B),
    .Sum(Sum),
    .Cout8(Cout8)
);

// Stimulus generation
initial begin
  
    Cin0 = 0;
    Enable = 1;
    A = 8'b00000000;
    B = 8'b00000001;
    #10;
    
     Cin0 = 0;
    Enable = 0;
   A = 8'b00000000;
    B = 8'b00000001;
     #10;

     Cin0 = 0;
    Enable = 0;
   A = 8'b11111111;
    B = 8'b00000001;
     #10;
     
       Cin0 =1;
    Enable = 0;
   A = 8'b11111111;
    B = 8'b00000000;
      #10;
    // End simulation
    $finish;
end

// Display results
always @(Sum or Cout8) begin
    $display("Sum = %b, Cout8 = %b", Sum, Cout8);
end

endmodule
