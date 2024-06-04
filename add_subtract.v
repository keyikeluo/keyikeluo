`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:41:43
// Design Name: 
// Module Name: add_subtract
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

module add_subtract (
    input [7:0] a,
    input [7:0] b,
    input add_sub, // �͵�ƽ: �ӷ�, �ߵ�ƽ: ����
    input enable, // �͵�ƽ��Ч
    output reg [11:0] bcd_result,
    output reg cout,
    output reg sign_flag
);
    wire [7:0] b_xor;
    wire carry_in;
    wire [7:0] binary_result;
    wire internal_cout;
    wire [11:0] internal_bcd_result;
    wire [11:0] extended_bcd_result;
    reg [7:0] abs_result; // ����ֵ���

    assign b_xor = b ^ {8{add_sub}};
    assign carry_in = add_sub; // ����ʱcin=1, �ӷ�ʱcin=0

    eight_bit_parallel_adder adder (
        .a(a),
        .b(b_xor),
        .cin(carry_in),
        .sum(binary_result),
        .cout(internal_cout)
    );

    // �������ƽ��ת��ΪBCD��
    binary_to_bcd bcd_converter (
        .binary({1'b0, abs_result}),
        .bcd(internal_bcd_result)
    );

    // �������ƽ��ת��ΪBCD�룬�������ܵĽ�λ
    binary_to_bcd bcd_converter_extended (
        .binary({internal_cout, binary_result}),
        .bcd(extended_bcd_result)
    );

    always @(*) begin
        if (!enable) begin
            if (add_sub) begin
                // ��������
                if (binary_result[7]) begin
                    // ��������
                    abs_result = ~binary_result + 1; // �����ֵ
                    sign_flag = 1'b1; // ������־
                end else begin
                    // ��������
                    abs_result = binary_result;
                    sign_flag = 1'b0; // ������־
                end
                cout = 1'b0;
                bcd_result = internal_bcd_result; // ת�����BCD���
            end else begin
                // �ӷ�����
                abs_result = binary_result;
                if (internal_cout) begin
                    // ����������
                    bcd_result = extended_bcd_result;
                    cout = 1'b1;
                end else begin
                    bcd_result = internal_bcd_result;
                    cout = 1'b0;
                end
                sign_flag = 1'b0; // ������־
            end
        end else begin
            bcd_result = 12'bz;
            cout = 1'bz;
            sign_flag = 1'bz;
        end
    end
endmodule