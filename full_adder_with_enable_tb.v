`timescale 1ns / 1ps  
  
module full_adder_with_enable_tb;  
  
    // ���������źŵ�����  
    reg a, b, cin, enable;  
    wire sum, cout;  
  
    // ʵ���������Ե�ģ��  
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
        #10;  // �ȴ�10��ʱ�䵥λ  
      
          enable = 0; cin = 0; a = 0; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
        
          enable = 0; cin = 0; a = 1; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
      
          enable = 0; cin = 0; a = 1; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
       
          enable = 0; cin = 1; a = 0; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
      
          enable = 0; cin = 1; a = 0; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
    
          enable = 0; cin = 1; a = 1; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
      
          enable = 0; cin = 1; a =1 ; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
      
           enable = 1; cin = 0; a = 0; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
    
          enable =1; cin = 0; a = 0; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
  
          enable = 1; cin = 0; a = 1; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
    
          enable = 1; cin = 0; a = 1; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
    
          enable = 1; cin = 1; a = 0; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
     
          enable = 1; cin = 1; a = 0; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
  
          enable = 1; cin = 1; a = 1; b = 0;  
        #10;  // �ȴ�10��ʱ�䵥λ  
      
          enable = 1; cin = 1; a = 1; b = 1;  
        #10;  // �ȴ�10��ʱ�䵥λ  
     
        $stop;  
       end  
endmodule