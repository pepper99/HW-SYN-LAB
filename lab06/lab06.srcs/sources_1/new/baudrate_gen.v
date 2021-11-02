`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 09:00:47 PM
// Design Name: 
// Module Name: baudrate_gen
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


module baudrate_gen #(
    parameter baudrate = 9600,
    parameter maxcount = (100000000 / (baudrate*16)) / 2
)
(
    output reg baud,
    input clk
);

    reg [9:0] counter = 0;

    initial begin
        
    end

    always @(posedge clk)
    begin
        counter = counter + 1;
        if (counter == maxcount) begin counter = 0; baud = ~baud; end
    end

endmodule
