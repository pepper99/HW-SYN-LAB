`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2021 11:13:51 PM
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter N=20)(
    output reg [N-1:0] counter,
    input nreset,
    input clk
);
    initial counter = 0;
    
    always @(posedge clk or negedge nreset)
    begin
        if(!nreset) counter <= 0;
        else counter <= counter + 1;
    end
endmodule
