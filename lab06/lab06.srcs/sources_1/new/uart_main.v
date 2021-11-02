`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 09:00:47 PM
// Design Name: 
// Module Name: uart_main
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


module uart_main(
    output RsTx,
    input RsRx,
    input clk
);
    
    wire baud;
    wire received, sent;
    wire [7:0] data_receive;
    reg [7:0] data_send;
    reg en;

    baudrate_gen baudgen(baud, clk);
    transmitter t(RsTx, sent, data_send, en, baud);
    receiver r(data_receive, received, RsRx, baud);

    initial begin
        en <= 1;
    end

    reg oldre;

    always @(posedge baud) begin
        if(en == 1) en <= 0;

        if(!oldre && received) begin
            data_send <= data_receive + 1;
            en <= 1;
        end
        
        oldre <= received;
    end

endmodule
