`timescale 1ns / 1ps

module top(
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
    output wire hs, vs,
    output wire [2:0] rgb
);

    vga_sync vga_sync(.clk(clk), .hs(hs), .vs(vs));

endmodule
