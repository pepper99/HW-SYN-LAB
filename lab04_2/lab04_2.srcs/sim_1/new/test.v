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
    wire [7:0] out;
    reg [4:0] addr;
    reg clk;
    initial
    begin
        clk <= 0;
        addr <= 0;
    end
    always #10 clk = ~clk;

    initial
    begin
        #5 addr <= 4'd15;
        #100 $finish;

    end
endmodule
