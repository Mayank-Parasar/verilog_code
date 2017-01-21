module signed_number;

reg[31:0] a;

initial begin
	a = 14'h1234;
	$display("Current Value of a = %h", a);
	a = -14'h1234;
	$display("Current Value of a = %h", a);
	a = 32'hDEAD_BEEF;
	$display("Current Value of a = %h", a);
	a = -32'hDEAD_BEEF;
	$display("Current Value of a = %h", a);
	#10 $finish;
end

endmodule	