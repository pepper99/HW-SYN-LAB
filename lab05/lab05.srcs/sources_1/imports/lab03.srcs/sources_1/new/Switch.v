`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 01:05:52 AM
// Design Name: 
// Module Name: Switch
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


module Switch(
    output wire out,
    input in,
    input clock
);
    wire q0,q1,nreset;
    assign nreset = 1;
    
    DFlipFlop d1(q0,in,clock,nreset);
    DFlipFlop d2(q1,q0,clock,nreset);
    Debouncer de(out,q1,clock);
    // SinglePulser sp(out,q2,clock);
endmodule
