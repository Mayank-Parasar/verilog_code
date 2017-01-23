// Verilog 2001 allows port direction and data type in the 
// port list of the module...
module ansiport_example();

reg read, write = 0;
reg [7:0] data_in = 0;
reg [3:0] addr = 0;
wire [7:0] data_v95, data_notype, data_ansi;

initial begin
	$monitor (
	"%g rd=%b wr=%b addr=%b data_in=%h data_v95=%h data_notype=%h data_ansi=%h",
	$time, read, write, addr, data_in, data_v95, data_notype, data_ansi);
	#1 read = 0;	 // why only for read? Because 'write' has been defined above
	#3 repeat(16) begin
		data_in = $random;
		write = 1;
		#1 addr = addr +1;
	end
	write = 0;
	addr = 0;
	#3 repeat (16) begin
		read = 1;
		#1 addr = addr + 1;
	end
	read = 0;
	#1 $finish;
end

memory_v95			U(read, write, data_in, addr, data_v95);
memory_ansi_notype	W(read, write, data_in, addr, data_notype);
memory_ansi 		V(read, write, data_in, addr, data_ansi);

endmodule

// Verilog 95 code
module memory_v95 ( read, write, data_in, addr, data_out );
input read;
input write;
input [7:0] data_in;
input [3:0] addr;
output [7:0] data_out;

reg [7:0] data_out;
reg [7:0] mem [0:15]; // Note: example of 2-D array: memory

always @ (*) begin // it will always execute asynchronously..
	if(write) mem[addr] = data_in;
end

always @ (read or addr) begin // this is an example of level sensitive trigger...
	if(read) data_out = mem[addr];
end

endmodule

// Verilog 2k with notype in port list
module memory_ansi_notype(
input 	read,
input 	write,
input 	[7:0] data_in,
input	[3:0] addr,
output	[7:0] data_out
);

reg [7:0] mem [0:15]; // its like a memory module...
always @ (*) begin
	if (write) mem[addr] = data_in;
end

assign data_out = (read) ? mem[addr]:0;

endmodule

// Verilog 2k with width and data type listed
module memory_ansi (
input wire read,
input wire write,
input wire [7:0] data_in,
input wire [3:0] addr,
output reg [7:0] data_out
);

reg [7:0] mem [0:15];

always @ (*) begin
	if(write) mem[addr] = data_in;
end

always @ (read, addr) begin
	if (read) data_out = mem[addr];
end

endmodule