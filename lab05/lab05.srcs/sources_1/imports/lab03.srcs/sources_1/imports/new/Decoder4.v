`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2021 09:50:02 PM
// Design Name: 
// Module Name: Decoder4
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


module Decoder4(
    output reg [3:0] out,
    input [1:0] sel
);
    always @(sel)
    case (sel)
        2'd0 : out = 4'b0001;
        2'd1 : out = 4'b0010;
        2'd2 : out = 4'b0100;
        2'd3 : out = 4'b1000;
    endcase
endmodule
