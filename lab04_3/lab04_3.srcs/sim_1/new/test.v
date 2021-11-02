`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 01:02:17 AM
// Design Name: 
// Module Name: test
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


module test(

);
    ROM r(out,addr,clk);
    wire [11:0] out;
    reg [9:0] addr;
    reg clk;
    initial
    begin
        clk <= 0;
        addr <= 0;
    end
    always #10 clk = ~clk;

    initial
    begin
        #5 addr <= 10'b0100010100;
        #100 $finish;

    end
endmodule
