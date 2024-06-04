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
    output reg sum, cout // 使用reg以支持条件赋值  
);  
  
// 当enable为0时，执行全加操作  
// 当enable为1时，sum和cout保持为0（或你可以根据需要设置其他值）  
always @(*) begin  
    if (!enable) begin  
        sum = cin ^ a ^ b;  
        cout = (a & b) | ((a ^ b) & cin); // 这里使用括号确保正确的运算顺序  
    end else begin  
        // 例如，将它们置为0  
        sum = 0;  
        cout = 0;  
    end  
end  
  
endmodule
