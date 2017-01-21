// ------------------------------------
// This is my first verilog program
// Design Name: hello_world
// File Name: hello_world.v
// Function: This program will print 'hello world'
// Coder : Mayank Parasar
// ------------------------------------
module hello_world; // this module takes no input/output

initial begin
	$display ("Hello world by Mayank");
	#10 $finish;
end

endmodule