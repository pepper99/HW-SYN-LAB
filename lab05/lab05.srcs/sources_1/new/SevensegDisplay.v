`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 10:29:17 PM
// Design Name: 
// Module Name: SevensegDisplay
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


module SevensegDisplay(
	output wire [6:0] seg,
	output wire [3:0] an,
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
	input clock
);
    wire [1:0] q;
    wire [3:0] d;
    wire [3:0] sel;
    wire [19:0] counter;
    reg nreset;

    assign q = {counter[19],counter[18]};
    assign an = ~sel;

    initial nreset <= 1;

    Counter #(20) c(counter,nreset,clock);
    Mux4to1 #(4) mx(d,q,digit0,digit1,digit2,digit3);
    Decoder4 dec(sel,q);
    HexTo7Seg h(seg,d);

endmodule
