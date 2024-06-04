`timescale 1ns / 1ps

module parallel_carry_adder_8bit_with_enable_tb( );

    // ������������  
    reg [7:0] a, b;  
    reg cin, enable;  
    wire [7:0] sum;  
    wire cout;  
  
    // ʵ�������н�λ�ӷ���  
    parallel_carry_adder_8bit_with_enable u1 (  
        .a(a),  
        .b(b),  
        .cin(cin),  
        .enable(enable),  
        .sum(sum),  
        .cout(cout)  
    );  
  
    // ��ʼ������͵��ò���  
    initial begin  
      
        enable = 1;  a = 8'b11111111; b = 8'b00000000;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
      
       enable = 0;  a = 8'b00000000; b = 8'b00000000;cin = 1;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 0;  a = 8'b00000000; b = 8'b11110000;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 0;  a = 8'b00000000; b = 8'b11111111;cin = 1;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        
         enable = 1;  a = 8'b11111111; b = 8'b00000000;cin = 0;  #10;  
        $display("enable = %b, sum = %b, cout = %b", enable ,sum, cout);  
        $finish;  
    end  
  

endmodule
