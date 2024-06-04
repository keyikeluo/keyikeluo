`timescale 1ns / 1ps

module add_subtract_tb;

    // ����
    reg [7:0] a;
    reg [7:0] b;
    reg add_sub;
    reg enable;

    // ���
    wire [11:0] bcd_result;
    wire cout;
    wire sign_flag;

    // ʵ����������ģ��
    add_subtract uut (
        .a(a),
        .b(b),
        .add_sub(add_sub),
        .enable(enable),
        .bcd_result(bcd_result),
        .cout(cout),
        .sign_flag(sign_flag)
    );

    initial begin
        // ��ʼ������
        a = 0;
        b = 0;
        add_sub = 0;
        enable = 1;

        // �ȴ�ȫ�ָ�λ
        #10;
        
        // �ӷ�����: 100 + 27
        a = 8'b00000001;
        b = 8'b00000010;
        add_sub = 0; // �ӷ�
        enable = 0; // ʹ�ܵ͵�ƽ
        #10;
        
        // ��ʾ���
        $display("�ӷ�: %d + %d = %d, BCD Result: %d, Carry Out: %b, Sign Flag: %b", a, b, a + b, bcd_result, cout, sign_flag);
        
          
        // �ӷ�����: 100 + 27
        a = 8'b00000001;
        b = 8'b00000010;
        add_sub = 1; // �ӷ�
        enable = 0; // ʹ�ܵ͵�ƽ
        #10;
        
        // ��ʾ���
        $display("�ӷ�: %d + %d = %d, BCD Result: %d, Carry Out: %b, Sign Flag: %b", a, b, a + b, bcd_result, cout, sign_flag);
        
        // ��������: 150 - 75
        a = 8'b00000010;
        b = 8'b000000001;
        add_sub = 1; // ����
        enable = 0; // ʹ�ܵ͵�ƽ
        #10;
        
        $finish;
    end
endmodule