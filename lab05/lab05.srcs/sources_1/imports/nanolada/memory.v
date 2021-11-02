`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module memory(data,address,wr,clock,sw,seg,an);
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=16;

inout	[DATA_WIDTH-1:0]	data;
input	[ADDR_WIDTH-1:0]	address;
input wr;
input clock;
input [11:0] sw;
output [6:0] seg;
output [3:0] an;

// 32 is too much
reg	[3:0]	mem[0:1 << ADDR_WIDTH];

reg	[DATA_WIDTH-1:0]	data_out;
// Tri-State buffer
assign data=(wr==0) ? data_out:32'bz;

reg [3:0] digit0;
reg [3:0] digit1;
reg [3:0] digit2;
reg [3:0] digit3;
SevensegDisplay display(seg,an,digit0,digit1,digit2,digit3,clock);

initial
begin
	$readmemb("data.list",mem);
end

always @(address)
begin
	case (address)
		16'hFFF0: data_out = digit0;
		16'hFFF4: data_out = digit1;
		16'hFFF8: data_out = digit2;
		16'hFFFC: data_out = digit3;
		16'hFFE0: data_out = sw[3:0];
		16'hFFE4: data_out = sw[7:4];
		16'hFFE8: data_out = sw[11:8];
		default: data_out = mem[address];
	endcase
end

always @(posedge clock)
begin : MEM_WRITE
	if (wr) begin
		case (address)
			16'hFFF0: digit0 = data;
			16'hFFF4: digit1 = data;
			16'hFFF8: digit2 = data;
			16'hFFFC: digit3 = data[7:4];
			default: mem[address]=data;
		endcase
	end
end


endmodule
