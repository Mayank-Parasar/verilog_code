// concatenation and replication operator

module operator();

initial begin
	// concatenation
	$display ("{4'b1001,4'b10x1} = %b", {4'b1001,4'b10x1});
	// replication
	$display("{4{4'b1001}}  = %b", {4{4'b1001}});
	// replication and concatination
	$display ("{4{4'b1001,1'bz}} = %b", {4{4'b1001,1'bz}});
	#10 $finish;
end

endmodule