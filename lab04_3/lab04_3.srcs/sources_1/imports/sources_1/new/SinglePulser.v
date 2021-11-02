`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 09:21:47 PM
// Design Name: 
// Module Name: SinglePulser
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


module SinglePulser(
    output reg out,
    input in,
    input clock
);
reg current;

initial
begin
    current <= 0;
    out <= 0;
end

always @(posedge clock)
begin
    if(in && !current)
    begin
        current <= 1;
        out <= 1;
    end
    else if(!in && current)
    begin
        current <= 0;
        out <= 0;
    end 
    else
    begin
        out <= 0;
    end
end

endmodule
