`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2021 09:03:04 PM
// Design Name: 
// Module Name: testALU
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


module testALU(

    );
    wire [31:0] S;
    wire z;
    wire Cout;
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;
    reg [2:0] alu_ops;
    alu ALU(S,z,Cout,A,B,Cin,alu_ops);
    
    initial
    begin
        #0 A = 32'h5; B = 32'hA; Cin = 1; alu_ops = 3'd0;
        #10 alu_ops = 3'd1;
        #10 alu_ops = 3'd2;
        #10 alu_ops = 3'd3;
        #10 alu_ops = 3'd4;
        #10 alu_ops = 3'd5;
        #10 alu_ops = 3'd6;
        #10 alu_ops = 3'd7;
        #20 $finish;        
    end
endmodule
