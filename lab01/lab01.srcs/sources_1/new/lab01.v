`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 12:32:01 AM
// Design Name: 
// Module Name: lab01
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


module full_adder(
    output cout,
    output s,
    input a,
    input b,
    input cin
);

    reg cout, s;

    always@(a, b, cin)
    begin
        {cout, s} = a + b + cin;
    end
endmodule

module full_adder2(cout, s, a, b, cin);
    output cout;
    output s;
    input a;
    input b;
    input cin;
    assign {cout,s} = a + b + cin;
endmodule
