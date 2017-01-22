module mux_from_gates ();
reg c0, c1, c2, c3, A, B;
wire Y;

// ---Do note that----
// We have not provided the instance name.. but
// since it is outside always block (procedural block)
// it will always be computed.. i.e the relationship
// specified here between wires will hold....

// This is example of implicit call for port binding..
// and we are not even giving name of the instance..
// something like specifing unnamed global relationship...

// Invert the sel signals
not (a_inv, A); // interstingly.. input is driven from register...
not (b_inv, B);

// 3-input AND gate
and (y0, c0, a_inv, b_inv);
and (y1, c1, a_inv, B);
and (y2, c2, A, b_inv);
and (y3, c3, A, B);
// 4-input OR gate
or (Y, y0, y1, y2, y3);

// Testbench Code goes here...
initial begin
	$monitor (
		"c0 = %b c1 = %b c2 = %b c3 = %b A = %b B = %b Y = %b",
		c0, c1, c2, c3, A, B, Y);
	c0 = 0;
	c1 = 0;
	c2 = 0;
	c3 = 0;
	A = 0;
	B = 0;
	#1 A = 1;
	#1 B = 1;
	#1 A = 0;
	#8 $finish;
end

always #1 c0 = ~c0;
always #1 c1 = ~c1;
always #1 c2 = ~c2;
always #1 c3 = ~c3;

endmodule