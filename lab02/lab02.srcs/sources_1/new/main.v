`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2021 09:23:18 PM
// Design Name: 
// Module Name: main
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


module main(
    output wire [6:0] seg,
    output wire [3:0] an,
    //output wire dp,
    input clk
);
    wire [1:0] q;
    wire d0,d1;
    wire [3:0] d;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [3:0] digit2;
    wire [3:0] digit3;
    wire [3:0] sel;
    wire [19:0] counter;
    
    assign digit0 = 4'd4;
    assign digit1 = 4'd3;
    assign digit2 = 4'd2;
    assign digit3 = 4'd1;
    
    assign q = {counter[19],counter[18]};
    
    assign an = ~sel;
    Counter #(20) c(counter,clk);
    
    //assign dp = 0;
    
    Mux4to1 #(4) mx(d,q,digit0,digit1,digit2,digit3);
    Decoder4 dec(sel,q);
    HexTo7Seg h(seg,d);
    
endmodule
