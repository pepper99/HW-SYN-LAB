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


module ROM(
    output reg [7:0] dout,
    input [4:0] addr,
    input clk
);

    reg [7:0] mem [31:0];
    initial $readmemb("rom.data", mem);

    always @(posedge clk)
    begin
        dout <= mem[addr];
    end
endmodule
