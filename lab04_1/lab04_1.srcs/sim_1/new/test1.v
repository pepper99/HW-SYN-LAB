`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 09:08:29 PM
// Design Name: 
// Module Name: test1
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


module test1(

    );
    wire [7:0] size;
    wire [7:0] top;
    reg push;
    reg pop;
    reg [7:0] in;
    reg reset;
    reg clock;
    
    Stack s(size,top,push,pop,in,reset,clock);
    
    always #10 clock = ~clock;
    
    initial
    begin
        #0 clock = 0; reset = 0; push = 0; pop = 0; in = 8'd0;
        #25 in = 8'h15; push = 1;
        #10 push = 0;
        #10 in = 8'h16; push = 1;
        #10 push = 0;
        #10 in = 8'h17; push = 1;
        #10 push = 0;
        #210 pop = 1;
        #10 pop = 0;
        #50 pop = 1;
        #10 pop = 0;
        #50 pop = 1;
        #10 pop = 0;
        #200 $finish;
    end
endmodule
