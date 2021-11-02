`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2021 09:23:18 PM
// Design Name: 
// Module Name: main
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


module main(
    output wire [6:0] seg,
    output wire [3:0] an,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input [7:0] sw,
    input clk
);
    wire [1:0] q;
    wire d0,d1;
    wire [3:0] d;
    wire [3:0] digit0,digit1,digit2,digit3;
    wire [3:0] sel;
    wire [19:0] counter;

    wire [7:0] SW;
    wire [12:0] data;
    wire [9:0] addr;

    reg nreset;
    
    assign digit0 = data[3:0];
    assign digit1 = data[7:4];
    assign digit2 = data[11:8];
    
    assign digit3 = 4'd0;
    
    Button bu(BtnU,btnU,clk);
    Button bd(BtnD,btnD,clk);
    Button bl(BtnL,btnL,clk);
    Button br(BtnR,btnR,clk);
    
    genvar i;
    generate
        for(i=0;i<8;i=i+1) begin
            Switch s(SW[i],sw[i],clk);
        end
    endgenerate
    
    reg [1:0] mode;
    initial mode <= 2'd0;
    always @(posedge clk)
    begin
        if(BtnU) mode <= 2'd0;
        else if(BtnL) mode <= 2'd1;
        else if(BtnD) mode <= 2'd2;
        else if(BtnR) mode <= 2'd3;
    end
    
    assign addr = {SW,mode};
    ROM r(data,addr,clk);

    assign q = {counter[19],counter[18]};

    assign an = ~sel;
    
    initial nreset <= 1;
    Counter #(20) c(counter,nreset,clk);

    Mux4to1 #(4) mx(d,q,digit0,digit1,digit2,digit3);
    Decoder4 dec(sel,q);
    HexTo7Seg h(segments,d);
    
    wire [6:0] segments;
    wire divideByZero;
    wire minus;
    assign minus = data[12];
    assign divideByZero = (mode == 2'd3 && SW[3:0] == 4'd0);
    assign seg = (divideByZero || (minus && sel[3])) ? 7'b0111111 : segments;

endmodule
