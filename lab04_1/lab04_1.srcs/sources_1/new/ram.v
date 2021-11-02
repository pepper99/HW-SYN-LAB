`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 10:25:24 PM
// Design Name: 
// Module Name: ram
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


module RAM(
    output reg [7:0] dout,
    input [7:0] din,
    input [7:0] addr,
    input oe,
    input we,
    input rst,
    input clk
);

reg [7:0] mem [255:0];

always @(posedge clk)
    begin
        if(rst)
        begin
            mem[0] <= 0;
        end
        if(we)
        begin
            mem[addr] <= din;
        end
        if(oe)
        begin
            dout <= mem[addr];
        end
    end
endmodule
