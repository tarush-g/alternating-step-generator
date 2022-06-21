`timescale 1ns / 1ps
module asg_tb();
	//testbench inputs
	reg clock_tb;
	reg reset_tb;
  	wire[3:0] out_tb;
	wire[3:0] ctrl_seed_tb = 4'b1001;
	wire[3:0] seed_0_tb = 4'b1010;
	wire[3:0] seed_1_tb = 4'b1100;
	
	//initialize clock and reset to 0
	initial begin
		clock_tb = 0;
		reset_tb = 0;
	end
	
	//tick the clock and display output value 
	always begin
		#5;
		clock_tb = ~clock_tb;
		$display("%b", out);
	end


	asg DUT(clock_tb, reset_tb, ctrl_seed_tb, seed_0_tb, seed_1_tb, out_tb);
endmodule
