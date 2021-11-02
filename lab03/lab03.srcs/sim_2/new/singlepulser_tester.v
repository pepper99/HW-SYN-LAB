`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 09:29:21 PM
// Design Name: 
// Module Name: singlepulser_tester
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


module singlepulser_tester(

);
    wire out;
    reg in, clock;
    SinglePulser c(out,in,clock);

    always #10 clock = ~clock;

    initial
    begin
        #0 clock = 0; in = 1;
        #50 in = 0;
        #40 in = 1;
        #50 in = 0;
        #100 $finish;
    end
endmodule
