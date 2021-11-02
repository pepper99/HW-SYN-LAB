`timescale 1ns / 1ns
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
	input [11:0] sw,
	input clock
);
    wire 	[31:0]	p_address;
	wire 	[31:0]	p_data;
	wire	[31:0]	d_address;
	wire	[31:0]	d_data;
	wire wr;
	reg		nreset;

	wire [11:0] SW;

	nanocpu	CPU(p_address,p_data,d_address,d_data,wr,clock,nreset);
	rom2 	PROGMEM(p_data,p_address[17:2]);
	memory 	DATAMEM(d_data,d_address[15:0],wr,clock,SW,seg,an);

	initial nreset=1;

	genvar i;
	generate
		for(i = 0; i < 12; i=i+1) begin
			Switch s(SW[i],sw[i],clock);
		end
	endgenerate

endmodule
