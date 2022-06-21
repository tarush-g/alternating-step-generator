`timescale 1ns / 1ps

module asg (
	input clock,
	input reset,
	input[3:0] seed_ctrl,
	input[3:0] seed_0,
	input[3:0] seed_1,
	output reg[3:0] out
);

	reg [3:0] control_LFSR;
	reg [3:0] LFSR_0;
	reg [3:0] LFSR_1;
	wire control_feedback = control_LFSR[0] ^ control_LFSR[1];  

	initial begin 
		control_LFSR = seed_ctrl;
		LFSR_0 = seed_0;
		LFSR_1 = seed_1;
	end

	always @(posedge clock, posedge reset) begin
		if(!reset) begin
			control_LFSR = {control_feedback, control_LFSR[3:1]};

			if(control_feedback == 1)
				LFSR_1 = {LFSR_1[1] ^ LFSR_1[0], LFSR_1[3:1]};
			else
				LFSR_0 = {LFSR_0[1] ^ LFSR_0[0], LFSR_0[3:1]};

			out = LFSR_0 ^ LFSR_1;
		end
		else out = 4'b0000;
	end
endmodule