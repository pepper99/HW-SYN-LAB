`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 12:13:59 AM
// Design Name: 
// Module Name: testDFlipFlop
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


module testDFlipFlop();
    reg clock, nreset, d;
    DFlipFlop D1(q,clock,nreset,d);
    always
    #10 clock=~clock;
    initial
    begin
        //$dumpfile("testDFlipFlop.dump");
        //$dumpvars(1,D1);
        #0 d=0;
        clock=0;
        nreset=0;
        #15 d=1;
        #20 nreset=1;
        #20 d=0;
        #20 d=1;
        #20 nreset=0;
        #20 nreset=1;
        #40 nreset=0;
        #20 $finish;
    end
endmodule
