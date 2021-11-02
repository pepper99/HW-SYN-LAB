`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 11:04:18 PM
// Design Name: 
// Module Name: Button
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


module Button(
    output wire out,
    input in,
    input clock
);
    wire q0,q1;
    wire nreset;
    assign nreset = 1;
    
    DFlipFlop d1(q0,in,clock,nreset);
    DFlipFlop d2(q1,q0,clock,nreset);
    SinglePulser sp(out,q1,clock);
endmodule
