`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2021 09:03:11 PM
// Design Name: 
// Module Name: Mux4-1
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


module Mux4to1 #(parameter N=4) (output reg [N-1:0] M,input [1:0] sel,input[N-1:0] D0,input[N-1:0] D1,input[N-1:0] D2,input[N-1:0] D3);
    always @(sel)
    case (sel)
        2'd0 : M = D0;
        2'd1 : M = D1;
        2'd2 : M = D2;
        2'd3 : M = D3;
    endcase
endmodule
