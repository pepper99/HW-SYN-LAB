`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2021 05:07:35 PM
// Design Name: 
// Module Name: Stack
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


module Stack(
    output reg [7:0] size,
    output reg [7:0] top,
    input push,
    input pop,
    input [7:0] din,
    input reset,
    input clock
);

reg [7:0] mem [256:0];

initial
begin
    top <= 0;
    size <= 0;
    mem[0] <= 0;
end

always @(posedge clock)
begin
    if(push && size < 256)
    begin
        size = size + 1;
        mem[size] = din;
    end

    if(pop && size > 0)
    begin
        top = mem[size];
        size = size - 1;
    end
    
    if(reset)
    begin
        size <= 0;
        top <= 0;
    end
end
endmodule
