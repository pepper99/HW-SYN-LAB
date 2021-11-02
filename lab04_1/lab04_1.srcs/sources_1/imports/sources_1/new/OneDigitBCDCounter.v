`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2021 08:32:59 PM
// Design Name: 
// Module Name: OneDigitBCDCounter
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


module OneDigitBCDCounter(
    output wire D,
    output wire C,
    output wire B,
    output wire A,
    output reg cout,
    output reg bout,
    input up,
    input down,
    input set9,
    input set0,
    input clock
);
    reg [3:0] count;
    assign {D,C,B,A} = count;

    initial
    begin
        count <= 4'b0000;
        cout <= 0;
        bout <= 0;
    end

    always @(posedge clock)
    begin
        if (set0)
        begin
            count <= 4'b0000;
            cout <= 0;
            bout <= 0;
        end
        else if(set9)
        begin
            count <= 4'b1001;
            cout <= 0;
            bout <= 0;
        end
        else if(up)
            begin
                if(count == 4'b1001)
                    begin
                        count <= 0;
                        cout <= 1;
                        bout <= 0;
                    end
                else
                    begin
                        count <= count + 1;
                        cout <= 0;
                        bout <= 0;
                    end
            end
        else if(down)
        begin
            if(count == 4'b0000)
                begin
                    count <= 4'b1001;
                    bout <= 1;
                    cout <= 0;
                end
            else
                begin
                    count <= count - 1;
                    bout <= 0;
                    cout <= 0;
                end
        end
        else
        begin
            cout <= 0;
            bout <= 0;
        end
    end

endmodule
