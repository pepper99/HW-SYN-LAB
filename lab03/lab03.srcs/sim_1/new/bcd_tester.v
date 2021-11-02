`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 08:58:04 PM
// Design Name: 
// Module Name: bcd_tester
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


module bcd_tester(

);
    reg clock;
    wire [3:0] count;
    wire cout, bout;
    reg up, down, set9, set0;
    OneDigitBCDCounter counter(count[3],count[2],count[1],count[0],cout,bout,up,down,set9,set0,clock);

    always #10 clock = ~clock;
    
    initial clock = 0;
    
    initial
    begin
        #0 up = 1; down = 0; set0 = 0; set9 = 0;
        #400 up = 0; down = 1;
        #400 up = 1; down = 0;
        #100 up = 0; down = 1;
        #100 up = 1; down = 0;
        #400 $finish;
    end
    
    wire out;
    reg in;
    SinglePulser pulser(out,in,clock);

    initial
    begin
        #0 in = 1;
        #50 in = 0;
        #40 in = 1;
        #50 in = 0;
        #30 in = 1;
        #5 in = 0;
//        #100 $finish;
    end

endmodule
