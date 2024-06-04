`timescale 1ns / 1ps  
  
module parallel_carry_adder_4bit_with_enable_tb;  
  
    // ������������  
    reg [3:0] a, b;  
    reg cin, enable;  
    wire [3:0] sum;  
    wire cout;  
  
    // ʵ�������н�λ�ӷ���  
    parallel_carry_adder_4bit_with_enable u1 (  
        .a(a),  
        .b(b),  
        .cin(cin),  
        .enable(enable),  
        .sum(sum),  
        .cout(cout)  
    );  
  
    // ��ʼ������͵��ò���  
    initial begin  
      
        enable = 1;  a = 4'b1111; b = 4'b0000;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
      
       enable = 0;  a = 4'b0000; b = 4'b0000;cin = 1;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 0;  a = 4'b0000; b = 4'b1111;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 0;  a = 4'b0000; b = 4'b1111;cin = 1;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 1;  a = 4'b1111; b = 4'b0000;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        $finish;  
    end  
  
endmodule

