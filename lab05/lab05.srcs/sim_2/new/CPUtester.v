`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2021 11:40:41 PM
// Design Name: 
// Module Name: CPUtester
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


module CPUtester(

    );
    // wire [31:0] pc;
    // reg [31:0] instruction;
    // wire [31:0] out;
    // wire [31:0] d_data;
    // wire mem_wr;
    // reg clock;
    // reg nreset;
    // nanocpu CPU(pc,instruction,out,d_data,mem_wr,clock,nreset);

    // always #5 clock = ~clock;

    // reg [1:0] x;
    // assign d_data = x == 0 ? 32'd1150 : (x == 1 ? -32'd2317 : 32'bZ);

    // initial begin
    //     #0
    //     clock = 0;
    //     nreset = 0;
    //     #10
    //     nreset = 1;
    //     x = 2'd0;
    //     instruction = {6'b011000,5'b00000,5'b00000,16'd1150};
    //     #10
    //     x = 2'd1;
    //     instruction = {6'b011000,5'b00001,5'b00001,16'd2317};
    //     #10
    //     x = 2'd2;
    //     instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b000};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b001};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b010};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b011};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b100};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b101};
    //     #10 instruction = {6'b000001,5'b00000,5'b00001,5'b000010,8'b00000000,3'b110};
    //     #10 $finish;
    // end

endmodule
