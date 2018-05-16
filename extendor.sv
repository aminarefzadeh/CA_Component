`timescale 1ns / 1ns;
module signExtender(extend, extended );
	input[7:0] extend;
	output[11:0] extended;

	assign extended[7:0] = extend[7:0];
	assign extended[11:8] = {4{extend[7]}};
endmodule