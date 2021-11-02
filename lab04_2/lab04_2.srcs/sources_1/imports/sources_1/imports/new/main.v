`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2021 09:23:18 PM
// Design Name: 
// Module Name: main
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


module main(
    output wire [6:0] seg,
    output wire [3:0] an,
    //output wire dp,
    input btnC,
    input btnU,
    input btnD,
    input [7:0] sw,
    input clk
);
    wire [1:0] q;
    wire d0,d1;
    wire [3:0] d;
    wire [3:0] digit0,digit1,digit2,digit3;
    wire [3:0] sel;
    wire [19:0] counter;

    wire [4:0] SW;
    wire [7:0] data;

    reg nreset;
    
    ROM r(data,SW,clk);
    
    assign digit0 = data[3:0];
    assign digit1 = data[7:4];
    
    assign digit2 = 4'd0;
    assign digit3 = 4'd0;
    
    genvar i;
    generate
        for(i=0;i<5;i=i+1) begin
            Switch s(SW[i],sw[i],clk);
        end
    endgenerate

    assign q = {counter[19],counter[18]};

    assign an = ~sel;
    
    initial nreset <= 1;
    Counter #(20) c(counter,nreset,clk);

    Mux4to1 #(4) mx(d,q,digit0,digit1,digit2,digit3);
    Decoder4 dec(sel,q);
    HexTo7Seg h(seg,d);

endmodule
