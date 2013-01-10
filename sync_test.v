`timescale 1ns / 1ps

module sync_test;
	// Outputs
	wire hs;
	wire vs;
    
    reg    clk;
    parameter PERIOD = 10;
    
    initial
        clk = 0;
    
    always
        #(PERIOD / 2) clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	vga_sync uut (
		.clk(clk), 
		.hs(hs), 
		.vs(vs)
	);
      
endmodule
