`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/14 16:47:03
// Design Name: 
// Module Name: full_adder
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

module full_adder_with_enable(  
    input a, b, cin, enable,    
    output reg sum, cout // ʹ��reg��֧��������ֵ  
);  
  
// ��enableΪ0ʱ��ִ��ȫ�Ӳ���  
// ��enableΪ1ʱ��sum��cout����Ϊ0��������Ը�����Ҫ��������ֵ��  
always @(*) begin  
    if (!enable) begin  
        sum = cin ^ a ^ b;  
        cout = (a & b) | ((a ^ b) & cin); // ����ʹ������ȷ����ȷ������˳��  
    end else begin  
        // ���磬��������Ϊ0  
        sum = 0;  
        cout = 0;  
    end  
end  
  
endmodule
