/* Author: Mayank Parasar */
module Q1_tb;

reg clk;
reg [7:0] d_in;
reg go_in;

wire valid_out;
wire [10:0] data_out;

always #1 clk = ~clk;

initial 
begin
	clk <= 0;
	go_in <=0;
	#3 go_in <= 1;

	d_in <= 0;
	#1 d_in <= 5;
	#3 d_in <= 3;
	#5 d_in <= 7;
	#7 d_in <= 8;
	#9 d_in <= 5;
	#11 d_in <= 3;
	#13 d_in <= 2;
	#15 d_in <= 1;

	#16 $finish;
end

/*instantiate*/

Q1 uut(
	.clk (clk),
	.go_in(go_in),
	.d_in(d_in),
	.valid_out(valid_out),
	.data_out(data_out)
	);

always @(posedge clk)
begin
	// $display("uut.PS: %b, go_in: %b", uut.PS, uut.go_in);
	// $display("uut.i_sig: %b, uut.i_reg: %b", uut.i_sig, uut.i_reg);	
end


initial begin
		$dumpfile("Q1.vcd");
		$dumpvars(0, Q1_tb);   //<= Name of the testbench module
end
endmodule