`timescale 1ns / 1ps

// pixel clock test wave
module clk_test;

    reg clk;
    parameter PERIOD = 10;

    initial
        clk = 0;

    always
        #(PERIOD / 2) clk = ~clk;

    // Outputs
    wire clk_25mhz;

    // Instantiate the Unit Under Test (UUT)
    clk_25mhz uut (
        .clk(clk),
        .clk_25mhz(clk_25mhz)
    );

endmodule
