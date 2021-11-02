`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 11:54:33 PM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer(
    output reg out,
    input in,
    input clock
);
    reg nreset;

    wire idle, max;
    wire [19:0] count;

    Counter #(20) c(count, nreset, clock);

    assign idle = (out == in);
    assign max = &count;

    initial
    begin
        out <= 0;
        nreset <= 0;
    end

    always @(posedge clock)
    begin
        if(idle) nreset <= 0;
        else
            begin
                nreset <= 1;
                if(max) out <= ~out;
            end
    end

endmodule
