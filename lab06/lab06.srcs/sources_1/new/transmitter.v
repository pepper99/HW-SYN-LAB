`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 09:00:47 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter (
    output reg dout,
    output reg sent,
    input [7:0] din,
    input en,
    input clk
);

    reg last;
    reg sending;
    reg [7:0] data;
    reg [7:0] count;

    initial begin
        sending <= 0;
        count <= 0;
        dout <= 1;
    end

    always @(posedge clk) begin
        if(!sending && !last && en) begin
            data <= din;
            sending <= 1;
            sent <= 0;
            count <= 0;
        end

        last <= en;

        if(sending) count <= count+1;

        case (count)
            8'd8: dout <= 0;
            8'd24: dout <= din[0];
            8'd40: dout <= din[1];
            8'd56: dout <= din[2];
            8'd72: dout <= din[3];
            8'd88: dout <= din[4];
            8'd104: dout <= din[5];
            8'd120: dout <= din[6];
            8'd136: dout <= din[7];
            8'd152: begin sent <= 1; sending <= 0; dout <= 1; end
        endcase
    end
endmodule
