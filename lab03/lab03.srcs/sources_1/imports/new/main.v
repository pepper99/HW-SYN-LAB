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
    //output wire dp,
    input btnC,
    input btnU,
    input [7:0] sw,
    input clk
);
    wire [1:0] q;
    wire d0,d1;
    wire [3:0] d;
    wire [3:0] digit0,digit1,digit2,digit3;
    wire [3:0] sel;
    wire [19:0] counter;

    wire [3:0] coutP,boutP,cout,bout,up,down,set0,set9;
    wire [7:0] SW;

    reg nreset;
    wire max, min;
    
    assign max = digit0 == 4'b1001 && digit1 == 4'b1001 && digit2 == 4'b1001 && digit3 == 4'b1001;
    assign min = digit0 == 4'b0000 && digit1 == 4'b0000 && digit2 == 4'b0000 && digit3 == 4'b0000;

    assign up[0] = SW[0] & ~max;
    assign down[0] = SW[1] & ~min;

    assign up[1] = (SW[2] | cout[0]) & ~max;
    assign down[1] = (SW[3] | bout[0]) & ~min;

    assign up[2] = (SW[4] | cout[1]) & ~max;
    assign down[2] = (SW[5] | bout[1]) & ~min;

    assign up[3] = (SW[6] | cout[2]) & ~max;
    assign down[3] = (SW[7] | bout[2]) & ~min;

    assign set0[0] = BtnC | bout[3];
    assign set0[1] = BtnC | bout[3];
    assign set0[2] = BtnC | bout[3];
    assign set0[3] = BtnC | bout[3];

    assign set9[0] = BtnU | cout[3];
    assign set9[1] = BtnU | cout[3];
    assign set9[2] = BtnU | cout[3];
    assign set9[3] = BtnU | cout[3];

    Button bc(BtnC,btnC,clk);
    Button bu(BtnU,btnU,clk);
    
    Switch s0(SW[0],sw[0],clk);
    Switch s1(SW[1],sw[1],clk);
    Switch s2(SW[2],sw[2],clk);
    Switch s3(SW[3],sw[3],clk);
    Switch s4(SW[4],sw[4],clk);
    Switch s5(SW[5],sw[5],clk);
    Switch s6(SW[6],sw[6],clk);
    Switch s7(SW[7],sw[7],clk);

//    SinglePulser c0(coutP[0],cout[0],clk);
//    SinglePulser c1(coutP[1],cout[1],clk);
//    SinglePulser c2(coutP[2],cout[2],clk);
//    SinglePulser c3(coutP[3],cout[3],clk);

//    SinglePulser b0(boutP[0],bout[0],clk);
//    SinglePulser b1(boutP[1],bout[1],clk);
//    SinglePulser b2(boutP[2],bout[2],clk);
//    SinglePulser b3(boutP[3],bout[3],clk);

    OneDigitBCDCounter D0(digit0[3],digit0[2],digit0[1],digit0[0],cout[0],bout[0],up[0],down[0],set9[0],set0[0],clk);
    OneDigitBCDCounter D1(digit1[3],digit1[2],digit1[1],digit1[0],cout[1],bout[1],up[1],down[1],set9[1],set0[1],clk);
    OneDigitBCDCounter D2(digit2[3],digit2[2],digit2[1],digit2[0],cout[2],bout[2],up[2],down[2],set9[2],set0[2],clk);
    OneDigitBCDCounter D3(digit3[3],digit3[2],digit3[1],digit3[0],cout[3],bout[3],up[3],down[3],set9[3],set0[3],clk);

    assign q = {counter[19],counter[18]};

    assign an = ~sel;
    
    initial nreset <= 1;
    Counter #(20) c(counter,nreset,clk);

    //assign dp = 0;

    Mux4to1 #(4) mx(d,q,digit0,digit1,digit2,digit3);
    Decoder4 dec(sel,q);
    HexTo7Seg h(seg,d);

endmodule
