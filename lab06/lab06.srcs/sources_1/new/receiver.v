`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 09:00:47 PM
// Design Name: 
// Module Name: receiver
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


module receiver(
    output reg [7:0] dout,
    output reg received,
    input wire din,
    input wire clk
);

    reg last;
    reg receiving;
    reg [7:0] count;

    initial begin
        receiving <= 0;
        count <= 0;
    end

    always @(posedge clk) begin
        if(!receiving && last && !din) begin
            receiving <= 1;
            received <= 0;
            count <= 0;
        end

        last <= din;

        if(receiving) count <= count+1;
        case (count)
            8'd24: dout[0] <= din;
            8'd40: dout[1] <= din;
            8'd56: dout[2] <= din;
            8'd72: dout[3] <= din;
            8'd88: dout[4] <= din;
            8'd104: dout[5] <= din;
            8'd120: dout[6] <= din;
            8'd136: dout[7] <= din;
            8'd152: begin received <= 1; receiving <= 0; end
        endcase
    end

endmodule
