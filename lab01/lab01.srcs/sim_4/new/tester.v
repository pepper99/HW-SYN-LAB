`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 12:35:22 AM
// Design Name: 
// Module Name: tester
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


module tester();
    reg clock, d;
    wire[1:0] qA, qB;
    shiftA sa(qA,clock,d);
    shiftB sb(qB,clock,d);
    always
    #10 clock=~clock;
    always
    #6 d=~d;
    initial
    begin
        $monitor("time %t: {%b %b} <- {%d}", $time,qA[0],qA[1],d);
        //$dumpfile("testDFlipFlop.dump");
        //$dumpvars(1,D1);
        #0 d=0;
        clock=0;
        #200 $finish;
    end
endmodule
