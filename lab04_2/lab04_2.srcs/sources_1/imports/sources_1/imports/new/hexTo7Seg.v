`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2021 07:43:23 PM
// Design Name: 
// Module Name: hexTo7Seg
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


module HexTo7Seg(output reg [6:0] out, input [3:0] d);

    // 7-segment encoding
    //      0
    //     ---
    //  5 |   | 1
    //     --- <--6
    //  4 |   | 2
    //     ---
    //      3

    always @(d)
    case (d)
        4'b0001 : out = 7'b1111001; // 1
        4'b0010 : out = 7'b0100100; // 2
        4'b0011 : out = 7'b0110000; // 3
        4'b0100 : out = 7'b0011001; // 4
        4'b0101 : out = 7'b0010010; // 5
        4'b0110 : out = 7'b0000010; // 6
        4'b0111 : out = 7'b1111000; // 7
        4'b1000 : out = 7'b0000000; // 8
        4'b1001 : out = 7'b0010000; // 9
        4'b1010 : out = 7'b0001000; // A
        4'b1011 : out = 7'b0000011; // b
        4'b1100 : out = 7'b1000110; // C
        4'b1101 : out = 7'b0100001; // d
        4'b1110 : out = 7'b0000110; // E
        4'b1111 : out = 7'b0001110; // F
        default : out = 7'b1000000; // 0
    endcase

endmodule
