module fileio;

integer in,out, mon;
reg clk;

reg enable;
wire valid;
reg [31:0] din;
reg [31:0] exp;
wire [31:0] dout;
integer statusI, statusO;

dut dut (clk, enable, din, dout, valid); // instantiated the dut

initial begin
	clk = 0;
	enable = 0;
	din = 0;
	exp = 0;
	in = $fopen("input.txt", "r"); // 'in' is a descriptor for file 'input.txt'
	out = $fopen("output.txt", "r"); // 'out' is a descriptor for file 'output.txt'
	mon = $fopen("monitor.txt", "w");  // 'mon' is a descriptor for file 'monitor.txt'
end

always #1 clk = ~clk;

// DUT input driver code
initial begin
	repeat(10) @ (posedge clk);
	while (!$feof(in)) begin
		@(negedge clk); // what does this mean? This means wait for one clock
		enable = 1;
		statusI = $fscanf(in, "%h %h\n", din[31:16], din[15:0]);
		@(negedge clk);
		enable = 0;
	end
	repeat(10) @ (posedge clk);
	$fclose(in);
	$fclose(out);
	$fclose(mon);
	#100 $finish;
end

// DUT output monitor and compare logic
always @ (posedge clk)
	if (valid) begin
		$fwrite(mon,"%h %h\n", dout[31:16], dout[15:0]);
		statusO = $fscanf(out, "%h %h\n", exp[31:16], exp[15:0]);
		if (dout !== exp) begin
			$display("%0dns Error: input and output does not match", $time);
			$display("	Got %h", dout);
			$display("	Exp %h", exp);
		end else begin
			$display("%0dns Match : input and output match", $time);
			$display("		Got %h", dout);
			$display("		Exp %h", exp);
		end
	end

endmodule

// DUT model
module dut(
input wire clk, enable,
input wire [31:0] din,
output reg [31:0] dout,
output reg			valid
);

always @ (posedge clk) begin
	dout <= din + 1;
	valid <= enable;
end

endmodule