`timescale 1ns / 1ps

 module top(
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
    output wire hsync, vsync,
    output wire [7:0] rgb
);

    wire [10:0] x, y;
    vga_sync vga0(.clk(clk),
        .hsync(hsync), .vsync(vsync),
        .x(x), .y(y));
    
    graphic g0(.clk(clk),
        .x(x), .y(y), .rgb(rgb));

endmodule
