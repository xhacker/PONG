`timescale 1ns / 1ps

 module top(
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
    output wire hsync, vsync,
    output wire [7:0] rgb
);

    wire [10:0] x, y;
    vga_sync vga_sync(.clk(clk),
        .hsync(hsync), .vsync(vsync),
        .x(x), .y(y));

    assign rgb[0] = y[3] | (x == 256);
    assign rgb[1] = y[3] | (x == 256);
    assign rgb[2] = y[3] | (x == 256);
    assign rgb[3] = (x[5] ^ x[6]) | (x == 256);
    assign rgb[4] = (x[5] ^ x[6]) | (x == 256);
    assign rgb[5] = (x[5] ^ x[6]) | (x == 256);
    assign rgb[6] = x[4] | (x == 256);
    assign rgb[7] = x[4] | (x == 256);

endmodule
