module comma_edge_example();

reg clk, reset, d;
reg q, q95;

// Verilog 2k example for ussage of comma
always @ (posedge clk, posedge reset) begin : V2K
	if (reset) begin
		q <= 0;
	end else begin
		q <= d;
	end
end

// Verilog 95 example for above code
always @ (posedge clk or posedge reset) begin : V95
	if (reset) begin
		q95 <= 0;
	end else begin
		q95 <= d;
	end
end

initial begin
	$monitor("%g clk=%b reset=%b d=%b q=%b q95=%b",
		$time, clk, reset, d, q, q95);
	clk = 0;
	reset = 0;
	d = 0;
	#4 reset = 1;
	#4 reset = 0;
	#1 d = 1;
	#10 $finish;
end

initial #1 forever clk = #1 ~clk;

endmodule