module four_bit_parallel_adder (  
    input [3:0] a,  
    input [3:0] b,  
    input cin,  
    output [3:0] sum,  
    output cout  
);  
  
    // �ڲ��źŶ���  
    wire c0, c1, c2; // ÿһλ�Ľ�λ  
  
    // ÿһλ��ȫ����ʵ��  
    assign {c0, sum[0]} = a[0] + b[0] + cin;  
    assign {c1, sum[1]} = a[1] + b[1] + c0;  
    assign {c2, sum[2]} = a[2] + b[2] + c1;  
    assign {cout, sum[3]} = a[3] + b[3] + c2;  
  
endmodule