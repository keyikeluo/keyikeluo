`timescale 1ns / 1ps  
  
module full_adder_with_enable_tb;  
  
    // 输入和输出信号的声明  
    reg a, b, cin, enable;  
    wire sum, cout;  
  
    // 实例化被测试的模块  
    full_adder_with_enable DUT (  
        .a(a),  
        .b(b),  
        .cin(cin),  
        .enable(enable),  
        .sum(sum),  
        .cout(cout)  
    );  
  initial begin  
        enable = 0; cin = 0; a = 0; b = 0;  
        #10;  // 等待10个时间单位  
      
          enable = 0; cin = 0; a = 0; b = 1;  
        #10;  // 等待10个时间单位  
        
          enable = 0; cin = 0; a = 1; b = 0;  
        #10;  // 等待10个时间单位  
      
          enable = 0; cin = 0; a = 1; b = 1;  
        #10;  // 等待10个时间单位  
       
          enable = 0; cin = 1; a = 0; b = 0;  
        #10;  // 等待10个时间单位  
      
          enable = 0; cin = 1; a = 0; b = 1;  
        #10;  // 等待10个时间单位  
    
          enable = 0; cin = 1; a = 1; b = 0;  
        #10;  // 等待10个时间单位  
      
          enable = 0; cin = 1; a =1 ; b = 1;  
        #10;  // 等待10个时间单位  
      
           enable = 1; cin = 0; a = 0; b = 0;  
        #10;  // 等待10个时间单位  
    
          enable =1; cin = 0; a = 0; b = 1;  
        #10;  // 等待10个时间单位  
  
          enable = 1; cin = 0; a = 1; b = 0;  
        #10;  // 等待10个时间单位  
    
          enable = 1; cin = 0; a = 1; b = 1;  
        #10;  // 等待10个时间单位  
    
          enable = 1; cin = 1; a = 0; b = 0;  
        #10;  // 等待10个时间单位  
     
          enable = 1; cin = 1; a = 0; b = 1;  
        #10;  // 等待10个时间单位  
  
          enable = 1; cin = 1; a = 1; b = 0;  
        #10;  // 等待10个时间单位  
      
          enable = 1; cin = 1; a = 1; b = 1;  
        #10;  // 等待10个时间单位  
     
        $stop;  
       end  
endmodule