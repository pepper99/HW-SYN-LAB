`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 02:08:07 AM
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


module tester(

);
    reg clock;
    wire [3:0] digit0,digit1,digit2,digit3;
    wire [6:0] seg;
    wire [3:0] an;
    
    reg btnC, btnU;
    reg [7:0] sw;
    

    
    main m(seg,an,digit3,digit2,digit1,digit0,btnC,btnU,sw,clock);

    always #10 clock = ~clock;

    initial
    begin
        #0 clock = 0; btnC = 0; btnU = 0; sw = 8'b00000000; sw[0] = 1;
        #100000 $finish;
    end
endmodule
